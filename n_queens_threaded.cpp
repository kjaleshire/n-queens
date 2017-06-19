#include <bitset>
#include <cmath>
#include <iostream>
#include <vector>
#include <thread>
#include <atomic>
#include <array>
#include <mutex>
#include <stack>
#include <chrono>

#ifdef _MSC_VER
#include <intrin.h>
#pragma intrinsic(_BitScanForward)
#endif

#define N_QUEENS 16
#define NO_PRINT 1
#define N_THREADS 1

std::mutex coutTex;

class SolutionState {

public:
	std::shared_ptr<SolutionState> lastState;
	int attackLeft;
	int attackRight;
	int attackCenter;
	unsigned long queenIndex;
	int counter;

	SolutionState(std::shared_ptr<SolutionState> s,
		int l, int r, int c, unsigned long q, int co) : lastState(s),
		attackLeft(l), attackRight(r), attackCenter(c),
		queenIndex(q), counter(co) {}
};

void printRow(unsigned long index) {
	for (auto i = 0; i < (N_QUEENS - 1 - index); i++) {
		std::cout << "_ ";
	}
	std::cout << "Q ";
	for (auto i = 0; i < index; i++) {
		std::cout << "_ ";
	}
}

#ifdef NO_PRINT
void printSolution(std::shared_ptr<SolutionState> state) {}
#else
void printSolution(std::shared_ptr<SolutionState> state) {
	std::vector<unsigned long> queenIndexes;

	while (state != nullptr) {
		queenIndexes.push_back(state->queenIndex);
		state = state->lastState;
	}

	coutTex.lock();
	while (!queenIndexes.empty()) {
		auto index = queenIndexes.back();
		queenIndexes.pop_back();
		printRow(index);
		std::cout << std::endl;
	}

	std::cout << "======== ========" << std::endl;
	coutTex.unlock();
}
#endif

void lock(std::mutex& lock) {
	lock.lock();
}

void lock(std::atomic_bool& lock) {
	auto expected = false;
	while (true) {
		if (!lock.compare_exchange_weak(expected, true, std::memory_order_acquire, std::memory_order_relaxed))
			return;

		std::this_thread::sleep_for(std::chrono::microseconds(250));
	}
}

void unlock(std::mutex& lock) {
	lock.unlock();
}

void unlock(std::atomic_bool& lock) {
	lock.store(false, std::memory_order_release);
}

void worker(std::atomic_int& solutionCounter, std::stack<std::shared_ptr<SolutionState>>& workQueue, std::mutex& qTex) {
	while (true) {
		lock(qTex);
		// no work left, quit
		if (workQueue.empty()) {
			unlock(qTex);
			return;
		}

		auto state = workQueue.top();
		workQueue.pop();
		unlock(qTex);

		// std::cout << state->counter << " ";
		// printRow(state->queenIndex);
		// if(state->lastState != nullptr) {
		//   std::cout << " PQ ";
		//   printRow(state->lastState->queenIndex);
		// }
		// std::cout << std::endl;

		// found win state
		if (state->counter == N_QUEENS) {
			printSolution(state);
			// std::cout << ".";
			solutionCounter.fetch_add(1, std::memory_order_acq_rel);
			continue;
		}

		auto attackMask = 1 << state->queenIndex;

		auto attackLeft = (attackMask | state->attackLeft) >> 1;
		auto attackRight = (attackMask | state->attackRight) << 1;
		auto attackCenter = attackMask | state->attackCenter;

		std::bitset<N_QUEENS> newAllowedState = ~(attackLeft | attackRight | attackCenter);

		while (newAllowedState.any()) {
			auto newState = std::make_shared<SolutionState>(state, attackLeft, attackRight, attackCenter, 0, state->counter + 1);

#ifdef _MSC_VER
			_BitScanForward(&newState->queenIndex, newAllowedState.to_ulong());
#else
			newState->queenIndex = __builtin_ctz(newAllowedState.to_ulong());
#endif
			newAllowedState.set(newState->queenIndex, 0);

			// std::cout << "\t\t\t\t\t" << newState->counter << " ";
			// printRow(newState->queenIndex);
			// if(newState->lastState != nullptr) {
			//   std::cout << " PQ ";
			//   printRow(newState->lastState->queenIndex);
			// }
			// std::cout << std::endl;

			lock(qTex);
			workQueue.push(newState);
			unlock(qTex);
		}
	}
}

int main(int argc, char **argv) {
	std::atomic_bool qLock(false);
	std::atomic_int solutionCounter(0);
	std::stack<std::shared_ptr<SolutionState>> workQueue;
	std::array<std::thread, N_THREADS> threadHandles;
	std::mutex qTex;

	for (auto i = 0; i < N_QUEENS; i++) {
		auto state = std::make_shared<SolutionState>(nullptr, 0, 0, 0, 0, 1);
		state->queenIndex = i;

		workQueue.push(state);
	}

	for (auto i = 0; i < N_THREADS; i++) {
		std::thread t(worker, std::ref(solutionCounter), std::ref(workQueue), std::ref(qTex));
		threadHandles[i] = std::move(t);
	}

	for (auto& t : threadHandles)
		t.join();

	// done
	std::cout << "\nSolutions found: " << solutionCounter << std::endl;
	return solutionCounter.load();
}

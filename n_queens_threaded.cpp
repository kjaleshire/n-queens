#include <bitset>
#include <cmath>
#include <iostream>
#include <vector>
#include <thread>
#include <atomic>
#include <queue>
#include <mutex>

#ifdef _MSC_VER
#include <intrin.h>
#pragma intrinsic(_BitScanForward)
#endif

#define N_QUEENS 4
// #define NO_PRINT 1
#define THREADS 8

class SolutionState {

public:
  std::shared_ptr<SolutionState> lastState;
  std::bitset<N_QUEENS> allowedState;
  int attackLeft;
  int attackRight;
  int attackCenter;
  unsigned long queenIndex;
  int counter;

  SolutionState(std::shared_ptr<SolutionState> s, std::bitset<N_QUEENS> a,
                int l, int r, int c, unsigned long q, int co) : lastState(s),
                allowedState(a), attackLeft(l), attackRight(r), attackCenter(c),
                queenIndex(q), counter(co) {}
};

void printRow(int index) {
  for (auto i = 0; i < (N_QUEENS - 1 - index); i++) {
    std::cout << "_ ";
  }
  std::cout << "Q ";
  for (auto i = 0; i < index; i++) {
    std::cout << "_ ";
  }
  std::cout << std::endl;
}

#ifdef NO_PRINT
void printSolution(std::shared_ptr<SolutionState> state) {}
#else
void printSolution(std::shared_ptr<SolutionState> state) {
  std::vector<int> queenIndexes;

  std::shared_ptr<SolutionState> s = state;
  while(s != nullptr) {
    queenIndexes.push_back(s->queenIndex);
    s = s->lastState;
  }

  for (auto rit = queenIndexes.rbegin(); rit != queenIndexes.rend(); ++rit)
    printRow(*rit);

  std::cout << "======== ========" << std::endl;
}
#endif

void worker(std::atomic_int& solutionCounter, std::queue<std::shared_ptr<SolutionState>>& workQueue, std::mutex& qTex) {
  while(true) {
    qTex.lock();
    std::shared_ptr<SolutionState> state = workQueue.front();
    workQueue.pop();
    qTex.unlock();

    // no work left, quit
    if(state == nullptr)
      break;

    // win
    if (state->counter == N_QUEENS - 1 && state->allowedState.any()) {
      printSolution(state);

      solutionCounter++;
      return;
    }

    auto attackMask = state->allowedState.to_ulong();

    auto attackLeft = (attackMask | state->attackLeft) >> 1;
    auto attackRight = (attackMask | state->attackRight) << 1;
    auto attackCenter = attackMask | state->attackCenter;

    auto newState = std::make_shared<SolutionState>(state, 0, attackLeft, attackRight, attackCenter, 0, state->counter + 1);

    std::bitset<N_QUEENS> newAllowedState = ~(newState->attackLeft | newState->attackRight | newState->attackCenter);

    while(newAllowedState.any()) {
  #ifdef _MSC_VER
      _BitScanForward(&newState->queenIndex, newAllowedState.to_ulong());
  #else
      newState->queenIndex = __builtin_ctz(newAllowedState.to_ulong());
  #endif
      newAllowedState.set(newState->queenIndex, 0);
      newState->allowedState = 1 << newState->queenIndex;

      qTex.lock();
      workQueue.push(newState);
      qTex.unlock();
    }
  }
}

int main(int argc, char **argv) {
  std::atomic_int solutionCounter(0);
  std::queue<std::shared_ptr<SolutionState>> workQueue;
  std::mutex qTex;
  std::vector<std::thread> threadHandles;

  for(auto i = 0; i < N_QUEENS; i++) {
    auto state = std::make_shared<SolutionState>(nullptr, 0, 0, 0, 0, 0, 0);
    state->queenIndex = i;
    state->allowedState = 1 << i;

    workQueue.push(state);
  }

  for(auto i = 0; i < 1; i++) {
    std::thread t(worker, std::ref(solutionCounter), std::ref(workQueue), std::ref(qTex));
    threadHandles.push_back(std::move(t));
  }

  for(auto& t : threadHandles)
    t.join();

  // done
  std::cout << "Solutions found: " << solutionCounter << std::endl;
}

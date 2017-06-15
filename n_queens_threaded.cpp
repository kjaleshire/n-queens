#include <bitset>
#include <cmath>
#include <iostream>
#include <vector>
#include <thread>
#include <atomic>

#ifdef _MSC_VER
#include <intrin.h>
#pragma intrinsic(_BitScanForward)
#endif

#define N_QUEENS 10
#define NO_PRINT 1
#define THREADS 8

struct SolutionState {
  std::shared_ptr<SolutionState> lastState;
  std::bitset<N_QUEENS> allowedState;
  unsigned long attackLeft;
  unsigned long attackRight;
  unsigned long attackCenter;
  unsigned long queenIndex;
  unsigned long counter;

  SolutionState(std::shared_ptr<SolutionState> s, std::bitset<N_QUEENS> a,
                unsigned long l, unsigned long r, unsigned long c,
                unsigned long q, unsigned long co) : lastState(s),
                allowedState(a), attackLeft(l), attackRight(r), attackCenter(c),
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
  std::cout << std::endl;
}

#ifdef NO_PRINT
void printSolution(std::shared_ptr<SolutionState> state) {}
#else
void printSolution(std::shared_ptr<SolutionState> state) {
  std::vector<unsigned long> queenIndexes;

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

void spawnWorker(std::shared_ptr<SolutionState> state, std::atomic_int& solutionCounter) {
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

    spawnWorker(newState, solutionCounter);
  }
}

int main(int argc, char **argv) {
  std::atomic_int solutionCounter(0);

  for(auto i = 0; i < N_QUEENS; i++) {
    auto state = std::make_shared<SolutionState>(nullptr, 0, 0, 0, 0, 0, 0);
    state->queenIndex = i;
    state->allowedState = 1 << i;

    spawnWorker(state, solutionCounter);
  }

  // done
  std::cout << "Solutions found: " << solutionCounter << std::endl;
}

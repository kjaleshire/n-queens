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

#define N_QUEENS 8
// #define NO_PRINT 1
#define THREADS 8

struct SolutionState {
  SolutionState* lastState;
  std::bitset<N_QUEENS> allowedState;
  unsigned long attackLeft;
  unsigned long attackRight;
  unsigned long attackCenter;
  unsigned long queenIndex;
  unsigned long counter;
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
void printSolution(SolutionState& state) {}
#else
void printSolution(SolutionState& state) {
  std::vector<unsigned long> queenIndexes;

  SolutionState* s = &state;
  while(s != nullptr) {
    queenIndexes.push_back(s->queenIndex);
    s = s->lastState;
  }

  for (auto rit = queenIndexes.rbegin(); rit != queenIndexes.rend(); ++rit)
    printRow(*rit);

  std::cout << "======== ========" << std::endl;
}
#endif

void spawnWorker(SolutionState& state, std::atomic_int& solutionCounter) {
  // win
  if (state.counter == N_QUEENS - 1 && state.allowedState.any()) {
    printSolution(state);

    solutionCounter++;
    return;
  }

  auto attackMask = state.allowedState.to_ulong();

  auto attackLeft = (attackMask | state.attackLeft) >> 1;
  auto attackRight = (attackMask | state.attackRight) << 1;
  auto attackCenter = attackMask | state.attackCenter;

  SolutionState newState = {
    &state, 0, attackLeft, attackRight, attackCenter, 0, state.counter + 1,
  };

  std::bitset<N_QUEENS> newAllowedState = ~(newState.attackLeft | newState.attackRight | newState.attackCenter);

  while(newAllowedState.any()) {
#ifdef _MSC_VER
    _BitScanForward(&newState.queenIndex, newAllowedState.to_ulong());
#else
    newState.queenIndex = __builtin_ctz(newAllowedState.to_ulong());
#endif
    newAllowedState.set(newState.queenIndex, 0);
    newState.allowedState = 1 << newState.queenIndex;

    spawnWorker(newState, solutionCounter);
  }
}

int main(int argc, char **argv) {
  SolutionState state = { nullptr, 0, 0, 0, 0, 0, 0};
  std::atomic_int solutionCounter(0);

  for(auto i = 0; i < N_QUEENS; i++) {
    state.queenIndex = i;
    state.allowedState = 1 << i;

    spawnWorker(state, solutionCounter);
  }

  // done
  std::cout << "Solutions found: " << solutionCounter << std::endl;
}

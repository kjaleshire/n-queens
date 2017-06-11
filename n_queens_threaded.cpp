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
  if (state.counter == N_QUEENS - 1) {
    printSolution(state);

    solutionCounter++;
    return;
  }

  auto attackMask = 1 << state.queenIndex;

  auto attackLeft = (attackMask | state.attackLeft) >> 1;
  auto attackRight = (attackMask | state.attackRight) << 1;
  auto attackCenter = attackMask | state.attackCenter;

  SolutionState newState = {
    &state, attackLeft, attackRight, attackCenter, 0, state.counter + 1,
  };

  std::bitset<N_QUEENS> newAllowedState = ~(newState.attackLeft | newState.attackRight | newState.attackCenter);

  while(newAllowedState.any()) {
#ifdef _MSC_VER
    _BitScanForward(&newState.queenIndex, newAllowedState.to_ulong());
#else
    newState.queenIndex = __builtin_ctz(newAllowedState.to_ulong());
#endif
    newAllowedState.set(newState.queenIndex, 0);

    spawnWorker(newState, solutionCounter);
  }
}

int main(int argc, char **argv) {
  SolutionState state = { nullptr, 0, 0, 0, 0, 0};
  std::atomic_int solutionCounter(0);

  for(auto i = 0; i < N_QUEENS; i++) {
    state.queenIndex = i;

    spawnWorker(state, solutionCounter);
  }

  // done
  std::cout << "Solutions found: " << solutionCounter << std::endl;
}

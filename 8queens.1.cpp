// c++ vector

// next state:
//   if current allowed state is empty
//     if vector is empty
//       exit
//     pop last state
//     GOTO next state

//   find least significant set bit position in current allowed state

//   clear said bit in current allowed state
//   if vector size is N_QUEENS - 1
//     increment solution counter
//     print solution
//     GOTO next state

//   push current state

//   shift attack mask left by index of last cleared byte
//   OR with and save to each current attack state

//   shift left attack right by 1
//   shift right attach left by 1

//   OR left-right-center attacks into scratch
//   invert scratch
//   copy to current allowed state
//   GOTO next state

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
#define NO_PRINT 1
#define THREADS 8

struct SolutionState {
  SolutionState& lastState;
  std::bitset<N_QUEENS> allowedState;
  unsigned int attackLeft;
  unsigned int attackRight;
  unsigned int attackCenter;
  unsigned long queenIndex;
  unsigned int counter;
};

void printRow(unsigned int index) {
  for (int i = 0; i < (N_QUEENS - 1 - index); i++) {
    std::cout << "_ ";
  }
  std::cout << "Q ";
  for (int i = 0; i < index; i++) {
    std::cout << "_ ";
  }
  std::cout << std::endl;
}

void spawn_worker(SolutionState& state, std::atomic_int& solutionCounter) {
  printRow(state.queenIndex);

  unsigned int attackMask = state.allowedState.to_ulong();

  state.attackLeft = attackMask | state.attackLeft;
  state.attackRight = attackMask | state.attackRight;
  state.attackCenter = attackMask | state.attackCenter;

  state.attackLeft = state.attackLeft >> 1;
  state.attackRight = state.attackRight << 1;

  state.allowedState = ~(state.attackLeft | state.attackRight | state.attackCenter);

  // win
  if (state.counter == 7 && state.allowedState.any()) {
    std::cout << "solution!" << std::endl;
    exit(0);
    solutionCounter++;
    return;
  }

  state.counter += 1;
  while(state.allowedState.any()) {
#ifdef _MSC_VER
    _BitScanForward(&state.queenIndex, state.allowedState.to_ulong());
#else
    state.queenIndex = __builtin_ctz(state.allowedState.to_ulong());
#endif
    state.allowedState.set(state.queenIndex, 0);
    SolutionState newState = state;
    newState.lastState = state;

    newState.allowedState = 1 << newState.queenIndex;

    spawn_worker(newState, solutionCounter);
  }
}

int main(int argc, char **argv) {
  SolutionState state = { 0, 0, 0, 0, 0, 0};
  std::atomic_int solutionCounter(0);
  unsigned long queenIndex;

  for(unsigned long i = 0; i < N_QUEENS; i++) {
    SolutionState newState = state;

    state.queenIndex = i;
    newState.allowedState.set(i, 1);

    spawn_worker(newState, solutionCounter);
  }

  // done
  std::cout << "Solutions found: " << std::to_string(solutionCounter) << std::endl;
}

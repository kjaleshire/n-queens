// c++ vector

// next state:
//   if current allowed state is empty
//     if vector is empty
//       exit
//     pop last state
//     GOTO next state

//   find least significant set bit position in current allowed state

//   clear said bit in current allowed state
//   if vector size is N - 1
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

#ifdef _MSC_VER
#include <intrin.h>
#pragma intrinsic(_BitScanForward)
#endif

#define N 8

struct SolutionState {
  std::bitset<N> allowedState;
  unsigned int attackLeft;
  unsigned int attackRight;
  unsigned int attackCenter;
  unsigned long queenIndex;
};

void printRow(unsigned int index) {
  for (int i = 0; i < (N - 1 - index); i++) {
    std::cout << "_ ";
  }
  std::cout << "Q ";
  for (int i = 0; i < index; i++) {
    std::cout << "_ ";
  }
  std::cout << std::endl;
}

void printSolution(std::vector<SolutionState>& solutionStates, SolutionState currentState) {
  for (SolutionState state : solutionStates) {
    printRow(state.queenIndex);
  }
  printRow(currentState.queenIndex);
  std::cout << "======== ========" << std::endl;
}

int main(int argc, char ** argv) {
  SolutionState state = { std::pow(2, N) - 1, 0, 0, 0, 0};

  int solutionCounter = 0;

  std::vector<SolutionState> solutionStates;
  solutionStates.reserve(N - 1);

  while(true) {
    if(state.allowedState == 0) {
      // backtrack
      if (solutionStates.size() == 0)
        break;

      state = solutionStates.back();
      solutionStates.pop_back();

      continue;
    }

#ifdef _MSC_VER
    _BitScanForward(&state.queenIndex, state.allowedState.to_ulong());
#else
    state.queenIndex = __builtin_ctz(state.allowedState.to_ulong());
#endif
    state.allowedState = state.allowedState.to_ulong() & ~(1 << state.queenIndex);

    // win
    if (solutionStates.size() == N - 1) {
      solutionCounter += 1;
      printSolution(solutionStates, state);
      continue;
    }

    solutionStates.push_back(std::move(state));

    unsigned int attackMask = 1 << state.queenIndex;

    state.attackLeft = attackMask | state.attackLeft;
    state.attackRight = attackMask | state.attackRight;
    state.attackCenter = attackMask | state.attackCenter;

    state.attackLeft = state.attackLeft >> 1;
    state.attackRight = state.attackRight << 1;

    state.allowedState = ~(state.attackLeft | state.attackRight | state.attackCenter);
  }

  // done
  std::cout << "DONE: " << std::to_string(solutionCounter) << std::endl;
}

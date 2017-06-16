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

#ifdef _MSC_VER
#include <intrin.h>
#pragma intrinsic(_BitScanForward)
#endif

#define N_QUEENS 5
// #define NO_PRINT 1

struct SolutionState {
  std::bitset<N_QUEENS> allowedState;
  int attackLeft;
  int attackRight;
  int attackCenter;
  unsigned long queenIndex;
};

void printRow(unsigned int index) {
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
void printSolution(const std::vector<SolutionState>& solutionStates, const SolutionState& state) {}
#else
void printSolution(const std::vector<SolutionState>& solutionStates, const SolutionState& state) {
  for (SolutionState s : solutionStates) {
    printRow(s.queenIndex);
  }
  printRow(state.queenIndex);
  std::cout << "======== ========" << std::endl;
}
#endif

int main(int argc, char ** argv) {
  SolutionState state = { std::pow(2, N_QUEENS) - 1, 0, 0, 0, 0};

  auto solutionCounter = 0;

  std::vector<SolutionState> solutionStates;

  while(true) {
    if(state.allowedState.none()) {
      // backtrack
      if (solutionStates.empty())
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
    state.allowedState.set(state.queenIndex, 0);

    // win
    if (solutionStates.size() == N_QUEENS - 1) {
      solutionCounter += 1;
      printSolution(solutionStates, state);
      continue;
    }

    solutionStates.push_back(state);

    auto attackMask = 1 << state.queenIndex;

    state.attackLeft |= attackMask;
    state.attackRight |= attackMask;
    state.attackCenter |= attackMask;

    state.attackLeft >>= 1;
    state.attackRight <<= 1;

    state.allowedState = ~(state.attackLeft | state.attackRight | state.attackCenter);
  }

  // done
  std::cout << "Solutions found: " << solutionCounter << std::endl;
}

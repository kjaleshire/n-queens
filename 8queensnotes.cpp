// c++ stack

// 1 byte for current allowed state
// 1 byte for attack mask AKA new queen placement
// 3 byte for left-right-center attack
// 1 scratch byte

// next state:
//   find least significant set bit position in current allowed state

//   if none
//     if stack is empty
//       exit
//     pop center-right-left attack states
//     pop allowed state
//     GOTO next state

//   clear said bit in current allowed state
//   if stack size is 7 * level size
//     increment solution counter
//     print solution
//     GOTO next state

//   push current allowed state
//   push left-right-center attack states

//   copy attack mask to scratch byte
//   shift scratch byte left by index of last cleared byte
//   OR with and save to each current attack state

//   shift left attack right by 1
//   shift right attach left by 1

//   OR left-right-center bytes into scratch byte
//   invert scratch byte
//   copy to current allowed state
//   GOTO next state

#include <iostream>
#include <vector>
#include <cstdint>
#include <bitset>

#include <strings.h>

void printRow(uint8_t state) {
    int bitIndex = ffs(state) - 1;
    for (int i = 0; i < bitIndex; i++) {
      printf("_ ");
    }
    printf("Q ");
    for (int i = 0; i < (8 - bitIndex); i++) {
      printf("_ ");
    }
    printf("\n");
}

void printSolution(std::vector<uint8_t>& solutionStates, uint8_t allowedState) {
  int index = 0;
  while (index < solutionStates.size() - 1) {
    uint8_t state = solutionStates[index];
    printRow(state);
    index = index + 3;
  }
  printRow(allowedState);
  printf("======== ======== ======== ========\n");
}

int main(int argc, char ** argv) {
  uint8_t allowedState = 0b11111111;
  uint8_t attackLeft = 0b00000000;
  uint8_t attackRight = 0b00000000;
  uint8_t attackCenter = 0b00000000;

  uint8_t attackMask = 0b00000001;

  int solutionCounter = 0;

  std::vector<uint8_t> solutionStates;
  int x = 0;
  while(x < 100) {
    if(allowedState == 0) {
      // backtrack
      if (solutionStates.size() == 0)
        break;

      attackCenter = solutionStates.back();
      solutionStates.pop_back();
      attackRight = solutionStates.back();
      solutionStates.pop_back();
      attackLeft = solutionStates.back();
      solutionStates.pop_back();
      allowedState = solutionStates.back();
      solutionStates.pop_back();

      continue;
    }

    int bitIndex = ffs(allowedState) - 1;
    std::cout << "BI " << std::to_string(bitIndex) << std::endl;

    allowedState = allowedState & (0xFF << bitIndex);
    std::cout << "AS " << std::bitset<8>(allowedState) << std::endl;

    // win
    if (solutionStates.size() == (7 * 4)) {
      solutionCounter += 1;
      printSolution(solutionStates, allowedState);
      if (solutionCounter == 1)
        break;
      continue;
    }

    solutionStates.push_back(allowedState);
    solutionStates.push_back(attackLeft);
    solutionStates.push_back(attackRight);
    solutionStates.push_back(attackCenter);

    uint8_t attackMask = 0x000000001 << bitIndex;

    attackLeft = attackMask | attackLeft;
    attackRight = attackMask | attackRight;
    attackCenter = attackMask | attackCenter;

    attackLeft = attackLeft << 1;
    attackRight = attackRight >> 1;

    allowedState = ~(attackLeft | attackRight | attackCenter);
    x++;
  }

  // done
  std::cout << "DONE: " << std::to_string(solutionCounter) << std::endl;
}

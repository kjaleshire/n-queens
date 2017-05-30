// BOARD_SIZE = 8;

int main(int argc, char *argv[]) {
  int possibilities[8] = {1, 1, 1, 1, 1, 1, 1, 1};
  int attacks[12] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};



  dim3 threadsPerBlock(8);
  dim3 numBlocks(1);

  runKernel<<<numBlocks, threadsPerBlock>>>()

  cudaMemcpy(h_C, d_C, size, cudaMemcpyDeviceToHost);
}

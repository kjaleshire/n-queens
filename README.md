# n-queens
N-queens solutions

[https://en.wikipedia.org/wiki/Eight_queens_puzzle](https://en.wikipedia.org/wiki/Eight_queens_puzzle)

To build for Linux:

`g++ -std=c++11 -Os n_queens.cpp`
# OR
`clang++ -std=c++11 -Os n_queens.cpp`

To build for Windows, after running `vcvarsall.bat` to set up the MSVC environment:
`cl.exe /EHsc /Ot n_queens.cpp`

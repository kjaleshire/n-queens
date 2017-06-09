# n-queens
N-queens solutions

[https://en.wikipedia.org/wiki/Eight_queens_puzzle](https://en.wikipedia.org/wiki/Eight_queens_puzzle)

To build for Linux:

`g++ -std=c++11 -Os 8queens.cpp`
# OR
`clang++ -std=c++11 -Os 8queens.cpp`

To build for Windows, after running `vcvarsall.bat` to set up the MSVC environment:
`cl.exe /EHsc /Ot 8queens.cpp`

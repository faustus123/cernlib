CLCernlibFortranProgramTarget(kapack test1.F "L" packlib_static pdf_static mathlib_static kernlib_static)

CopyFile(kapack.input test.input)

CLATestTarget("kapack < test.input")

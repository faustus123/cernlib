CLCernlibFortranProgramTarget(ffread "ffuser.F furead.F fustar.F main.F" "L" packlib_static  mathlib_static kernlib_static)

CopyFile(ffdata.dat test.input)

CLATestTarget("ffread < test.input")

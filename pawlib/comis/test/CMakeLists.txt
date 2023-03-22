CLCernlibFortranProgramTarget(comist comist.F "L" pawlib_static packlib_static kernlib_static graflib_static mathlib_static dl ${X11_LIBRARIES} ${crypt} higz_static )
CLATestTarget("comist < comist.input")
CopyFile(comist.dat comist.input)

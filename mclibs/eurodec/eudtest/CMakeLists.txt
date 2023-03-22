CLCernlibFortranProgramTarget(eudtest "main.F steerd.F steerf.F testd.F testf.F" "L" eurodec_static packlib_static pdf_static mathlib_static kernlib_static)

CopyFile(eutitle.data eutitle.dat)
CopyFile(../data/eurodec.dat eurodec.dat)

CLATestTarget("eudtest eurodec.dat eutitle.dat")


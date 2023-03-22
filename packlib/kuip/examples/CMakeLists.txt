cdf_compile(${CMAKE_CURRENT_SOURCE_DIR}/uprogcdf.cdf  ${CMAKE_CURRENT_SOURCE_DIR}/uprogcdf.cdf.c)
CLCernlibFortranProgramTarget(ktest "uprog.F uprogcdf.cdf.c" "L"  ${X11_LIBRARIES}  graflib_static packlib_static kernlib_static higz_static)
CLATestTarget("ktest < ktest.inp")
CopyFile(kuipct.inp ktest.inp)

make_directory(${CMAKE_CURRENT_BINARY_DIR}/ptest1_32)
make_directory(${CMAKE_CURRENT_BINARY_DIR}/ptest1_16)
set(ptest1_32_SRCS_F main.F test2.F errex.F rwr123.F test1.F wr11.F)
set(ptest1_16_SRCS_F main.F test2.F errex.F rwr123.F test1.F wr11.F)

list(TRANSFORM ptest1_32_SRCS_F PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/ptest1/")
list(TRANSFORM ptest1_16_SRCS_F PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/ptest1/")

CLEpioFortranProgramTarget(ptest1_32 graflib_static kernlib_static  pawlib_static packlib_static mathlib_static higz_static)
target_compile_definitions(ptest1_32 PRIVATE CERNLIB_PH32BIT)
CLEpioFortranProgramTarget(ptest1_16 graflib_static kernlib_static  pawlib_static packlib_static mathlib_static higz_static)
CLBTestTarget(ptest1_32)
CLBTestTarget(ptest1_16)


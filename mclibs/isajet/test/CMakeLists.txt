CLCernlibFortranProgramTarget(isajett isajett.F "L" isajet_static packlib_static pdf_static mathlib_static kernlib_static)

if (CMAKE_Fortran_COMPILER_ID STREQUAL "Intel")
  target_link_options(isajett BEFORE PRIVATE -Wl,--allow-multiple-definition )
endif()

CopyFile(isajett.input test.input)

add_custom_target( testisajet.dat  
                        DEPENDS isajet.dat
                        COMMAND cp ${CMAKE_CURRENT_BINARY_DIR}/../data/isajet.dat ${CMAKE_CURRENT_BINARY_DIR}/isajet.dat
                       WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
                       )
add_dependencies(isajett testisajet.dat)
if (NOT CERNLIB_GFORTRAN)
  CLATestTarget("isajett isajet.dat < test.input")
endif()

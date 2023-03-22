CLCernlibFortranProgramTarget(cojetst test.F "L" cojets_static mathlib_static kernlib_static packlib_static)

CopyFile(test.input test.in)

add_custom_target( testcojets.dat  
                        DEPENDS cojets.dat
                        COMMAND cp ${CMAKE_CURRENT_BINARY_DIR}/../data/cojets.dat ${CMAKE_CURRENT_BINARY_DIR}/cojets.dat
                       WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
                       )
add_dependencies(cojetst testcojets.dat)

CLATestTarget("cojetst cojets.dat < test.in")


configure_file(${CMAKE_CURRENT_SOURCE_DIR}/cojets.cpp ${CMAKE_CURRENT_BINARY_DIR}/cojets.cin)
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/decay.cpp ${CMAKE_CURRENT_BINARY_DIR}/decay.cin)
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/table.cpp ${CMAKE_CURRENT_BINARY_DIR}/table.cin)     
add_custom_target( cojets.dat ALL BYPRODUCTS ${CMAKE_CURRENT_BINARY_DIR}/cojets.dat 
                        DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/table.cin  ${CMAKE_CURRENT_BINARY_DIR}/decay.cin ${CMAKE_CURRENT_BINARY_DIR}/cojets.cin
                        COMMAND ${CPP} -x c -E -traditional  -o ${CMAKE_CURRENT_BINARY_DIR}/cojets.dat ${CMAKE_CURRENT_BINARY_DIR}/cojets.cin
                        COMMAND ${SED} -i -e "/^#  *[0-9][0-9]*  *.*$$/d" -e "/^XCOMM$$/s//#/" -e "/^XCOMM[^a-zA-Z0-9_]/s/^XCOMM/#/" -e "/^# [0-9][0-9]/d" -e "/^#line /d"    ${CMAKE_CURRENT_BINARY_DIR}/cojets.dat
                        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
                       )
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/cojets.dat DESTINATION ${CMAKE_INSTALL_DATADIR}/cernlib/${CERNLIB_VERSION})

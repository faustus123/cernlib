
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/decay.cpp ${CMAKE_CURRENT_BINARY_DIR}/decay.cin)
add_custom_target( isajet.dat ALL BYPRODUCTS ${CMAKE_CURRENT_BINARY_DIR}/isajet.dat 
                        DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/decay.cin
                        COMMAND ${CPP} -x c -traditional -E  -o ${CMAKE_CURRENT_BINARY_DIR}/isajet.dat ${CMAKE_CURRENT_BINARY_DIR}/decay.cin
                        COMMAND ${SED} -i -e "/^#  *[0-9][0-9]*  *.*$$/d" -e "/^XCOMM$$/s//#/" -e "/^XCOMM[^a-zA-Z0-9_]/s/^XCOMM/#/" -e "/^# [0-9][0-9]/d" -e "/^#line /d"  ${CMAKE_CURRENT_BINARY_DIR}/isajet.dat
                        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
                       )
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/isajet.dat DESTINATION ${CMAKE_INSTALL_DATADIR}/cernlib/${CERNLIB_VERSION})

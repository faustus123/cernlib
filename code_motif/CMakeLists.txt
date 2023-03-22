
########################################################################
#
#  Automatically or semiautomaticall generated, do not edit.
#
########################################################################
# The following input was used
# /Imakefile

########################################################################
set_package_flags(code_motif)
#code_motif//Imakefile
 
   set(code_motif_CSRC iconbox.c iconwidget.c kmbfdi.c kmbfil.c kmbmac.c kmbmdi.c kmbrow.c kmdial.c kmfile.c kmiout.c kmpopp.c kmumen.c kmutif.c kmutim.c kuwham.c kuxbro.c kuxcmp.c kuxfse.c kuxgra.c kuxlis.c
 kuxlishlp.c kuxolt.c kuxpab.c kuxpal.c kuxpan.c kuxpap.c kuxsc1.c kuxscr.c kuxsel.c kuxxt.c mkdcmp.c mkdgra.c mkdpan.c mkmpan.c mkuip.c )
#ORIGINAL #if defined(CERNLIB_VAXVMS)
if (CERNLIB_VAXVMS)
  list(APPEND code_motif_CSRC  vmsqio.c)
endif()
  list(TRANSFORM code_motif_CSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../code_motif/")
 
set(code_motif_esources )
cdf_compile(${CMAKE_CURRENT_SOURCE_DIR}/kuipmcdf.cdf ${CMAKE_CURRENT_BINARY_DIR}/kuipmcdf.cdf.c)
list(APPEND code_motif_esources ${CMAKE_CURRENT_BINARY_DIR}/kuipmcdf.cdf.c)
if (CERNLIB_BUILD_STATIC)
add_library(code_motif_static STATIC ${code_motif_esources}
                             ${code_motif_CSRC} 
)
target_include_directories(code_motif_static PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(code_motif_static PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(code_motif_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")
target_include_directories(code_motif_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/kuip")
target_include_directories(code_motif_static PRIVATE ${FREETYPE_INCLUDE_DIRS})
target_link_libraries(code_motif_static PRIVATE packlib_static)
target_link_libraries(code_motif_static PRIVATE ${X11_LIBRARIES})
target_link_libraries(code_motif_static PRIVATE ${FREETYPE_LIBRARIES})
target_link_libraries(code_motif_static PRIVATE ${MOTIF_LIBRARIES})
target_link_libraries(code_motif_static PRIVATE ${X11_Xt_LIB})
install(TARGETS code_motif_static DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(code_motif_static PROPERTIES POSITION_INDEPENDENT_CODE ${CERNLIB_POSITION_INDEPENDENT_CODE} OUTPUT_NAME packlib-lesstif)
endif()
if (CERNLIB_BUILD_SHARED)
add_library(code_motif SHARED ${code_motif_esources}
                             ${code_motif_CSRC} 
)
target_include_directories(code_motif PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(code_motif PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(code_motif PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")
target_include_directories(code_motif PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/kuip")
target_include_directories(code_motif PRIVATE ${FREETYPE_INCLUDE_DIRS})
target_link_libraries(code_motif PRIVATE packlib)
target_link_libraries(code_motif PRIVATE ${X11_LIBRARIES})
target_link_libraries(code_motif PRIVATE ${FREETYPE_LIBRARIES})
target_link_libraries(code_motif PRIVATE ${MOTIF_LIBRARIES})
target_link_libraries(code_motif PRIVATE ${X11_Xt_LIB})
install(TARGETS code_motif DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(code_motif        PROPERTIES POSITION_INDEPENDENT_CODE ON OUTPUT_NAME packlib-lesstif SOVERSION 1_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR})
install_symlink(libpacklib-lesstif.so.1_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR} ${CMAKE_INSTALL_LIBDIR}/libpacklib-lesstif.so.1_${COMPSUFFIX})
endif()

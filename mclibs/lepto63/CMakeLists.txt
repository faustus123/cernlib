
########################################################################
#
#  Automatically or semiautomaticall generated, do not edit.
#
########################################################################
# The following input was used
# code/Imakefile

########################################################################
set_package_flags(lepto63)
#lepto63/code/Imakefile
 
  set(lepto63_code_FSRC dcross.F dfun.F dlower.F dqcd.F dqcdi.F dsigma.F dsigm2.F dupper.F dvnopt.F flgint.F flintg.F flipol.F flqint.F fltabl.F fltint.F gadap.F gadap2.F gadapf.F lazimu.F leaswi.F lecswi.F
 lepto.F leptod.F leptox.F lflav.F lframe.F linit.F lkinem.F lmcmnd.F lmeps.F lmidat.F lminew.F lminto.F lmpint.F lmprin.F lmrazz.F lmsimp.F lnstrf.F lprikt.F lprwts.F lqcdpr.F lqev.F lqgev.F lqmcut.F
 lqqbev.F lremh.F lscale.F lsci.F lshowr.F lsigmx.F lsmall.F ltimex.F lwbb.F lweits.F lxp.F lxsect.F lyremn.F lyspli.F lysspa.F lystfu.F lzp.F riwfun.F riwibd.F)
  list(TRANSFORM lepto63_code_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../lepto63/code/")
 
set(lepto63_esources )
if (CERNLIB_BUILD_STATIC)
add_library(lepto63_static STATIC ${lepto63_esources}
                             ${lepto63_code_FSRC} 
)
target_include_directories(lepto63_static PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(lepto63_static PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(lepto63_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")
target_include_directories(lepto63_static PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS lepto63_static DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(lepto63_static PROPERTIES POSITION_INDEPENDENT_CODE ${CERNLIB_POSITION_INDEPENDENT_CODE} OUTPUT_NAME lepto651)
endif()
if (CERNLIB_BUILD_SHARED)
add_library(lepto63 SHARED ${lepto63_esources}
                             ${lepto63_code_FSRC} 
)
target_include_directories(lepto63 PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(lepto63 PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(lepto63 PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")
target_include_directories(lepto63 PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS lepto63 DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(lepto63        PROPERTIES POSITION_INDEPENDENT_CODE ON OUTPUT_NAME lepto651 SOVERSION 3_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR})
install_symlink(liblepto651.so.3_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR} ${CMAKE_INSTALL_LIBDIR}/liblepto651.so.3_${COMPSUFFIX})
endif()

if(CERNLIB_ENABLE_TEST)
  ENABLE_TESTING()
  add_subdirectory(test)
endif()

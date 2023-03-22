
########################################################################
#
#  Automatically or semiautomaticall generated, do not edit.
#
########################################################################
# The following input was used
# fowl/Imakefile
# genbod/Imakefile
# wico/Imakefile

########################################################################
set_package_flags(phtools)
#phtools/fowl/Imakefile
 
  set(phtools_fowl_FSRC beamin.F breitw.F chmove.F delsq.F dumpme.F fmass.F fmassq.F fowl.F fowlmp.F fowlpr.F genev.F histey.F labsys.F pdk.F qqstrt.F rangnr.F redat2.F redata.F rotes2.F scout.F teedia.F
 tranch.F xplsdx.F)
  set(phtools_fowl_CSRC dummy.c)
#ORIGINAL #if !defined(CERNLIB_UNIX)
if (NOT CERNLIB_UNIX)
  list(APPEND phtools_fowl_FSRC )
endif()
  list(TRANSFORM phtools_fowl_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../phtools/fowl/")
  list(TRANSFORM phtools_fowl_CSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../phtools/fowl/")
 
#phtools/genbod/Imakefile
 
  set(phtools_genbod_FSRC genbod.F)
  list(TRANSFORM phtools_genbod_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../phtools/genbod/")
 
#phtools/wico/Imakefile
 
  set(phtools_wico_FSRC cwicof.F wico.F wicoin.F)
  list(TRANSFORM phtools_wico_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../phtools/wico/")
 
set(phtools_esources )
if (CERNLIB_BUILD_STATIC)
add_library(phtools_static STATIC ${phtools_esources}
                             ${phtools_fowl_FSRC} 
                             ${phtools_fowl_CSRC} 
                             ${phtools_genbod_FSRC} 
                             ${phtools_wico_FSRC} 
)
target_include_directories(phtools_static PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(phtools_static PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(phtools_static PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS phtools_static DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(phtools_static PROPERTIES POSITION_INDEPENDENT_CODE ${CERNLIB_POSITION_INDEPENDENT_CODE} OUTPUT_NAME phtools)
endif()
if (CERNLIB_BUILD_SHARED)
add_library(phtools SHARED ${phtools_esources}
                             ${phtools_fowl_FSRC} 
                             ${phtools_fowl_CSRC} 
                             ${phtools_genbod_FSRC} 
                             ${phtools_wico_FSRC} 
)
target_include_directories(phtools PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(phtools PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(phtools PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS phtools DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(phtools        PROPERTIES POSITION_INDEPENDENT_CODE ON OUTPUT_NAME phtools SOVERSION 2_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR})
install_symlink(libphtools.so.2_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR} ${CMAKE_INSTALL_LIBDIR}/libphtools.so.2_${COMPSUFFIX})
endif()

if(CERNLIB_ENABLE_TEST)
  ENABLE_TESTING()
  add_subdirectory(wicoexam)
endif()

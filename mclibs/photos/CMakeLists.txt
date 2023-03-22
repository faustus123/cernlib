
########################################################################
#
#  Automatically or semiautomaticall generated, do not edit.
#
########################################################################
# The following input was used
# code/Imakefile

########################################################################
set_package_flags(photos)
#photos/code/Imakefile
 
  set(photos_code_FSRC phcork.F phint.F phlupa.F phoan1.F phoan2.F phobo3.F phobos.F phocha.F phochk.F phocin.F phocor.F phodo.F phoene.F phoerr.F phofac.F phoin.F phoinf.F phoini.F phomak.F phooma.F phoout.F
 phopre.F phoran.F phorep.F phorin.F phoro2.F phoro3.F phospi.F photos.F photri.F photwo.F phtype.F photos_get.F photos_make.F photos_set.F)
  list(TRANSFORM photos_code_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../photos/code/")
 
set(photos_esources )
if (CERNLIB_BUILD_STATIC)
add_library(photos_static STATIC ${photos_esources}
                             ${photos_code_FSRC} 
)
target_include_directories(photos_static PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(photos_static PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(photos_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")
target_include_directories(photos_static PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS photos_static DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(photos_static PROPERTIES POSITION_INDEPENDENT_CODE ${CERNLIB_POSITION_INDEPENDENT_CODE} OUTPUT_NAME photos202)
endif()
if (CERNLIB_BUILD_SHARED)
add_library(photos SHARED ${photos_esources}
                             ${photos_code_FSRC} 
)
target_include_directories(photos PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(photos PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(photos PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")
target_include_directories(photos PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS photos DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(photos        PROPERTIES POSITION_INDEPENDENT_CODE ON OUTPUT_NAME photos202 SOVERSION 1_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR})
install_symlink(libphotos202.so.1_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR} ${CMAKE_INSTALL_LIBDIR}/libphotos202.so.1_${COMPSUFFIX})
endif()

if(CERNLIB_ENABLE_TEST)
  ENABLE_TESTING()
  add_subdirectory(test)
endif()


########################################################################
#
#  Automatically or semiautomaticall generated, do not edit.
#
########################################################################
# The following input was used
# code/Imakefile

########################################################################
set_package_flags(ariadne)
#ariadne/code/Imakefile
 
  set(ariadne_code_FSRC arinit.F araddg.F arangl.F arbocm.F arcasc.F archem.F arclus.F arcopa.F arcopj.F arcrdi.F ardump.F arduph.F ardyre.F aremit.F arerrm.F arexec.F argpt2.F argqcd.F argqed.F argtyp.F
 aript2.F arjoin.F armade.F armass.F armcdi.F armipt.F arnofl.F arordj.F arorie.F arpars.F arradg.F arradp.F arradq.F arreca.F arupdj.F arrndx.F arrndy.F arrobo.F arsplg.F arstor.F artest.F arveto.F artune.F
 arprda.F archki.F arexma.F arphas.F arlept.F argdis.F arpyth.F arptqq.F arinqq.F arsume.F arzcms.F arpcms.F arstra.F arscan.F arremn.F arpoki.F arposf.F arupom.F lnstrf.F pystfu.F arniqq.F armtqq.F arging.F
 aradig.F arearr.F arputr.F arthrw.F aruthr.F ar4frm.F)
  list(TRANSFORM ariadne_code_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../ariadne/code/")
 
set(ariadne_esources )
if (CERNLIB_BUILD_STATIC)
add_library(ariadne_static STATIC ${ariadne_esources}
                             ${ariadne_code_FSRC} 
)
target_include_directories(ariadne_static PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(ariadne_static PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(ariadne_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")
target_include_directories(ariadne_static PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS ariadne_static DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(ariadne_static PROPERTIES POSITION_INDEPENDENT_CODE ${CERNLIB_POSITION_INDEPENDENT_CODE} OUTPUT_NAME ariadne)
endif()
if (CERNLIB_BUILD_SHARED)
add_library(ariadne SHARED ${ariadne_esources}
                             ${ariadne_code_FSRC} 
)
target_include_directories(ariadne PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(ariadne PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(ariadne PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")
target_include_directories(ariadne PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS ariadne DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(ariadne        PROPERTIES POSITION_INDEPENDENT_CODE ON OUTPUT_NAME ariadne SOVERSION 1_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR})
install_symlink(libariadne.so.1_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR} ${CMAKE_INSTALL_LIBDIR}/libariadne.so.1_${COMPSUFFIX})
endif()

if(CERNLIB_ENABLE_TEST)
  ENABLE_TESTING()
  add_subdirectory(test)
endif()

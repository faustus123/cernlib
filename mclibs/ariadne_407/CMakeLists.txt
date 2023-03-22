
########################################################################
#
#  Automatically or semiautomaticall generated, do not edit.
#
########################################################################
# The following input was used
# code/Imakefile
# test/Imakefile

########################################################################
set_package_flags(ariadne_407)
#ariadne_407/code/Imakefile
 
  set(ariadne_407_code_FSRC ar4frm.F araddg.F aradg2.F aradig.F arangl.F arbocm.F arbole.F arbopy.F arcasc.F archem.F archfl.F archki.F arclus.F arcodi.F arcoli.F arcont.F arcopa.F arcopj.F arcrdi.F ardata.F
 ardbrb.F ardump.F arduph.F ardyre.F arearr.F arecoi.F aremi2.F aremi3.F aremit.F arerrm.F arevol.F arevst.F arexec.F arexma.F arfidy.F argdig.F argdis.F argetr.F argig2.F arging.F argpt2.F argqcd.F argqcg.F
 argqcq.F argqed.F argtyp.F arincr.F arinit.F arinqq.F aripsf.F aript2.F arjoin.F arjoqq.F arjost.F arlept.F armade.F armas2.F armas3.F armas4.F armass.F armcdi.F armipt.F armtqq.F arndx1.F arndx2.F arndx3.F
 arndx4.F arndy1.F arndy2.F arndy3.F arndy4.F arndy5.F arniqq.F arnofl.F arobo1.F arobo2.F arobo3.F arobo4.F arobo5.F arordj.F arorie.F arpadd.F arpado.F arpars.F arpcms.F arphas.F arpins.F arpoki.F arposf.F
 arprda.F arprdy.F arprem.F arprgc.F arptqq.F arputr.F arpyth.F arpyww.F arradg.F arradp.F arradq.F arreca.F arremd.F arremg.F arremn.F arremp.F arrems.F arrobo.F arscan.F arsplg.F arstor.F arstra.F arsume.F
 arswap.F artest.F arthrw.F artpt2.F artune.F arupdj.F arupom.F aruthr.F arvet1.F arvet2.F arvet3.F arvet4.F arvet5.F arvet6.F arvet7.F arvet8.F arveth.F arzcms.F lnstrf.F pystfu.F)
  list(TRANSFORM ariadne_407_code_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../ariadne_407/code/")
 
#ariadne_407/test/Imakefile
 
  set(ariadne_407_test_FSRC test.F)
  list(TRANSFORM ariadne_407_test_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../ariadne_407/test/")
 
set(ariadne_407_esources )
if (CERNLIB_BUILD_STATIC)
add_library(ariadne_407_static STATIC ${ariadne_407_esources}
                             ${ariadne_407_code_FSRC} 
                             ${ariadne_407_test_FSRC} 
)
target_include_directories(ariadne_407_static PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(ariadne_407_static PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(ariadne_407_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")
target_include_directories(ariadne_407_static PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS ariadne_407_static DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(ariadne_407_static PROPERTIES POSITION_INDEPENDENT_CODE ${CERNLIB_POSITION_INDEPENDENT_CODE} OUTPUT_NAME ariadne_407)
endif()
if (CERNLIB_BUILD_SHARED)
add_library(ariadne_407 SHARED ${ariadne_407_esources}
                             ${ariadne_407_code_FSRC} 
                             ${ariadne_407_test_FSRC} 
)
target_include_directories(ariadne_407 PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(ariadne_407 PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(ariadne_407 PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")
target_include_directories(ariadne_407 PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS ariadne_407 DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(ariadne_407        PROPERTIES POSITION_INDEPENDENT_CODE ON OUTPUT_NAME ariadne_407 SOVERSION 2_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR})
install_symlink(libariadne_407.so.2_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR} ${CMAKE_INSTALL_LIBDIR}/libariadne_407.so.2_${COMPSUFFIX})
endif()


########################################################################
#
#  Automatically or semiautomaticall generated, do not edit.
#
########################################################################
# The following input was used
# decays/Imakefile
# eudini/Imakefile
# fragmt/Imakefile
# supdec/Imakefile

########################################################################
set_package_flags(eurodec)
#eurodec/decays/Imakefile
 
  set(eurodec_decays_FSRC a1vec.F ampvec.F dalitz.F decays.F dot.F fermi.F jets.F omephi.F on2gga.F ongqbq.F onh0ga.F oni2g.F oni3g.F onisqd.F pardec.F parfra.F tausca.F tauvec.F triang.F vecpar.F virhvy.F
 vmina.F wadkro.F)
  list(TRANSFORM eurodec_decays_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../eurodec/decays/")
 
#eurodec/eudini/Imakefile
 
  set(eurodec_eudini_FSRC amoni.F brfrac.F eudcin.F eudini.F eudtab.F eudtit.F idloc.F inibrn.F invert.F nampoi.F ordbr.F sqd.F toponi.F wglu.F whvy.F wlqu.F)
  list(TRANSFORM eurodec_eudini_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../eurodec/eudini/")
 
#eurodec/fragmt/Imakefile
 
  set(eurodec_fragmt_FSRC adjust.F bwmass.F clrstk.F detvtx.F finsho.F fragmt.F gjetfr.F ibaryn.F idiqrk.F iqqbar.F meson.F ordstk.F qjetfr.F roter.F)
  list(TRANSFORM eurodec_fragmt_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../eurodec/fragmt/")
 
#eurodec/supdec/Imakefile
 
  set(eurodec_supdec_FSRC dfnpre.F dfunrn.F dgauss.F errord.F eurran.F eurrin.F ieupdg.F indnam.F ipdgeu.F pcharg.F prtevt.F prtvtx.F rlego.F)
  list(TRANSFORM eurodec_supdec_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../eurodec/supdec/")
 
set(eurodec_esources )
if (CERNLIB_BUILD_STATIC)
add_library(eurodec_static STATIC ${eurodec_esources}
                             ${eurodec_decays_FSRC} 
                             ${eurodec_eudini_FSRC} 
                             ${eurodec_fragmt_FSRC} 
                             ${eurodec_supdec_FSRC} 
)
target_include_directories(eurodec_static PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(eurodec_static PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(eurodec_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")
target_include_directories(eurodec_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/eurodec")
target_include_directories(eurodec_static PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS eurodec_static DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(eurodec_static PROPERTIES POSITION_INDEPENDENT_CODE ${CERNLIB_POSITION_INDEPENDENT_CODE} OUTPUT_NAME eurodec)
endif()
if (CERNLIB_BUILD_SHARED)
add_library(eurodec SHARED ${eurodec_esources}
                             ${eurodec_decays_FSRC} 
                             ${eurodec_eudini_FSRC} 
                             ${eurodec_fragmt_FSRC} 
                             ${eurodec_supdec_FSRC} 
)
target_include_directories(eurodec PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(eurodec PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(eurodec PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")
target_include_directories(eurodec PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/eurodec")
target_include_directories(eurodec PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS eurodec DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(eurodec        PROPERTIES POSITION_INDEPENDENT_CODE ON OUTPUT_NAME eurodec SOVERSION 1_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR})
install_symlink(libeurodec.so.1_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR} ${CMAKE_INSTALL_LIBDIR}/libeurodec.so.1_${COMPSUFFIX})
endif()

install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/eurodec DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}  COMPONENT libs PATTERN "*makefile*" EXCLUDE )
file(READ ${CMAKE_CURRENT_SOURCE_DIR}/eurodec/eufiles.inc FILE_CONTENTS)
string(REPLACE "eurodec.dat" "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_DATADIR}/cernlib/${CERNLIB_VERSION}/eurodec.dat" FILE_CONTENTS ${FILE_CONTENTS})
file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/eufiles.inc ${FILE_CONTENTS})
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/eufiles.inc DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/eurodec/)

if(CERNLIB_ENABLE_TEST)
  ENABLE_TESTING()
  add_subdirectory(eudtest)
endif()

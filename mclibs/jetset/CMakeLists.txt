
########################################################################
#
#  Automatically or semiautomaticall generated, do not edit.
#
########################################################################
# The following input was used
# jetset/Imakefile
# pythia/Imakefile

########################################################################
set_package_flags(jetset)
#jetset/jetset/Imakefile
 
  set(jetset_jetset_FSRC klu.F lu1ent.F lu2ent.F lu3ent.F lu4ent.F luboei.F lucell.F luchge.F luclus.F lucomp.F ludata.F ludecy.F luedit.F lueevt.F luerrm.F luexec.F lufowo.F lugive.F luhepc.F luindf.F
 lujmas.F lujoin.F lukfdi.F lulist.F lulogo.F luname.F luonia.F luprep.F luptdi.F luradk.F lurobo.F lushow.F lusphe.F lustrf.F lutabu.F lutaud.F lutest.F luthru.F luupda.F lux3jt.F lux4jt.F luxdif.F luxjet.F
 luxkfl.F luxtot.F luzdis.F plu.F rlu.F rluget.F rluset.F ulalem.F ulalps.F ulangl.F ulmass.F)
#ORIGINAL #if defined(CERNLIB_PPC)
if (CERNLIB_PPC)
endif()
  list(TRANSFORM jetset_jetset_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../jetset/jetset/")
 
#jetset/pythia/Imakefile
 
  set(jetset_pythia_FSRC pyctq2.F pydata.F pydiff.F pydocu.F pyevnt.F pyevwt.F pyfram.F pygamm.F pygano.F pygbeh.F pygdir.F pyggam.F pygvmd.F pyhfth.F pyi3au.F pyinbm.F pyinit.F pyinki.F pyinpr.F pyinre.F
 pykcut.F pyklim.F pykmap.F pymaxi.F pymult.F pyofsh.F pypile.F pyqqbh.F pyrand.F pyremn.F pyresd.F pysave.F pyscat.F pysigh.F pyspen.F pyspli.F pysspa.F pystat.F pystel.F pystfl.F pystfu.F pystga.F pystpi.F
 pystpr.F pytest.F pyupev.F pyupin.F pywaux.F pywidt.F pyxtot.F rkbbv.F rkdot.F rkhlpk.F rkrand.F rkzf.F rkzpr.F rkzsf.F)
if (CERNLIB_SGI)
endif()
#ORIGINAL #if defined(CERNLIB_PPC)
if (CERNLIB_PPC)
endif()
  list(TRANSFORM jetset_pythia_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../jetset/pythia/")
 
set(jetset_esources )
if (CERNLIB_BUILD_STATIC)
add_library(jetset_static STATIC ${jetset_esources}
                             ${jetset_jetset_FSRC} 
                             ${jetset_pythia_FSRC} 
)
target_include_directories(jetset_static PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(jetset_static PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(jetset_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")
target_include_directories(jetset_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/jetset")
target_include_directories(jetset_static PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS jetset_static DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(jetset_static PROPERTIES POSITION_INDEPENDENT_CODE ${CERNLIB_POSITION_INDEPENDENT_CODE} OUTPUT_NAME jetset74)
endif()
if (CERNLIB_BUILD_SHARED)
add_library(jetset SHARED ${jetset_esources}
                             ${jetset_jetset_FSRC} 
                             ${jetset_pythia_FSRC} 
)
target_include_directories(jetset PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(jetset PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(jetset PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")
target_include_directories(jetset PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/jetset")
target_include_directories(jetset PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS jetset DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(jetset        PROPERTIES POSITION_INDEPENDENT_CODE ON OUTPUT_NAME jetset74 SOVERSION 3_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR})
install_symlink(libjetset74.so.3_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR} ${CMAKE_INSTALL_LIBDIR}/libjetset74.so.3_${COMPSUFFIX})
endif()

if(CERNLIB_ENABLE_TEST)
  ENABLE_TESTING()
  add_subdirectory(test)
endif()

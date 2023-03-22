
########################################################################
#
#  Automatically or semiautomaticall generated, do not edit.
#
########################################################################
# The following input was used
# ariadne/Imakefile
# code/Imakefile
# jetset/Imakefile
# pythia/Imakefile

########################################################################
set_package_flags(fritiof)
#fritiof/ariadne/Imakefile
 
  set(fritiof_ariadne_FSRC araddg.F arangl.F arbocm.F arcasc.F archem.F archki.F arclus.F arcopa.F arcopj.F arcrdi.F ardata.F ardump.F arduph.F ardyre.F arecoi.F aremit.F arerrm.F arexec.F arexma.F argpt2.F
 argqcd.F argqed.F argtyp.F arinit.F aript2.F arjoin.F armade.F armas2.F armas3.F armass.F armcdi.F armipt.F arndx1.F arndx2.F arndx3.F arndy1.F arndy2.F arndy3.F arndy4.F arnofl.F arobo1.F arobo2.F arobo3.F
 arobo4.F arobo5.F arordj.F arorie.F arpars.F arprda.F arradg.F arradp.F arradq.F arreca.F arrobo.F arsmpt.F arsplg.F arstor.F artest.F artune.F arupdj.F arvet1.F arvet2.F arvet3.F arvet4.F arvet5.F arveth.F)
  list(TRANSFORM fritiof_ariadne_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../fritiof/ariadne/")
 
#fritiof/code/Imakefile
 
  set(fritiof_code_FSRC dfrdpq.F dfrsqr.F fraacol.F frangan.F frangur.F frariad.F fratleo.F frbeleo.F frbetav.F frboot1.F frchexg.F frchkep.F frcolpt.F frdata.F frdoict.F fredipy.F freditd.F frevent.F
 frfilhd.F frfilhw.F frgauss.F frhardp.F frhelge.F frhildn.F frhplis.F fringeb.F frinita.F frinset.F frinskk.F frint.F fript.F frkvm.F frloopu.F frmgout.F frmxgpt.F frnucdf.F frnucod.F frnucor.F frord01.F
 frorder.F frovlap.F frpacol.F frplimt.F frpolar.F frppart.F frppcol.F frpsoft.F frpyini.F frpyxto.F frqprob.F frrex.F frringo.F frror.F frrotar.F frrotay.F frrotaz.F frsample.F frsaven.F frsearc.F frsetdm.F
 frsetpy.F frsqr.F frsum.F frtestg.F frtocms.F frtorst.F frupcas.F frvalue.F frvecrc.F frvectc.F frvov.F ifrkfc.F)
  list(TRANSFORM fritiof_code_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../fritiof/code/")
 
#fritiof/jetset/Imakefile
 
  set(fritiof_jetset_FSRC klu.F lu1ent.F lu2ent.F lu3ent.F lu4ent.F luboei.F lucell.F luchge.F luclus.F lucomp.F ludata.F ludecy.F luedit.F lueevt.F luerrm.F luexec.F lufowo.F lugive.F luhepc.F luindf.F
 lujmas.F lujoin.F lukfdi.F lulist.F luname.F luonia.F luprep.F luptdi.F luradk.F lurobo.F lushow.F lusphe.F lustrf.F lutabu.F lutest.F luthru.F luupda.F lux3jt.F lux4jt.F luxdif.F luxjet.F luxkfl.F luxtot.F
 luzdis.F plu.F rlu.F rluget.F rluset.F ulalem.F ulalps.F ulangl.F ulmass.F)
  list(TRANSFORM fritiof_jetset_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../fritiof/jetset/")
 
#fritiof/pythia/Imakefile
 
  set(fritiof_pythia_FSRC pydata.F pydiff.F pydocu.F pyevnt.F pyfram.F pygamm.F pyi3au.F pyinit.F pyinki.F pyinre.F pykcut.F pyklim.F pykmap.F pymaxi.F pymult.F pyofsh.F pypile.F pyrand.F pyremn.F pyresd.F
 pyscat.F pysigh.F pyspen.F pyspli.F pysspa.F pystat.F pystfe.F pystfu.F pystga.F pytest.F pywaux.F pywidt.F pyxtot.F rkbbv.F rkdot.F rkhlpk.F rkrand.F rkzf.F rkzpr.F rkzsf.F)
if (CERNLIB_SGI)
endif()
  list(TRANSFORM fritiof_pythia_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../fritiof/pythia/")
 
set(fritiof_esources )
if (CERNLIB_BUILD_STATIC)
add_library(fritiof_static STATIC ${fritiof_esources}
                             ${fritiof_ariadne_FSRC} 
                             ${fritiof_code_FSRC} 
                             ${fritiof_jetset_FSRC} 
                             ${fritiof_pythia_FSRC} 
)
target_include_directories(fritiof_static PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(fritiof_static PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(fritiof_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")
target_include_directories(fritiof_static PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS fritiof_static DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(fritiof_static PROPERTIES POSITION_INDEPENDENT_CODE ${CERNLIB_POSITION_INDEPENDENT_CODE} OUTPUT_NAME fritiof)
endif()
if (CERNLIB_BUILD_SHARED)
add_library(fritiof SHARED ${fritiof_esources}
                             ${fritiof_ariadne_FSRC} 
                             ${fritiof_code_FSRC} 
                             ${fritiof_jetset_FSRC} 
                             ${fritiof_pythia_FSRC} 
)
target_include_directories(fritiof PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(fritiof PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(fritiof PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")
target_include_directories(fritiof PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS fritiof DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(fritiof        PROPERTIES POSITION_INDEPENDENT_CODE ON OUTPUT_NAME fritiof SOVERSION 1_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR})
install_symlink(libfritiof.so.1_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR} ${CMAKE_INSTALL_LIBDIR}/libfritiof.so.1_${COMPSUFFIX})
endif()

if(CERNLIB_ENABLE_TEST)
  ENABLE_TESTING()
  add_subdirectory(test)
endif()

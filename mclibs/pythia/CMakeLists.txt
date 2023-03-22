
########################################################################
#
#  Automatically or semiautomaticall generated, do not edit.
#
########################################################################
# The following input was used
# code/Imakefile

########################################################################
set_package_flags(pythia)
#pythia/code/Imakefile
 
  set(pythia_code_FSRC py1ent.F py2ent.F py2frm.F py3ent.F py4ent.F py4frm.F py4jet.F py4jts.F py4jtw.F py6frm.F pyadsh.F pyalem.F pyalps.F pyangl.F pyapps.F pybesq.F pybksb.F pyboei.F pybook.F pycba2.F
 pycbal.F pycdiv.F pycell.F pychge.F pycjdc.F pyclus.F pycmq2.F pycmqr.F pycomp.F pycrth.F pycsrt.F pyct5l.F pyct5m.F pycteq.F pydata.F pydcyk.F pydecy.F pydiff.F pydisg.F pydocu.F pydump.F pyedit.F pyeevt.F
 pyeicg.F pyeig4.F pyerrm.F pyevnt.F pyevwt.F pyexec.F pyfact.F pyfill.F pyfint.F pyfisb.F pyfowo.F pyfram.F pygaga.F pygamm.F pygano.F pygaus.F pygbeh.F pygdir.F pygfxx.F pyggam.F pygive.F pyglui.F pygrvd.F
 pygrvl.F pygrvm.F pygrvs.F pygrvv.F pygrvw.F pygvmd.F pyh2xx.F pyhepc.F pyhext.F pyhfth.F pyhggm.F pyhist.F pyi3au.F pyinbm.F pyindf.F pyinit.F pyinki.F pyinom.F pyinpr.F pyinre.F pyjmas.F pyjoin.F pyk.F
 pykcut.F pykfdi.F pykfin.F pyklim.F pykmap.F pylamf.F pyldcm.F pylist.F pylogo.F pymael.F pymass.F pymaxi.F pymemx.F pymewt.F pymrun.F pymsin.F pymult.F pyname.F pynjdc.F pynmes.F pynull.F pyofsh.F pyonia.F
 pyoper.F pyp.F pypdel.F pypdfl.F pypdfu.F pypdga.F pypdpi.F pypdpo.F pypdpr.F pypile.F pyplot.F pypole.F pyprep.F pyptdi.F pyqqbh.F pyr.F pyradk.F pyrand.F pyreco.F pyremn.F pyresd.F pyrget.F pyrghm.F
 pyrnm3.F pyrnmq.F pyrobo.F pyrset.F pyrvch.F pyrvg1.F pyrvg2.F pyrvg3.F pyrvg4.F pyrvgl.F pyrvgw.F pyrvi1.F pyrvi2.F pyrvi3.F pyrvne.F pyrvr.F pyrvs.F pyrvsb.F pyrvsf.F pysave.F pyscat.F pysfdc.F pyshow.F
 pysigh.F pysimp.F pyspen.F pysphe.F pyspli.F pysspa.F pystat.F pystrf.F pysubh.F pysugi.F pytabu.F pytaud.F pytbbc.F pytbbn.F pytbdy.F pytecm.F pytest.F pythag.F pythrg.F pythru.F pytime.F pyupda.F pywaux.F
 pywidt.F pywidx.F pyx2xg.F pyx2xh.F pyx3jt.F pyx4jt.F pyxdif.F pyxjet.F pyxkfl.F pyxtee.F pyxtot.F pyxxga.F pyxxz6.F pyzdis.F sugra.F upevnt.F upinit.F visaje.F)
if (CERNLIB_SGI)
endif()
#ORIGINAL #if defined(CERNLIB_PPC)
if (CERNLIB_PPC)
endif()
  list(TRANSFORM pythia_code_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../pythia/code/")
 
set(pythia_esources )
if (CERNLIB_BUILD_STATIC)
add_library(pythia_static STATIC ${pythia_esources}
                             ${pythia_code_FSRC} 
)
target_include_directories(pythia_static PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(pythia_static PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(pythia_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")
target_include_directories(pythia_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/pythia")
target_include_directories(pythia_static PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS pythia_static DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(pythia_static PROPERTIES POSITION_INDEPENDENT_CODE ${CERNLIB_POSITION_INDEPENDENT_CODE} OUTPUT_NAME pythia6205)
install_symlink(libpythia6205.a  ${CMAKE_INSTALL_LIBDIR}/libpythia.a)
endif()
if (CERNLIB_BUILD_SHARED)
add_library(pythia SHARED ${pythia_esources}
                             ${pythia_code_FSRC} 
)
target_include_directories(pythia PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(pythia PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(pythia PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")
target_include_directories(pythia PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/pythia")
target_include_directories(pythia PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS pythia DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(pythia        PROPERTIES POSITION_INDEPENDENT_CODE ON OUTPUT_NAME pythia6205 SOVERSION 3_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR})
install_symlink(libpythia6205.so.3_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR} ${CMAKE_INSTALL_LIBDIR}/libpythia6205.so.3_${COMPSUFFIX})
endif()

if(CERNLIB_ENABLE_TEST)
  ENABLE_TESTING()
  add_subdirectory(test)
endif()

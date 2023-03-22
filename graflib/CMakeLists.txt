
########################################################################
#
#  Automatically or semiautomaticall generated, do not edit.
#
########################################################################
# The following input was used
# dzdoc/dzdkern/Imakefile
# dzdoc/dzdraw/Imakefile
# hplot/hplotcc/Imakefile
# hplot/hplotf77/Imakefile

########################################################################
set_package_flags(graflib)
#graflib/dzdoc/dzdkern/Imakefile
 
  set(graflib_dzdoc_dzdkern_FSRC dzd00t.F dzd0nt.F dzd0tt.F dzdbk1.F dzdbkc.F dzdcar.F dzdco1.F dzdcod.F dzdcrd.F dzdeos.F dzdggi.F dzdini.F dzdlin.F dzdlo1.F dzdndc.F dzdnum.F dzdocm.F dzdsco.F)
  list(TRANSFORM graflib_dzdoc_dzdkern_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../graflib/dzdoc/dzdkern/")
 
#graflib/dzdoc/dzdraw/Imakefile
 
  set(graflib_dzdoc_dzdraw_FSRC dzdase.F dzdb01.F dzdbi1.F dzdbit.F dzdbnk.F dzdbok.F dzdbox.F dzdcdi.F dzdcfz.F dzdckc.F dzdcld.F dzdcrz.F dzdcti.F dzddad.F dzddaw.F dzddec.F dzddhp.F dzddiv.F dzddoc.F
 dzddtr.F dzddwd.F dzdedd.F dzdent.F dzdfio.F dzdfla.F dzdfll.F dzdfnt.F dzdfzi.F dzdfzs.F dzdgdo.F dzdgds.F dzdgdv.F dzdgen.F dzdget.F dzdgfl.F dzdgiv.F dzdgky.F dzdglk.F dzdgnz.F dzdgpl.F dzdgr1.F dzdgrc.F
 dzdgrz.F dzdgst.F dzdgtr.F dzdhea.F dzdhlp.F dzdhlr.F dzdhlv.F dzdhtm.F dzdibr.F dzdifa.F dzdinb.F dzdioc.F dzdird.F dzdirz.F dzdisp.F dzdlbx.F dzdlft.F dzdlfx.F dzdli2.F dzdlnk.F dzdlpe.F dzdmnt.F dzdmrz.F
 dzdnbk.F dzdndi.F dzdnfz.F dzdntd.F dzdoco.F dzdorf.F dzdpar.F dzdpdl.F dzdpev.F dzdpin.F dzdpla.F dzdpln.F dzdprv.F dzdprw.F dzdpsc.F dzdpto.F dzdpuv.F dzdra1.F dzdra2.F dzdraw.F dzdrot.F dzdrwf.F dzdsbx.F
 dzdsdo.F dzdsfb.F dzdsfk.F dzdsh1.F dzdsha.F dzdshd.F dzdskd.F dzdspi.F dzdsrs.F dzdst1.F dzdstk.F dzdsvp.F dzdsy1.F dzdsyw.F dzdtm1.F dzdtmp.F dzdtre.F dzdtxt.F dzdudd.F dzdurz.F dzdwcs.F dzdwtr.F dzdzeb.F
 dze2ht.F)
  list(TRANSFORM graflib_dzdoc_dzdraw_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../graflib/dzdoc/dzdraw/")
 
#graflib/hplot/hplotcc/Imakefile
 
  set(graflib_hplot_hplotcc_CSRC hplvers.c)
  list(TRANSFORM graflib_hplot_hplotcc_CSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../graflib/hplot/hplotcc/")
 
#graflib/hplot/hplotf77/Imakefile
 
  set(graflib_hplot_hplotf77_FSRC hplabl.F hplaer.F hplarc.F hplatt.F hplax.F hplax2.F hplaxi.F hplbox.F hplc.F hplcap.F hplcha.F hplcol.F hplcom.F hplcon.F hpldat.F hpldes.F hpldo.F hplego.F hplend.F
 hplerr.F hplf.F hplfil.F hplfit.F hplfr3.F hplfra.F hplfun.F hplgiv.F hplglb.F hplgtl.F hplgzo.F hplh.F hplhip.F hplhup.F hpli.F hpline.F hplint.F hplist.F hplive.F hplj.F hplkey.F hpllgd.F hplnew.F hplnot.F
 hplnt.F hplnul.F hplnxt.F hploc.F hplone.F hplopt.F hplot.F hplpgn.F hplpro.F hplpto.F hplqop.F hplqse.F hplrdw.F hplscm.F hplsel.F hplset.F hplsiz.F hplsof.F hplsta.F hplsur.F hplswn.F hplsym.F hpltab.F
 hpltit.F hpltoc.F hpltx1.F hpltxt.F hplu.F hplusr.F hplwin.F hplwir.F hplwn.F hplzom.F hplzon.F)
if (CERNLIB_SGI)
endif()
  list(TRANSFORM graflib_hplot_hplotf77_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../graflib/hplot/hplotf77/")
 
set(graflib_esources )
cdf_compile(${CMAKE_CURRENT_SOURCE_DIR}/dzdoc/cdf/zbrcdf.cdf ${CMAKE_CURRENT_BINARY_DIR}/zbrcdf.cdf.c)
list(APPEND graflib_esources ${CMAKE_CURRENT_BINARY_DIR}/zbrcdf.cdf.c)
if (CERNLIB_BUILD_STATIC)
add_library(graflib_static STATIC ${graflib_esources}
                             ${graflib_dzdoc_dzdkern_FSRC} 
                             ${graflib_dzdoc_dzdraw_FSRC} 
                             ${graflib_hplot_hplotcc_CSRC} 
                             ${graflib_hplot_hplotf77_FSRC} 
)
target_include_directories(graflib_static PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(graflib_static PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(graflib_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/kuip")
target_include_directories(graflib_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/dzdoc")
target_include_directories(graflib_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/hplot")
target_include_directories(graflib_static PRIVATE ${FREETYPE_INCLUDE_DIRS})
target_link_libraries(graflib_static PRIVATE ${Xm})
install(TARGETS graflib_static DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(graflib_static PROPERTIES POSITION_INDEPENDENT_CODE ${CERNLIB_POSITION_INDEPENDENT_CODE} OUTPUT_NAME graflib)
endif()
if (CERNLIB_BUILD_SHARED)
add_library(graflib SHARED ${graflib_esources}
                             ${graflib_dzdoc_dzdkern_FSRC} 
                             ${graflib_dzdoc_dzdraw_FSRC} 
                             ${graflib_hplot_hplotcc_CSRC} 
                             ${graflib_hplot_hplotf77_FSRC} 
)
target_include_directories(graflib PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(graflib PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(graflib PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/kuip")
target_include_directories(graflib PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/dzdoc")
target_include_directories(graflib PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/hplot")
target_include_directories(graflib PRIVATE ${FREETYPE_INCLUDE_DIRS})
target_link_libraries(graflib PRIVATE ${Xm})
install(TARGETS graflib DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(graflib        PROPERTIES POSITION_INDEPENDENT_CODE ON OUTPUT_NAME graflib SOVERSION 1_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR})
install_symlink(libgraflib.so.1_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR} ${CMAKE_INSTALL_LIBDIR}/libgraflib.so.1_${COMPSUFFIX})
endif()
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/dzdoc/dzdoc DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}  COMPONENT devel  PATTERN "*makefile*" EXCLUDE  PATTERN "*\.c" EXCLUDE )
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/higz/higz DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}  COMPONENT devel  PATTERN "*makefile*" EXCLUDE  PATTERN "*\.c" EXCLUDE )
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/hplot/hplot DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}  COMPONENT devel  PATTERN "*makefile*" EXCLUDE  PATTERN "*\.c" EXCLUDE )


########################################################################
#
#  Automatically or semiautomaticall generated, do not edit.
#
########################################################################
# The following input was used
# code/Imakefile

########################################################################
set_package_flags(herwig)
#herwig/code/Imakefile
 
  set(herwig_code_FSRC decadd.F eudini.F fragmt.F hvcbvi.F hvhbvi.F hwbazf.F hwbcon.F hwbded.F hwbdis.F hwbfin.F hwbgen.F hwbjco.F hwbmas.F hwbran.F hwbspa.F hwbspn.F hwbsu1.F hwbsu2.F hwbsud.F hwbsug.F
 hwbsul.F hwbtim.F hwbvmc.F hwccut.F hwcdec.F hwcfla.F hwcfor.F hwcgsp.F hwchad.F hwdbos.F hwdboz.F hwdchk.F hwdcle.F hwdeur.F hwdfiv.F hwdfor.F hwdhad.F hwdhgc.F hwdhgf.F hwdhig.F hwdhqk.F hwdhvy.F hwdidp.F
 hwdpwt.F hwdthr.F hwdtop.F hwdtwo.F hwdwwt.F hwdxlm.F hwefin.F hwegam.F hweini.F hweisr.F hweone.F hwepro.F hwetwo.F hwhbgf.F hwhbki.F hwhbrn.F hwhbsg.F hwhdis.F hwhdyp.F hwhegg.F hwhegw.F hwhegx.F hwhepa.F
 hwhepg.F hwhew0.F hwhew1.F hwhew2.F hwhew3.F hwhew4.F hwhew5.F hwheww.F hwhhvy.F hwhig1.F hwhiga.F hwhigb.F hwhigj.F hwhigm.F hwhigs.F hwhigt.F hwhigw.F hwhigy.F hwhigz.F hwhph2.F hwhpho.F hwhppb.F hwhppe.F
 hwhpph.F hwhppm.F hwhppt.F hwhpqs.F hwhqcd.F hwhqcp.F hwhrem.F hwhsct.F hwhsng.F hwhsnm.F hwhv1j.F hwhwex.F hwhwpr.F hwigin.F hwiodk.F hwmevt.F hwmlps.F hwmnbi.F hwmodk.F hwmult.F hwmwgt.F hwrazm.F hwrexp.F
 hwrexq.F hwrext.F hwrgau.F hwrgen.F hwrint.F hwrlog.F hwrpip.F hwrpow.F hwrung.F hwruni.F hwsbrn.F hwsdgg.F hwsdgq.F hwsfbr.F hwsfun.F hwsgam.F hwsgen.F hwsgqq.F hwsspc.F hwssud.F hwstab.F hwsval.F hwuaem.F
 hwuaer.F hwualf.F hwuant.F hwubpr.F hwubst.F hwucff.F hwuci2.F hwudat.F hwudkl.F hwudks.F hwudpr.F hwuecm.F hwuedt.F hwueec.F hwuemv.F hwuepr.F hwufne.F hwugau.F hwuidt.F hwuinc.F hwuine.F hwulb4.F hwuldo.F
 hwulf4.F hwuli2.F hwulob.F hwulof.F hwulor.F hwumas.F hwupcm.F hwurap.F hwures.F hwurob.F hwurof.F hwurot.F hwusor.F hwusqr.F hwusta.F hwutab.F hwutim.F hwvdif.F hwvdot.F hwvequ.F hwvsca.F hwvsum.F hwvzro.F
 hwwarn.F ieupdg.F ipdgeu.F qqinit.F qqlmat.F sasano.F sasbeh.F sasdir.F sasgam.F sasvmd.F )
  set(herwig_code_CSRC dummy.c)
if (CERNLIB_UNIX)
endif()
if (CERNLIB_LINUX)
# EXTRA_INCLUDES = -I.
endif()
#ORIGINAL #if defined(CERNLIB_LINUX) && defined(CERNLIB_POWERPC)
if (CERNLIB_LINUX AND CERNLIB_POWERPC)
endif()
  list(TRANSFORM herwig_code_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../herwig/code/")
  list(TRANSFORM herwig_code_CSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../herwig/code/")
 
set(herwig_esources )
if (CERNLIB_BUILD_STATIC)
add_library(herwig_static STATIC ${herwig_esources}
                             ${herwig_code_FSRC} 
                             ${herwig_code_CSRC} 
)
target_include_directories(herwig_static PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(herwig_static PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(herwig_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")
target_include_directories(herwig_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/herwig59")
target_include_directories(herwig_static PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS herwig_static DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(herwig_static PROPERTIES POSITION_INDEPENDENT_CODE ${CERNLIB_POSITION_INDEPENDENT_CODE} OUTPUT_NAME herwig59)
install_symlink(libherwig59.a  ${CMAKE_INSTALL_LIBDIR}/libherwig.a)
endif()
if (CERNLIB_BUILD_SHARED)
add_library(herwig SHARED ${herwig_esources}
                             ${herwig_code_FSRC} 
                             ${herwig_code_CSRC} 
)
target_include_directories(herwig PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(herwig PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(herwig PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")
target_include_directories(herwig PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/herwig59")
target_include_directories(herwig PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS herwig DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(herwig        PROPERTIES POSITION_INDEPENDENT_CODE ON OUTPUT_NAME herwig59 SOVERSION 2_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR})
install_symlink(libherwig59.so.2_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR} ${CMAKE_INSTALL_LIBDIR}/libherwig59.so.2_${COMPSUFFIX})
endif()

if (CERNLIB_BUILD_SHARED)   
  target_include_directories(herwig PRIVATE "${CMAKE_CURRENT_BINARY_DIR}/herwig59")
endif()
if (CERNLIB_BUILD_STATIC)   
  target_include_directories(herwig_static PRIVATE "${CMAKE_CURRENT_BINARY_DIR}/herwig59")
endif()
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/herwig59/herwig59.inc ${CMAKE_CURRENT_BINARY_DIR}/herwig59/HERWIG59.INC)
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/herwig59 DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}  COMPONENT libs PATTERN "*makefile*" EXCLUDE PATTERN "*HERWIG59.INC*" EXCLUDE )

if(CERNLIB_ENABLE_TEST)
  ENABLE_TESTING()
  add_subdirectory(test)
endif()

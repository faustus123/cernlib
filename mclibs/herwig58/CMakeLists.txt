
########################################################################
#
#  Automatically or semiautomaticall generated, do not edit.
#
########################################################################
# The following input was used
# code/Imakefile

########################################################################
set_package_flags(herwig58)
#herwig58/code/Imakefile
 
  set(herwig58_code_FSRC decadd.F eudini.F fragmt.F hvcbvi.F hvhbvi.F hwbazf.F hwbcon.F hwbded.F hwbdis.F hwbfin.F hwbgen.F hwbjco.F hwbmas.F hwbran.F hwbspa.F hwbspn.F hwbsu1.F hwbsu2.F hwbsud.F hwbsug.F
 hwbsul.F hwbtim.F hwbvmc.F hwccut.F hwcdec.F hwcfla.F hwcfor.F hwcgsp.F hwchad.F hwdbos.F hwdboz.F hwdcle.F hwdeur.F hwdhad.F hwdhgc.F hwdhgf.F hwdhig.F hwdhqk.F hwdhvy.F hwdidp.F hwdpwt.F hwdthr.F hwdtop.F
 hwdtwo.F hwdwwt.F hwefin.F hwegam.F hweini.F hweone.F hwepro.F hwetwo.F hwhbgf.F hwhbki.F hwhbrn.F hwhbsg.F hwhdis.F hwhdyp.F hwhegg.F hwhegw.F hwhegx.F hwhepa.F hwhepg.F hwhew0.F hwhew1.F hwhew2.F hwhew3.F
 hwhew4.F hwhew5.F hwheww.F hwhhvy.F hwhig1.F hwhiga.F hwhigb.F hwhigj.F hwhigm.F hwhigs.F hwhigt.F hwhigw.F hwhigy.F hwhigz.F hwhph2.F hwhpho.F hwhppb.F hwhppe.F hwhpph.F hwhppm.F hwhppt.F hwhqcd.F hwhqcp.F
 hwhw1j.F hwhwex.F hwhwpr.F hwigin.F hwmevt.F hwmlps.F hwmnbi.F hwmult.F hwmwgt.F hwrazm.F hwrexp.F hwrexq.F hwrext.F hwrgau.F hwrgen.F hwrint.F hwrlog.F hwrpow.F hwrung.F hwruni.F hwsbrn.F hwsdgg.F hwsdgq.F
 hwsfbr.F hwsfun.F hwsgam.F hwsgen.F hwsgqq.F hwsspc.F hwssud.F hwstab.F hwsval.F hwuaem.F hwuaer.F hwualf.F hwubpr.F hwubst.F hwucff.F hwuci2.F hwudat.F hwuecm.F hwuedt.F hwueec.F hwuemv.F hwuepr.F hwufne.F
 hwugau.F hwuidt.F hwuinc.F hwuine.F hwuldo.F hwuli2.F hwulob.F hwulof.F hwulor.F hwumas.F hwupcm.F hwurap.F hwures.F hwurob.F hwurof.F hwurot.F hwusor.F hwusqr.F hwusta.F hwutab.F hwutim.F hwvdif.F hwvdot.F
 hwvequ.F hwvsca.F hwvsum.F hwvzro.F hwwarn.F ieupdg.F ipdgeu.F iucomp.F pdfset.F qqinit.F qqlmat.F structm.F)
  list(TRANSFORM herwig58_code_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../herwig58/code/")
 
set(herwig58_esources )
if (CERNLIB_BUILD_STATIC)
add_library(herwig58_static STATIC ${herwig58_esources}
                             ${herwig58_code_FSRC} 
)
target_include_directories(herwig58_static PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(herwig58_static PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(herwig58_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")
target_include_directories(herwig58_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/herwig58")
target_include_directories(herwig58_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/herwig58")
target_include_directories(herwig58_static PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS herwig58_static DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(herwig58_static PROPERTIES POSITION_INDEPENDENT_CODE ${CERNLIB_POSITION_INDEPENDENT_CODE} OUTPUT_NAME herwig58)
endif()
if (CERNLIB_BUILD_SHARED)
add_library(herwig58 SHARED ${herwig58_esources}
                             ${herwig58_code_FSRC} 
)
target_include_directories(herwig58 PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(herwig58 PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(herwig58 PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")
target_include_directories(herwig58 PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/herwig58")
target_include_directories(herwig58 PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/herwig58")
target_include_directories(herwig58 PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS herwig58 DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(herwig58        PROPERTIES POSITION_INDEPENDENT_CODE ON OUTPUT_NAME herwig58 SOVERSION 2_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR})
install_symlink(libherwig58.so.2_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR} ${CMAKE_INSTALL_LIBDIR}/libherwig58.so.2_${COMPSUFFIX})
endif()

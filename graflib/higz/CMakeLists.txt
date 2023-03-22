
########################################################################
#
#  Automatically or semiautomaticall generated, do not edit.
#
########################################################################
# The following input was used
# ged/Imakefile
# higzcc/Imakefile
# ifalco/Imakefile
# ig/Imakefile
# ig3/Imakefile
# ih/Imakefile
# ikernel/Imakefile
# ipost/Imakefile
# iz/Imakefile
# menu/Imakefile

########################################################################
set_package_flags(higz)
#higz/ged/Imakefile
 
  set(higz_ged_FSRC iealpt.F iearc.F iearro.F ieaxis.F iebox.F iecpa.F iedele.F iefa.F iefbox.F iegrid.F iemaca.F iemaxa.F iemboa.F iemfaa.F iemfba.F iemhia.F iemopr.F iempla.F iempma.F iemsta.F iemtxa.F
 iepave.F iepl.F iepm.F iepop.F iestx.F ietx.F iewin.F igbord.F igccol.F igcfai.F igclwn.F igex.F igfirs.F iggrid.F igicol.F igifai.F iginme.F igline.F igplot.F igreq.F izged.F izpick.F izpiwi.F izpkfa.F
 izpkpl.F izundo.F)
if (CERNLIB_SUN)
endif()
  list(TRANSFORM higz_ged_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../higz/ged/")
 
#The original Imake file below included files:pilot.h
#Those were NOT processed.
#higz/higzcc/Imakefile
 
#include "pilot.h"
  set(higz_higzcc_CSRC igvers.c kuwhag.c)
#ORIGINAL #if defined(CERNLIB_FALCO) && !defined(CERNLIB_VAX)
if (CERNLIB_FALCO AND NOT CERNLIB_VAX)
  list(APPEND higz_higzcc_CSRC  falint.c)
endif()
#ORIGINAL #if defined(CERNLIB_GIF)
if (CERNLIB_GIF)
  list(APPEND higz_higzcc_CSRC  gifdecode.c gifencode.c imgpickpalette.c imgscaling.c)
endif()
#ORIGINAL #if defined(CERNLIB_UNIX) && defined(CERNLIB_CCREAD)
if (CERNLIB_UNIX AND CERNLIB_CCREAD)
  list(APPEND higz_higzcc_CSRC  ixgetl.c)
endif()
#ORIGINAL #if defined(CERNLIB_NTC)
if (CERNLIB_NTC)
  list(APPEND higz_higzcc_CSRC  ntmgt.c)
endif()
#ORIGINAL #if defined(CERNLIB_X11) && !defined(CERNLIB_WINNT)
if (CERNLIB_X11 AND NOT CERNLIB_WINNT)
  list(APPEND higz_higzcc_CSRC  rotated.c x11int.c)
endif()
#ORIGINAL #if defined(CERNLIB_TKTCL)
if (CERNLIB_TKTCL)
  list(APPEND higz_higzcc_CSRC  tkhigz.c)
endif()
#ORIGINAL #if defined(CERNLIB_ZBUF)
if (CERNLIB_ZBUF)
  list(APPEND higz_higzcc_CSRC  zbuffer.c)
endif()
#ORIGINAL #if defined(CERNLIB_X11)
if (CERNLIB_X11)
endif()
  list(TRANSFORM higz_higzcc_CSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../higz/higzcc/")
 
#The original Imake file below included files:pilot.h
#Those were NOT processed.
#higz/ifalco/Imakefile
 
#include "pilot.h"
#ORIGINAL #if defined(CERNLIB_FALCO)
if (CERNLIB_FALCO)
  set(higz_ifalco_FSRC ifclip.F ifclr.F ifdraw.F ifdrw9.F ifinit.F ifmov6.F ifmov9.F ifmove.F ifpl.F ifput.F ifscur.F ifswin.F ifvwin.F)
#ORIGINAL #if defined(CERNLIB_VAX) || defined(CERNLIB_IBM)
if (CERNLIB_VAX OR CERNLIB_IBM)
  list(APPEND higz_ifalco_FSRC  ifput1.F)
endif()
endif()
  list(TRANSFORM higz_ifalco_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../higz/ifalco/")
 
#The original Imake file below included files:pilot.h
#Those were NOT processed.
#higz/ig/Imakefile
 
#include "pilot.h"
  set(higz_ig_FSRC ica.F igadid.F igarc.F igarc1.F igarc2.F igarc3.F igarc4.F igasci.F igaxi0.F igaxi1.F igaxi2.F igaxi3.F igaxi4.F igaxis.F igbox.F igcell.F igchwk.F igcles.F igcli1.F igclip.F igcolm.F
 igconv.F igdate.F igdwk.F igelli.F igend.F igerr.F igfa.F igfbox.F iggfin.F iggif.F ighatc.F ighcx.F ighcxy.F ighis1.F ighist.F ighr01.F ightor.F iginit.F igiwin.F igiwty.F iglbl.F iglev.F igloc.F igloc2.F
 igm100.F igmess.F igmetn.F igparf.F igpave.F igphst.F igpick.F igpid.F igpie.F igpkfa.F igpkpl.F igpkpm.F igpm.F igpxmp.F igq.F igqwk.F igrap1.F igrap2.F igraph.F igrtoh.F igset.F igset1.F igsrap.F igsse.F
 igstr.F igsvie.F igtab1.F igtab2.F igtab3.F igtab4.F igtab5.F igtab6.F igtabl.F igtcch.F igterm.F igtext.F igwkty.F igzset.F iml.F ipm4id.F ipmid.F)
if (NOT CERNLIB_WINNT)
  list(APPEND higz_ig_FSRC  igxmes.F)
endif()
#ORIGINAL #if !defined(CERNLIB_DI3000)
if (NOT CERNLIB_DI3000)
  list(APPEND higz_ig_FSRC  igmeta.F igrng.F)
endif()
#ORIGINAL #if defined(CERNLIB_X11)
if (CERNLIB_X11)
  list(APPEND higz_ig_FSRC  igobj.F igrsiz.F)
endif()
if (CERNLIB_NEXT)
endif()
if (CERNLIB_HPUX)
endif()
  list(TRANSFORM higz_ig_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../higz/ig/")
 
#higz/ig3/Imakefile
 
  set(higz_ig3_FSRC iatr3.F ifa3.F igbrik.F igcone.F igcyl.F igsphe.F igtcop.F igtini.F igtmul.F igtnor.F igtor.F igtran.F igtref.F igtrot.F igtsca.F igttra.F ipl3.F ipm3.F ipm3id.F isvp3.F iswn3.F itx3.F
 ifaf3.F)
  list(TRANSFORM higz_ig3_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../higz/ig3/")
 
#higz/ih/Imakefile
 
  set(higz_ih_FSRC ihaxiv.F ihbbox.F ihclev.F ihcspe.F ihdf01.F ihdf02.F ihdf03.F ihdfl1.F ihdfl2.F ihdfr1.F ihdfr2.F iheran.F ihfbox.F ihimpf.F ihiso.F ihlegc.F ihlegp.F ihlegr.F ihlegs.F ihligh.F ihlumi.F
 ihmc00.F ihmc03.F ihmc04.F ihmc06.F ihmc07.F ihmc10.F ihmc12.F ihmc13.F ihmcmp.F ihmcpp.F ihmctt.F ihmcub.F ihmcx.F ihpff.F ihprop.F ihpvie.F ihrcle.F ihrfil.F ihrini.F ihrlin.F ihroff.F ihsdrl.F ihsini.F
 ihsmdf.F ihsurc.F ihsurp.F ihsurr.F ihsurs.F ihsvie.F ihwlin.F ihwphi.F ihwth.F ihwton.F ihwv01.F ihwv02.F ihwvr1.F ihwvr2.F ihwwnn.F ihwzn.F ihzdep.F ihztst.F)
  list(TRANSFORM higz_ih_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../higz/ih/")
 
#The original Imake file below included files:pilot.h
#Those were NOT processed.
#higz/ikernel/Imakefile
 
#include "pilot.h"
  set(higz_ikernel_FSRC iacwk.F iclks.F iclwk.F idawk.F ifa.F igsa.F igsg.F iopks.F iopwk.F ipl.F ipm.F irqlc.F irqst.F ischh.F ischup.F isclip.F iscr.F iselnt.F isfaci.F isfais.F isfasi.F isln.F islwsc.F
 ismk.F ismksc.F isplci.F ispmci.F istxal.F istxci.F istxfp.F isvp.F iswkvp.F iswkwn.F iswn.F itx.F iuwk.F)
#ORIGINAL #if !defined(CERNLIB_MSDOS)
if (NOT CERNLIB_MSDOS)
  list(APPEND higz_ikernel_FSRC  iclrwk.F)
endif()
#ORIGINAL #if defined(CERNLIB_X11)
if (CERNLIB_X11)
  list(APPEND higz_ikernel_FSRC  ikfntx.F ikuwk.F)
endif()
#ORIGINAL #if !defined(CERNLIB_BATCH)
if (NOT CERNLIB_BATCH)
  list(APPEND higz_ikernel_FSRC  ikpl.F)
endif()
#ORIGINAL #if defined(CERNLIB_GL) || defined(CERNLIB_X11) || defined(CERNLIB_FALCO) || defined(CERNLIB_MACMPW)
if (CERNLIB_GL OR CERNLIB_X11 OR CERNLIB_FALCO OR CERNLIB_MACMPW)
  list(APPEND higz_ikernel_FSRC  ikbox.F)
endif()
#ORIGINAL #if defined(CERNLIB_KERNEL) && (!defined(CERNLIB_PHIGS)) && (!defined(CERNLIB_MSDOS))
if (CERNLIB_KERNEL AND NOT CERNLIB_PHIGS AND NOT CERNLIB_MSDOS)
  list(APPEND higz_ikernel_FSRC  ikfile.F)
endif()
if (CERNLIB_DECS)
endif()
  list(TRANSFORM higz_ikernel_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../higz/ikernel/")
 
#higz/ipost/Imakefile
 
  set(higz_ipost_FSRC ipdef.F ipdlin.F ipdraw.F ipend.F ipfon.F ipfout.F ipinit.F ipiout.F ipjout.F ipltyp.F iplwid.F ipmark.F ipmove.F ipdpat.F ippstr.F iprng.F ipscol.F ipspec.F ipsvrt.F iptext.F iptlin.F
 iptmac.F ipttex.F ipzone.F ipkout.F)
if (CERNLIB_QMVAOS)
endif()
  list(TRANSFORM higz_ipost_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../higz/ipost/")
 
#The original Imake file below included files:pilot.h
#Those were NOT processed.
#higz/iz/Imakefile
 
#include "pilot.h"
  set(higz_iz_FSRC izctoi.F izctor.F izitoc.F izpave.F izrtoc.F izsav.F izsava.F izset.F izseta.F)
#ORIGINAL #if defined(CERNLIB_ZEBRA)
if (CERNLIB_ZEBRA)
  list(APPEND higz_iz_FSRC  izcda.F izcfa.F izcopy.F izdatt.F izdipi.F izdnb.F izfa3.F izfile.F izgadr.F izgcod.F izghnp.F izgngt.F izgnnt.F izgntp.F izin.F izincf.F izinci.F izincs.F izinit.F izmerg.F izml3.F izopen.F izout.F izpict.F izpl3.F izpm3.F izpush.F izrpip.F izscan.F izscpi.F izscr.F izsenv.F izstcc.F iztx3.F izwip.F)
endif()
#ORIGINAL #if defined(CERNLIB_ZEBRA) || defined(CERNLIB_MAIL)
if (CERNLIB_ZEBRA OR CERNLIB_MAIL)
  list(APPEND higz_iz_FSRC  izarc.F izatt.F izaxis.F izend.F izfbox.F izgrap.F izhist.F izlbl.F izml.F izscor.F iztabl.F iztext.F)
endif()
#ORIGINAL #if defined(CERNLIB_ZEBRA) || defined(CERNLIB_MAIL) || defined(CERNLIB_PSCRIPT)
if (CERNLIB_ZEBRA OR CERNLIB_MAIL OR CERNLIB_PSCRIPT)
  list(APPEND higz_iz_FSRC  izbox.F izclrd.F izfa.F izpl.F izpm.F izscli.F izseln.F iztx.F)
endif()
#ORIGINAL #if (!defined(CERNLIB_NTC)) && (!defined(CERNLIB_X11))
if (NOT CERNLIB_NTC AND NOT CERNLIB_X11)
  list(APPEND higz_iz_FSRC  izgnt.F)
endif()
  list(TRANSFORM higz_iz_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../higz/iz/")
 
#higz/menu/Imakefile
 
  set(higz_menu_FSRC igcmp.F igdelm.F igdime.F iggch.F iggdef.F ighigh.F igmenu.F igsmp.F)
  list(TRANSFORM higz_menu_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../higz/menu/")
 
set(higz_esources )
if (CERNLIB_BUILD_STATIC)
add_library(higz_static STATIC ${higz_esources}
                             ${higz_ged_FSRC} 
                             ${higz_higzcc_CSRC} 
                             ${higz_ifalco_FSRC} 
                             ${higz_ig_FSRC} 
                             ${higz_ig3_FSRC} 
                             ${higz_ih_FSRC} 
                             ${higz_ikernel_FSRC} 
                             ${higz_ipost_FSRC} 
                             ${higz_iz_FSRC} 
                             ${higz_menu_FSRC} 
)
target_include_directories(higz_static PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(higz_static PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(higz_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../packlib/kuip")
target_include_directories(higz_static PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS higz_static DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(higz_static PROPERTIES POSITION_INDEPENDENT_CODE ${CERNLIB_POSITION_INDEPENDENT_CODE} OUTPUT_NAME grafX11)
endif()
if (CERNLIB_BUILD_SHARED)
add_library(higz SHARED ${higz_esources}
                             ${higz_ged_FSRC} 
                             ${higz_higzcc_CSRC} 
                             ${higz_ifalco_FSRC} 
                             ${higz_ig_FSRC} 
                             ${higz_ig3_FSRC} 
                             ${higz_ih_FSRC} 
                             ${higz_ikernel_FSRC} 
                             ${higz_ipost_FSRC} 
                             ${higz_iz_FSRC} 
                             ${higz_menu_FSRC} 
)
target_include_directories(higz PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(higz PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(higz PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../packlib/kuip")
target_include_directories(higz PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS higz DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(higz        PROPERTIES POSITION_INDEPENDENT_CODE ON OUTPUT_NAME grafX11 SOVERSION 1_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR})
install_symlink(libgrafX11.so.1_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR} ${CMAKE_INSTALL_LIBDIR}/libgrafX11.so.1_${COMPSUFFIX})
endif()
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/higz DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}  COMPONENT devel  PATTERN "*makefile*" EXCLUDE  PATTERN "*\.c" EXCLUDE )

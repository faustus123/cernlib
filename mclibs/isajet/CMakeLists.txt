
########################################################################
#
#  Automatically or semiautomaticall generated, do not edit.
#
########################################################################
# The following input was used
# code/Imakefile
# isadata/Imakefile
# isarun/Imakefile
# isasusy/Imakefile
# isatape/Imakefile

########################################################################
set_package_flags(isajet)
#The original Imake file below included files:pilot.h
#Those were NOT processed.
#isajet/code/Imakefile
 
#include "pilot.h"
  set(isajet_code_FSRC amass.F charge.F cteq5l.F ctxc2i.F ctxi2c.F ctxin.F ctxout.F dblpcm.F dblvec.F dboost.F decay.F decjet.F domssm.F drllyn.F eebeg.F eemax.F elctrn.F epf.F evol01.F evol02.F evol03.F
 evol05.F evol06.F evol07.F evolms.F evolve.F flavor.F fortop.F frgjet.F frgmnt.F getpt.F gettot.F heavyx.F hevolv.F higgs.F idanti.F idgen.F iframs.F inisap.F ipartns.F ipjset.F iprtns.F irmov0.F isabeg.F
 isaend.F isaevt.F isaini.F isajet.F isasrt.F ispjet.F istrad.F iswdky.F jetgen.F label.F lboost.F logerr.F logic.F logp.F logphi.F logphw.F logpt.F logqm.F logqt.F logthw.F logx.F logxw.F logyth.F logyw.F
 lstsq.F mbias.F mbset.F nogood.F ordecr.F order.F prtevt.F prtlim.F ptfun.F qcdini.F qcdint.F qcdinz.F qcdjet.F qcdt.F qcdz.F qfunc.F ranflux.F ranlux.F readin.F rejfrg.F rejjet.F rescal.F reset.F setcon.F
 setdky.F seth.F sethss.F setnxt.F settyp.F setw.F sigdy.F sigdy2.F sigee.F sigfil.F siggam.F sigh.F sigh2.F sigh3.F sighss.F sigint.F sigqcd.F sigsse.F sigssl.F sigssy.F sigssz.F sigtc.F sigtc2.F sigtc3.F
 sigwh.F sigwhs.F sigww.F sigww2.F smszg.F ssgst.F ssgt.F struc.F strucw.F timer.F twojet.F twokin.F visaje.F whiggs.F wpair.F wwkin.F wwss.F wwst.F wwtt.F wzss.F wzst.F wzsu.F wztu.F xwwww.F xwwzz.F xzzww.F
 xzzzz.F ygenj.F decps1.F decps2.F decss3.F dectau.F decva.F dincgm.F ebeam.F estruc.F fbrbm.F spline.F ssfel.F zzall.F zzstar.F alqcd.F amgmw.F dhelas.F evol11.F kkgf1.F kkgf2.F kkgf3.F logmgm.F logmgy.F
 logmij.F mginit.F muljet.F setkkg.F sigkkg.F szjj1.F szjj2.F szjj3.F szjj4.F szjj5.F szjj6.F szjj7.F zjj.F zjj0.F zjj1.F zjj2.F zjj3.F zjj4.F zjj5.F zjj6.F zjj7.F)
#ORIGINAL #if defined(CERNLIB_VAX) && defined(CERNLIB_NOCERN)
if (CERNLIB_VAX AND CERNLIB_NOCERN)
  list(APPEND isajet_code_FSRC  datime.F)
endif()
  list(TRANSFORM isajet_code_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../isajet/code/")
 
#isajet/isadata/Imakefile
 
  set(isajet_isadata_FSRC aldata.F)
  list(TRANSFORM isajet_isadata_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../isajet/isadata/")
 
#The original Imake file below included files:pilot.h
#Those were NOT processed.
#isajet/isarun/Imakefile
 
#include "pilot.h"
#ORIGINAL #if defined(CERNLIB_INTERACT)
if (CERNLIB_INTERACT)
  set(isajet_isarun_FSRC dialog.F isaset.F)
endif()
  list(TRANSFORM isajet_isarun_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../isajet/isarun/")
 
#isajet/isasusy/Imakefile
 
  set(isajet_isasusy_FSRC ssalfs.F ssb0.F ssb1.F ssdhll.F ssdint.F ssdlam.F ssf0.F ssglbf.F ssgwq1.F ssgwq2.F ssgwt1.F ssgwt2.F ssgwt3.F ssgwt4.F ssgwt5.F ssgwt6.F ssgwt7.F ssgwt8.F ssgx1.F ssgx10.F ssgx11.F
 ssgx2.F ssgx3.F ssgx4.F ssgx5.F ssgx6.F ssgx7.F ssgx8.F ssgx9.F ssgzg1.F ssgzg2.F ssgzg3.F ssgzt.F sshcc.F sshff.F sshff1.F sshgl.F sshgm.F sshgm1.F sshhx.F sshibf.F sshnn.F sshsf.F sshww.F sshww1.F sshww2.F
 ssl1st.F sslpbf.F sslrt1.F ssmass.F ssmhc.F ssmhn.F ssmqcd.F ssmssm.F ssn1st.F ssnorm.F sspole.F ssqkbf.F sssave.F ssstbf.F sssvme.F sstest.F sstpbf.F sswwf1.F sswzbf.F sswzf1.F sswzf2.F sswzf3.F sswzf4.F
 sswzf5.F sswzf6.F sswzf7.F ssxint.F ssxlam.F sszhx.F sszwf1.F sszzf1.F sszzf5.F sszzf2.F sszzf3.F sszzf4.F sualfe.F sualfs.F sugeff.F sugfrz.F ssme3.F sssnws.F sswibf.F sszibf.F sugmas.F sugra.F sugrge.F
 surg06.F surg26.F)
  list(TRANSFORM isajet_isasusy_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../isajet/isasusy/")
 
#isajet/isatape/Imakefile
 
  set(isajet_isatape_FSRC bufin.F bufout.F edit.F isahep.F isawbg.F isawev.F isawnd.F itrans.F movlev.F prtlst.F rdbeg.F rdtape.F rend.F rgens.F wgens.F zerol.F)
  list(TRANSFORM isajet_isatape_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../isajet/isatape/")
 
set(isajet_esources )
if (CERNLIB_BUILD_STATIC)
add_library(isajet_static STATIC ${isajet_esources}
                             ${isajet_code_FSRC} 
                             ${isajet_isadata_FSRC} 
                             ${isajet_isarun_FSRC} 
                             ${isajet_isasusy_FSRC} 
                             ${isajet_isatape_FSRC} 
)
target_include_directories(isajet_static PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(isajet_static PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(isajet_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")
target_include_directories(isajet_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/isajet")
target_include_directories(isajet_static PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS isajet_static DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(isajet_static PROPERTIES POSITION_INDEPENDENT_CODE ${CERNLIB_POSITION_INDEPENDENT_CODE} OUTPUT_NAME isajet758)
endif()
if (CERNLIB_BUILD_SHARED)
add_library(isajet SHARED ${isajet_esources}
                             ${isajet_code_FSRC} 
                             ${isajet_isadata_FSRC} 
                             ${isajet_isarun_FSRC} 
                             ${isajet_isasusy_FSRC} 
                             ${isajet_isatape_FSRC} 
)
target_include_directories(isajet PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(isajet PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(isajet PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")
target_include_directories(isajet PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/isajet")
target_include_directories(isajet PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS isajet DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(isajet        PROPERTIES POSITION_INDEPENDENT_CODE ON OUTPUT_NAME isajet758 SOVERSION 3_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR})
install_symlink(libisajet758.so.3_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR} ${CMAKE_INSTALL_LIBDIR}/libisajet758.so.3_${COMPSUFFIX})
endif()

install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/isajet DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}  COMPONENT libs PATTERN "*makefile*" EXCLUDE )
add_subdirectory(data)

if(CERNLIB_ENABLE_TEST)
  ENABLE_TESTING()
  add_subdirectory(test)
endif()


########################################################################
#
#  Automatically or semiautomaticall generated, do not edit.
#
########################################################################
# The following input was used
# npdf/Imakefile
# spdf/Imakefile
# tpdf/Imakefile

########################################################################
set_package_flags(pdf)
#pdf/npdf/Imakefile
 
  set(pdf_npdf_FSRC eks98.F eksarp.F sfeks98.F structa.F)
#ORIGINAL #if !defined(CERNLIB_GFORTRAN)
if (NOT CERNLIB_GFORTRAN)
else()
endif()
#ORIGINAL #if defined(CERNLIB_QMIRIX64)
if (CERNLIB_QMIRIX64)
# EXTRA_INCLUDES = -I$(CVSCOSRC)/mclibs/pdf/pdf
endif()
#ORIGINAL #if defined(CERNLIB_SGI)
if (CERNLIB_SGI)
endif()
if (CERNLIB_HPUX)
endif()
  list(TRANSFORM pdf_npdf_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../pdf/npdf/")
 
#pdf/spdf/Imakefile
 
  set(pdf_spdf_FSRC abfkw1.F abfkw2.F abfkw3.F acfgp1.F acfgp2.F afcplu.F afgetfv.F afgin2.F afgint.F afpolin.F afratin.F alphas2.F augetfv.F aurgam.F aurpi1.F aurpi2.F aurpi3.F aurpr.F bbeta.F bxf3.F
 bxglue.F bxqbar.F ctq1opd.F ctq1opf.F ctq1pd.F ctq1pf.F ctq2opd.F ctq2opf.F ctq2ops.F ctq2ppd.F ctq2ppf.F ctq2pps.F ctq3pd.F ctq3pds.F ctq3pf.F ctq4fn.F ctq4pnx.F ctq4ra1.F ctq4ra2.F ctq4ra4.F ctq4ra5.F
 ctq4rd.F ctq4rhj.F ctq4rl.F ctq4rm.F ctq4rlq.F ctq4rhq.F ctq4r_hq1.F ctq4rf3.F ctq4rf4.F ctq5d.F ctq5f3.F ctq5f4.F ctq5hj.F ctq5hq.F ctq5hq1.F ctq5l.F ctq5m.F ctq5m1.F ctq5pdf.F ctq5pnx.F ctq5lp.F ctq5mi.F
 dbfint.F dflm1.F dflm2.F dflm3.F dflm4.F dflm5.F dflm6.F dflm7.F dflm8.F dflm9.F dgpho1.F dgpho2.F dgpho3.F dgpho4.F dopho1.F dopho2.F dpolin.F faux5l.F faux5mi.F fxaver.F fxg160.F fxg260.F fxg360.F fxghar.F
 fxgsof.F fxnlla.F fxvhar.F fxvsof.F gamfun.F gammado.F ghrdv.F ghrgl.F ghruv.F ghrxi.F ghrxs.F gr94fv.F gr94fw.F gr94fws.F grv94di.F grv94ho.F grv94lo.F grsf1.F grsf2.F grsgalo.F grsvh1.F grsvh2.F grsvl1.F
 grsvl2.F grvfgp.F grvfqbp.F grvfv.F grvfvp.F grvfw.F grvfws.F grvgah0.F grvgaho.F grvgalo.F grvgf.F grvgfs.F grvho.F grvlo.F grvpiho.F grvpilo.F grv98_lo.F grv98_nlm.F grv98_nld.F gs2xcor.F gs96ho.F gs96lo.F
 gsxcor.F hmrs1eb.F hmrs2eb.F hmrs3eb.F hmrsgeb.F kmrseb.F kmrsgeb.F mrsdshd.F mrsdshp.F mrseb.F mrsebp.F newdo1.F pdf_beta.F pdfset.F pdfsta.F pdfvers.F pdxmt.F pdzxmt.F pftopdg.F phgal.F phlac1.F phlac2.F
 phlac3.F rxdv.F rxglue.F rxqbar.F rxud.F sasan1.F sasano.F sasbeh.F sasdir.F sasgam1.F sasgam2.F sasvm1.F sasvmd.F seadis.F sfabfow.F sfafg1.F sfbma.F sfbmb.F sfctq11.F sfctq12.F sfctq13.F sfctq14.F sfctq15.F
 sfctq21.F sfctq22.F sfctq23.F sfctq24.F sfctq25.F sfctq26.F sfctq31.F sfctq32.F sfctq33.F sfdisd0.F sfdisdm.F sfdish.F sfdiss0.F sfehlq1.F sfctq41.F sfctq42.F sfctq43.F sfctq44.F sfctq45.F sfctq46.F sfctq47.F
 sfctq48.F sfctq49.F sfctq51.F sfctq52.F sfctq53.F sfctq54.F sfctq55.F sfctq56.F sfctq57.F sfctq58.F sfctq59.F sfdisa.F sfdsqa.F sfehlq2.F sfgal.F sfgrvh.F sfgrvl.F sfgsho.F sfgslo1.F sfgslo2.F sfkbmr2.F
 sfkbmr5.F sflacg1.F sflacg2.F sflacg3.F sfmfap.F sfmfr1.F sfmfr2.F sfmrs_98a1.F sfmrs_98a2.F sfmrs_98a3.F sfmrs_98a4.F sfmrs_98a5.F sfmrs_98d1.F sfmrs_98d2.F sfmrs_98d3.F sfmrs_98d4.F sfmrs_98d5.F sfmrs_98ht1.F
 sfmrs_98lo1.F sfmrs_98lo2.F sfmrs_98lo3.F sfmrs_98lo4.F sfmrs_98lo5.F sfmrs_99a1.F sfmrs_99a10.F sfmrs_99a11.F sfmrs_99a12.F sfmrs_99a2.F sfmrs_99a3.F sfmrs_99a4.F sfmrs_99a5.F sfmrs_99a6.F sfmrs_99a7.F
 sfmrs_99a8.F sfmrs_99a9.F sfmrs_99d1.F sfmrs_99d10.F sfmrs_99d11.F sfmrs_99d2.F sfmrs_99d3.F sfmrs_99d4.F sfmrs_99d5.F sfmrs_99d6.F sfmrs_99d7.F sfmrs_99d8.F sfmrs_99d9.F sfmrsd0.F sfmrsdm.F sfmrsg.F
 sfmrsj.F sfmrss0.F sfmrsc1.F sfmrsc2.F sfmrsc3.F sfmsap.F sfmsba.F sfmsbb0.F sfmsbd0.F sfmsbdm.F sfmsbh.F sfmsbs0.F sfmsfa.F sfmsfg.F sfmsqa.F sfms105.F sfms110.F sfms115.F sfms120.F sfms125.F sfms130.F
 sfmsjp.F sfmsr1.F sfmsr2.F sfmsr3.F sfmsr4.F sfmt10.F sfmt11.F sfmtu1.F sfmtu2.F sfmtu3.F sfmtu4.F sfmtu5.F sfmtu6.F sfmtu7.F sfmtu8.F sfmtu9.F sfsas11.F sfsas12.F sfsas13.F sfsas14.F sfsas21.F sfsas22.F
 sfsas23.F sfsas24.F sfwhi1.F sfwhi2.F sfwhi3.F sfwhi4.F sfwhi5.F sfwhi6.F smrsp31.F smrsp32.F smrsp33.F smrspi.F srctq21.F srctq22.F srctq23.F spctq51.F spctq53.F srctq24.F srctq25.F srctq26.F strbebc.F
 strbep.F strcbp.F srctq45.F srctq46.F srctq47.F srctq48.F strcep.F strdo1.F strdo2.F strghr.F strh1b.F strh1e.F strh2b.F strh2e.F strh3b.F strh3b1.F strh3b3.F strh3e.F strh3em.F strh3ep.F strkb0.F strkb02.F
 strkb03.F strkb04.F strkb05.F strkb0o.F strkbm.F strmrs1.F strmrs2.F strmrs3.F strowp1.F strowp2.F strpriv.F strucb.F struce.F strucor.F structf.F structm.F structp.F v3.F valdis.F wate32.F whit1g.F whit1q.F
 whit2g.F whit2q.F whit3g.F whit3q.F whit4g.F whit4q.F whit5g.F whit5q.F whit6g.F whit6q.F)
#ORIGINAL #if !defined(CERNLIB_GFORTRAN)
if (NOT CERNLIB_GFORTRAN)
else()
endif()
#ORIGINAL #if defined(CERNLIB_QMIRIX64)
if (CERNLIB_QMIRIX64)
# EXTRA_INCLUDES = -I$(CVSCOSRC)/mclibs/pdf/pdf
endif()
#ORIGINAL #if defined(CERNLIB_SGI)
if (CERNLIB_SGI)
endif()
if (CERNLIB_HPUX)
endif()
  list(TRANSFORM pdf_spdf_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../pdf/spdf/")
 
#pdf/tpdf/Imakefile
 
#ORIGINAL #if defined(CERNLIB_QMIRIX64)
if (CERNLIB_QMIRIX64)
# EXTRA_INCLUDES = -I$(CVSCOSRC)/mclibs/pdf/pdf
endif()
#ORIGINAL #if defined(CERNLIB_SGI)
if (CERNLIB_SGI)
endif()
if (CERNLIB_HPUX)
endif()
 
set(pdf_esources )
if (CERNLIB_BUILD_STATIC)
add_library(pdf_static STATIC ${pdf_esources}
                             ${pdf_npdf_FSRC} 
                             ${pdf_spdf_FSRC} 
)
target_include_directories(pdf_static PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(pdf_static PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(pdf_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")
target_include_directories(pdf_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/pdf")
target_include_directories(pdf_static PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS pdf_static DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(pdf_static PROPERTIES POSITION_INDEPENDENT_CODE ${CERNLIB_POSITION_INDEPENDENT_CODE} OUTPUT_NAME pdflib804)
endif()
if (CERNLIB_BUILD_SHARED)
add_library(pdf SHARED ${pdf_esources}
                             ${pdf_npdf_FSRC} 
                             ${pdf_spdf_FSRC} 
)
target_include_directories(pdf PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(pdf PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(pdf PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")
target_include_directories(pdf PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/pdf")
target_include_directories(pdf PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS pdf DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(pdf        PROPERTIES POSITION_INDEPENDENT_CODE ON OUTPUT_NAME pdflib804 SOVERSION 2_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR})
install_symlink(libpdflib804.so.2_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR} ${CMAKE_INSTALL_LIBDIR}/libpdflib804.so.2_${COMPSUFFIX})
endif()

install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/pdf DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}  COMPONENT libs PATTERN "*makefile*" EXCLUDE )
if(CERNLIB_ENABLE_TEST)
  ENABLE_TESTING()
  add_subdirectory(tpdf)
endif()

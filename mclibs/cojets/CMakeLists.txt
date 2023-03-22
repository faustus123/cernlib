
########################################################################
#
#  Automatically or semiautomaticall generated, do not edit.
#
########################################################################
# The following input was used
# code/Imakefile
# cojdata/Imakefile
# cojtapew/Imakefile

########################################################################
set_package_flags(cojets)
#cojets/code/Imakefile
 
  set(cojets_code_FSRC acosx.F alias.F amass.F asimp.F atan2x.F baryo.F bboost.F bdecay.F betaeu.F bevber.F bevint.F bgefla.F bgeven.F bgexin.F bgpair.F bjets.F bkweig.F blept.F bmcorr.F book.F boso.F
 bpregn.F bradlp.F bwidth.F charge.F chdec.F cjeb.F cjrn.F cojets.F ddang.F decay.F dmatch.F dqhfsi.F dqhid.F dqhnid.F dreyin.F dsdt.F dsexg.F dsexq.F dshvg.F dshvq.F dumpev.F editp.F eicht1.F eicht2.F
 evol.F f2in.F fevinb.F fevinj.F fglu.F figlu.F fillbo.F fillhd.F findx.F fiqrk.F flavex.F fmul.F fmuldg.F force.F forcsl.F forpre.F framul.F freeze.F fun1.F fun2.F fun3.F fusion.F gecode.F gefla.F gepair.F
 geqsq.F gevent.F gexin.F grot.F gsplit.F hadron.F hard.F headb.F headh.F heavyq.F hgeven.F idext.F idgen.F iniqcd.F inpart.F inqcds.F inset.F intid.F jdentf.F jetcor.F jetgen.F jetqcd.F jtbook.F kno.F
 krcomb.F label.F list.F listph.F looseq.F loren4.F lorlab.F match.F mnbias.F movlev.F mpscat.F overdm.F p4corr.F papint.F partab.F pregen.F prhead.F psqgen.F ptwgt.F q2gen.F readin.F readtb.F reorsl.F
 rotjet.F rotqua.F sblock.F shocas.F spectj.F stabkp.F stabph.F stopd.F tables.F tbkisa.F tbook.F tevol.F timelf.F topdcy.F wdang.F wdecay.F wdecif.F weakin.F wpardn.F wpsqz.F wrad.F writeb.F writeh.F
 x1exp.F z0rad.F zdang.F zdecay.F zdecif.F zgen.F zgens.F zlim.F zlimsy.F zpsqz.F)
#ORIGINAL #if !defined(CERNLIB_GFORTRAN)
if (NOT CERNLIB_GFORTRAN)
else()
endif()
if (CERNLIB_IBMRT)
endif()
  list(TRANSFORM cojets_code_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../cojets/code/")
 
#cojets/cojdata/Imakefile
 
  set(cojets_cojdata_FSRC cojver.F data.F)
#ORIGINAL #if !defined(CERNLIB_GFORTRAN)
if (NOT CERNLIB_GFORTRAN)
else()
endif()
  list(TRANSFORM cojets_cojdata_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../cojets/cojdata/")
 
#cojets/cojtapew/Imakefile
 
  set(cojets_cojtapew_FSRC bookh.F bufout.F edit.F fillh.F ichcnv.F isbosf.F isjtpf.F isjtqf.F outh.F pptcl.F wgens.F wrbeg.F wrend.F wrtape.F)
#ORIGINAL #if !defined(CERNLIB_GFORTRAN)
if (NOT CERNLIB_GFORTRAN)
else()
endif()
  list(TRANSFORM cojets_cojtapew_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../cojets/cojtapew/")
 
set(cojets_esources )
if (CERNLIB_BUILD_STATIC)
add_library(cojets_static STATIC ${cojets_esources}
                             ${cojets_code_FSRC} 
                             ${cojets_cojdata_FSRC} 
                             ${cojets_cojtapew_FSRC} 
)
target_include_directories(cojets_static PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(cojets_static PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(cojets_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")
target_include_directories(cojets_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/cojets")
target_include_directories(cojets_static PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS cojets_static DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(cojets_static PROPERTIES POSITION_INDEPENDENT_CODE ${CERNLIB_POSITION_INDEPENDENT_CODE} OUTPUT_NAME cojets)
endif()
if (CERNLIB_BUILD_SHARED)
add_library(cojets SHARED ${cojets_esources}
                             ${cojets_code_FSRC} 
                             ${cojets_cojdata_FSRC} 
                             ${cojets_cojtapew_FSRC} 
)
target_include_directories(cojets PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(cojets PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(cojets PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")
target_include_directories(cojets PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/cojets")
target_include_directories(cojets PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS cojets DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(cojets        PROPERTIES POSITION_INDEPENDENT_CODE ON OUTPUT_NAME cojets SOVERSION 2_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR})
install_symlink(libcojets.so.2_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR} ${CMAKE_INSTALL_LIBDIR}/libcojets.so.2_${COMPSUFFIX})
endif()

install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/cojets DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}  COMPONENT libs PATTERN "*makefile*" EXCLUDE )
add_subdirectory(data)

if(CERNLIB_ENABLE_TEST)
  ENABLE_TESTING()
  add_subdirectory(test)
endif()

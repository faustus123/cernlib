
########################################################################
#
#  Automatically or semiautomaticall generated, do not edit.
#
########################################################################
# The following input was used
# kernbit/i303/Imakefile
# kernbit/j530/Imakefile
# kernbit/m231asm/Imakefile
# kernbit/m233vax/Imakefile
# kernbit/m429/Imakefile
# kernbit/m433/Imakefile
# kernbit/m437/Imakefile
# kernbit/m439/Imakefile
# kernbit/m442/Imakefile
# kernbit/m443/Imakefile
# kernbit/t000/Imakefile
# kernbit/z009/Imakefile
# kernbit/z265/Imakefile
# kernbit/z268/Imakefile
# kerngen/ccgen/Imakefile
# kerngen/ccgencf/Imakefile
# kerngen/ccgenci/Imakefile
# kerngen/ccgenu/Imakefile
# kerngen/tcgen/Imakefile
# kerngen/tcgens/Imakefile
# kerngen/unix/gfortgs/Imakefile
# kerngen/xvect/Imakefile
# kernnum/c204fort/Imakefile
# kernnum/c205fort/Imakefile
# kernnum/d106fort/Imakefile
# kernnum/d509fort/Imakefile
# kernnum/d703fort/Imakefile
# kernnum/d704fort/Imakefile
# kernnum/e100fort/Imakefile
# kernnum/e104fort/Imakefile
# kernnum/e105fort/Imakefile
# kernnum/e106fort/Imakefile
# kernnum/e208fort/Imakefile
# kernnum/f002fort/Imakefile
# kernnum/f003fort/Imakefile
# kernnum/f004fort/Imakefile
# kernnum/f010fort/Imakefile
# kernnum/f011fort/Imakefile
# kernnum/f012fort/Imakefile
# kernnum/f406fort/Imakefile
# kernnum/g900fort/Imakefile
# kernnum/g901fort/Imakefile
# kernnum/n001fort/Imakefile
# umon/umonftn/Imakefile

########################################################################
set_package_flags(kernlib)
#kernlib/kernbit/i303/Imakefile
 
  set(kernlib_kernbit_i303_FSRC ralph.F rdendb.F rdigi.F rdint.F rdload.F rdmant.F rdmode.F rdname.F rdnext.F rdskip.F rdskpb.F rdupch.F rdupst.F rdwdat.F rdword.F)
  list(TRANSFORM kernlib_kernbit_i303_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernbit/i303/")
 
#kernlib/kernbit/j530/Imakefile
 
  set(kernlib_kernbit_j530_FSRC binsiz.F)
  list(TRANSFORM kernlib_kernbit_j530_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernbit/j530/")
 
#kernlib/kernbit/m231asm/Imakefile
 
  set(kernlib_kernbit_m231asm_SSRC dibdx.s dxdib.s sibsx.s sxsib.s)
  list(TRANSFORM kernlib_kernbit_m231asm_SSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernbit/m231asm/")
 
#kernlib/kernbit/m233vax/Imakefile
 
  set(kernlib_kernbit_m233vax_SSRC tra0e0.s tre0a0.s)
  list(TRANSFORM kernlib_kernbit_m233vax_SSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernbit/m233vax/")
 
#kernlib/kernbit/m429/Imakefile
 
#ORIGINAL #if defined(CERNLIB_VAX) && !defined(CERNLIB_QMALPH)
if (CERNLIB_VAX AND NOT CERNLIB_QMALPH)
  set(kernlib_kernbit_m429_SSRC numbitvx.s)
else()
  set(kernlib_kernbit_m429_FSRC numbit.F)
endif()
  list(TRANSFORM kernlib_kernbit_m429_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernbit/m429/")
  list(TRANSFORM kernlib_kernbit_m429_SSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernbit/m429/")
 
#kernlib/kernbit/m433/Imakefile
 
  set(kernlib_kernbit_m433_FSRC indexa.F indexb.F indexc.F indexn.F indexs.F indxac.F indxbc.F indxnc.F iscan.F repeat.F spaces.F strip.F subword.F verify.F word.F words.F wordsep.F)
if (CERNLIB_OS9)
  set(kernlib_kernbit_m433_CSRC m433f2h.c)
endif()
  list(TRANSFORM kernlib_kernbit_m433_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernbit/m433/")
  list(TRANSFORM kernlib_kernbit_m433_CSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernbit/m433/")
 
#kernlib/kernbit/m437/Imakefile
 
#ORIGINAL #if defined(CERNLIB_VAX) && !defined(CERNLIB_QMALPH)
if (CERNLIB_VAX AND NOT CERNLIB_QMALPH)
  set(kernlib_kernbit_m437_SSRC getbitvx.s)
else()
  set(kernlib_kernbit_m437_FSRC getbit.F setbit.F)
endif()
  list(TRANSFORM kernlib_kernbit_m437_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernbit/m437/")
  list(TRANSFORM kernlib_kernbit_m437_SSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernbit/m437/")
 
#kernlib/kernbit/m439/Imakefile
 
  set(kernlib_kernbit_m439_FSRC getbyt.F setbyt.F)
  list(TRANSFORM kernlib_kernbit_m439_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernbit/m439/")
 
#kernlib/kernbit/m442/Imakefile
 
  set(kernlib_kernbit_m442_FSRC namefd.F)
  list(TRANSFORM kernlib_kernbit_m442_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernbit/m442/")
 
#kernlib/kernbit/m443/Imakefile
 
  set(kernlib_kernbit_m443_FSRC charn.F icharn.F rchar.F)
  list(TRANSFORM kernlib_kernbit_m443_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernbit/m443/")
 
#kernlib/kernbit/t000/Imakefile
 
  set(kernlib_kernbit_t000_FSRC initc.F)
  list(TRANSFORM kernlib_kernbit_t000_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernbit/t000/")
 
#kernlib/kernbit/z009/Imakefile
 
  set(kernlib_kernbit_z009_FSRC caldat.F cdmon.F cleap.F cydiy.F cyear4.F)
  list(TRANSFORM kernlib_kernbit_z009_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernbit/z009/")
 
#kernlib/kernbit/z265/Imakefile
 
  set(kernlib_kernbit_z265_FSRC whichf.F)
  list(TRANSFORM kernlib_kernbit_z265_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernbit/z265/")
 
#kernlib/kernbit/z268/Imakefile
 
  set(kernlib_kernbit_z268_CSRC systems.c)
  list(TRANSFORM kernlib_kernbit_z268_CSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernbit/z268/")
 
#kernlib/kerngen/ccgen/Imakefile
 
if (NOT CERNLIB_VAXVMS)
  set(kernlib_kerngen_ccgen_FSRC accessf.F chdirf.F getenvf.F getwdf.F lstatf.F perrorf.F readlnf.F renamef.F setenvf.F statf.F systemf.F tmpro.F toslat.F unlinkf.F)
#The file below does not exist in this dir, use C version
#tmproi.F
  set(kernlib_kerngen_ccgen_CSRC abend.c accesi.c chdiri.c ctimef.c datime.c datimh.c exitf.c geteni.c getgidf.c getpidf.c getuidf.c getwdi.c gmtimef.c intrac.c jmplong.c jmpset.c jumptn.c jumpxn.c kervers.c
 killf.c locb.c locf.c perroi.c qnexte.c readlni.c renami.c seteni.c setjmpf.c sleepf.c signalf.c sigprnt.c sigunbl.c stati.c systei.c tminit.c unlini.c tmread.c tmproi.c)
if (CERNLIB_QMLXIA64)
  list(APPEND kernlib_kerngen_ccgen_CSRC chkloc.c)
endif()
if (NOT CERNLIB_OS9)
  list(APPEND kernlib_kerngen_ccgen_CSRC timel.c lstati.c)
endif()
if (CERNLIB_QFAPOGEE)
  list(APPEND kernlib_kerngen_ccgen_CSRC apofsz.c)
endif()
#ORIGINAL #if defined(CERNLIB_WINNT) || defined(CERNLIB_LINUX)
if (CERNLIB_WINNT OR CERNLIB_LINUX)
  list(APPEND kernlib_kerngen_ccgen_CSRC lnblnk.c)
endif()
#ORIGINAL #if defined(CERNLIB_WINNT) && defined(CERNLIB_MSSTDCALL)
if (CERNLIB_WINNT AND CERNLIB_MSSTDCALL)
  list(APPEND kernlib_kerngen_ccgen_CSRC locbdummy.c locfdummy.c)
endif()
#ORIGINAL #if defined(CERNLIB_DECS) || defined(CERNLIB_QMVAOS) || defined(CERNLIB_HPUX) || defined(CERNLIB_IBMRT) || defined(CERNLIB_IBMRTD) || defined(CERNLIB_OS9)
if (CERNLIB_DECS OR CERNLIB_QMVAOS OR CERNLIB_HPUX OR CERNLIB_IBMRT OR CERNLIB_IBMRTD OR CERNLIB_OS9)
  list(APPEND kernlib_kerngen_ccgen_CSRC lenocc.c lnblnk.c)
endif()
#ORIGINAL #if defined(CERNLIB_SGI) || defined(CERNLIB_SUN) || defined(CERNLIB_SOLARIS)
if (CERNLIB_SGI OR CERNLIB_SUN OR CERNLIB_SOLARIS)
  list(APPEND kernlib_kerngen_ccgen_CSRC lenocc.c)
endif()
else()
  set(kernlib_kerngen_ccgen_FSRC accessf.F chdirf.F getenvf.F getwdf.F perrorf.F statf.F toslat.F renamef.F systemf.F tmpro.F)
  set(kernlib_kerngen_ccgen_CSRC accesi.c datime.c datimh.c perroi.c stati.c)
if (CERNLIB_QMALPH)
  list(APPEND kernlib_kerngen_ccgen_CSRC  qnexte.c vxinvb.c vxinvc.c)
endif()
endif()
if (NOT CERNLIB_DOS)
  list(APPEND kernlib_kerngen_ccgen_CSRC  vxinvb.c vxinvc.c)
endif()
  list(TRANSFORM kernlib_kerngen_ccgen_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kerngen/ccgen/")
  list(TRANSFORM kernlib_kerngen_ccgen_CSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kerngen/ccgen/")
 
#kernlib/kerngen/ccgencf/Imakefile
 
  set(kernlib_kerngen_ccgencf_FSRC cfopen.F cfstat.F)
  set(kernlib_kerngen_ccgencf_CSRC cfclos.c cfget.c cfopei.c cfperm.c cfput.c cfrew.c cfseek.c cfsize.c cfstati.c cftell.c)
#ORIGINAL #if defined(CERNLIB_WINNT) && defined(CERNLIB_MSSTDCALL)
if (CERNLIB_WINNT AND CERNLIB_MSSTDCALL)
  list(APPEND kernlib_kerngen_ccgencf_CSRC cfputdummy.c cfgetdummy.c)
endif()
if (CERNLIB_SHIFT)
# EXTRA_INCLUDES: = $(EXTRA_INCLUDES) -I/usr/local/include
endif()
  list(TRANSFORM kernlib_kerngen_ccgencf_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kerngen/ccgencf/")
  list(TRANSFORM kernlib_kerngen_ccgencf_CSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kerngen/ccgencf/")
 
#kernlib/kerngen/ccgenci/Imakefile
 
  set(kernlib_kerngen_ccgenci_FSRC ciopen.F)
  set(kernlib_kerngen_ccgenci_CSRC ciclos.c ciget.c cigetw.c ciopei.c ciperm.c ciput.c ciputw.c cirew.c ciseek.c cisize.c citell.c)
if (CERNLIB_SHIFT)
# EXTRA_INCLUDES: = $(EXTRA_INCLUDES) -I/usr/local/include
endif()
  list(TRANSFORM kernlib_kerngen_ccgenci_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kerngen/ccgenci/")
  list(TRANSFORM kernlib_kerngen_ccgenci_CSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kerngen/ccgenci/")
 
#kernlib/kerngen/ccgenu/Imakefile
 
  set(kernlib_kerngen_ccgenu_CSRC fchput.c fchtak.c)
  list(TRANSFORM kernlib_kerngen_ccgenu_CSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kerngen/ccgenu/")
 
#kernlib/kerngen/tcgen/Imakefile
 
  set(kernlib_kerngen_tcgen_FSRC amaxmu.F bitpos.F blow.F bunch.F ccopiv.F ccopyl.F ccopyr.F ccosub.F cenvir.F cfill.F cfromi.F cfweof.F )
  set(kernlib_kerngen_tcgen_FSRC amaxmu.F bitpos.F blow.F bunch.F ccopiv.F ccopyl.F ccopyr.F ccosub.F cenvir.F cfill.F cfromi.F cfweof.F cleft.F cltou.F cright.F cross.F csetdi.F csetvi.F csetvm.F csqmbl.F
 csqmch.F ctrans.F cutol.F doti.F ffsize.F floarg.F flpsor.F gshow.F gshowf.F icdeci.F icequ.F icfila.F icfind.F icfmul.F icfnbl.F ichexi.F icinq.F icinql.F icinqu.F icloc.F iclocl.F iclocu.F icluns.F
 icnext.F icnth.F icnthl.F icnthu.F icnum.F icnuma.F icnumu.F icocti.F ictype.F ie3fod.F ie3tod.F ifromc.F intarg.F intsor.F iuback.F iubin.F iuchan.F iucola.F iuend.F iufila.F iufnbl.F iuforw.F iuhist.F
 iulast.F iulook.F iumode.F iunext.F kerngt.F loren4.F lorenb.F lorenf.F lvsdmi.F lvsdmx.F lvsimi.F lvsimx.F lvsmi.F lvsmx.F matin1.F mxequ.F mxmad.F mxmlrt.F mxtrp.F mxuty.F ncdeci.F nchexi.F ncocti.F
 poweze.F proxim.F pscale.F ranecq.F ranecu.F ranmar.F rannor.F rmmaq.F rmmar.F rot.F setfmt.F smxinv.F sorcha.F sortd.F sorti.F sortr.F sortx.F sortzv.F tcdump.F tlerr.F tlpiv.F tlres.F tls.F tlsc.F tlsmsq.F
 tlstep.F tlswop.F tluk.F traat.F traceq.F tral.F tralt.F tras.F trasat.F trata.F trats.F tratsa.F trchlu.F trchul.F trinv.F trla.F trlta.F trpck.F trqsq.F trsa.F trsat.F trsinv.F trsmlu.F trsmul.F trupck.F
 ubits.F ucocop.F udicop.F uleft.F uopt.F uoptc.F uright.F uset.F utrans.F vdist.F vdist2.F vizpri.F vlinco.F)
#ORIGINAL #if !defined(CERNLIB_DOS) || defined(CERNLIB_QFMSOFT)
if (NOT CERNLIB_DOS OR CERNLIB_QFMSOFT)
  list(APPEND kernlib_kerngen_tcgen_FSRC  ckrack.F csethi.F csetoi.F incbyt.F iuweed.F locbyt.F)
endif()
#ORIGINAL #if defined(CERNLIB_SUN) || defined(CERNLIB_SGI)
if (CERNLIB_SUN OR CERNLIB_SGI)
  list(APPEND kernlib_kerngen_tcgen_FSRC  ibits.F mvbits.F ishftc.F)
endif()
#ORIGINAL #if defined(CERNLIB_DOS) && !defined(CERNLIB_QFMSOFT)
if (CERNLIB_DOS AND NOT CERNLIB_QFMSOFT)
  list(APPEND kernlib_kerngen_tcgen_FSRC  ibits.F mvbits.F)
endif()
if (CERNLIB_VAX)
  list(APPEND kernlib_kerngen_tcgen_FSRC  getarg.F lenocc.F)
endif()
#ORIGINAL #if defined(CERNLIB_DOS) || defined(CERNLIB_MPW) || defined(CERNLIB_LNX) || defined(CERNLIB_WINNT)
if (CERNLIB_DOS OR CERNLIB_MPW OR CERNLIB_LNX OR CERNLIB_WINNT)
  list(APPEND kernlib_kerngen_tcgen_FSRC  lenocc.F)
endif()
if (CERNLIB_HPUX)
  list(APPEND kernlib_kerngen_tcgen_FSRC  getarg.F)
endif()
if (CERNLIB_IBM)
  list(APPEND kernlib_kerngen_tcgen_FSRC  chtoig.F)
else()
  list(APPEND kernlib_kerngen_tcgen_FSRC  chtoi.F itoch.F)
endif()
  list(TRANSFORM kernlib_kerngen_tcgen_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kerngen/tcgen/")
 
#kernlib/kerngen/tcgens/Imakefile
 
  set(kernlib_kerngen_tcgens_FSRC ie3fos.F ie3tos.F iucomp.F iufind.F iuhunt.F iusame.F jobnam.F jrsbyt.F lvmax.F lvmaxa.F lvmin.F lvmina.F msbit.F msbit0.F msbit1.F mbytet.F noarg.F pkchar.F rndm.F sbit.F
 sbit0.F sbit1.F sbytor.F sbytpk.F ublank.F ublow.F ubunch.F ucopiv.F ucopy.F ucopyn.F uctoh.F uctoh1.F ufill.F uh1toc.F uhtoc.F upkbyt.F uswop.F uzero.F vadd.F vasum.F vbias.F vblank.F vcopyn.F vdot.F
 vdotn.F vdotn2.F vexcum.F vfill.F vfix.F vfloat.F vline.F vmatl.F vmatr.F vmax.F vmaxa.F vmin.F vmina.F vmod.F vmul.F vscale.F vsub.F vsum.F vunit.F vzero.F)
if (NOT CERNLIB_DOS)
  list(APPEND kernlib_kerngen_tcgens_FSRC  cbyt.F jbit.F jbyt.F jbytet.F jbytor.F jbytpk.F mbytor.F mcbyt.F msbyt.F pkbyt.F sbyt.F upkch.F)
endif()
#ORIGINAL #if defined(CERNLIB_2022)
if (CERNLIB_2022)
  list(APPEND kernlib_kerngen_tcgens_FSRC  vzeroi.F vzerol.F vzeror.F vzerod.F vfilli.F vfilll.F vfillr.F vfilld.F vzeroi.F uzeroi.F uzerol.F uzeror.F uzerod.F ucopyi.F ucopyl.F ucopyr.F ucopyd.F)
endif()
#ORIGINAL #if defined(CERNLIB_VAX) || defined(CERNLIB_DECS) || defined(CERNLIB_QMVAOS) || defined(CERNLIB_DOS) || defined(CERNLIB_LNX) || defined(CERNLIB_WINNT)
if (CERNLIB_VAX OR CERNLIB_DECS OR CERNLIB_QMVAOS OR CERNLIB_DOS OR CERNLIB_LNX OR CERNLIB_WINNT)
  list(APPEND kernlib_kerngen_tcgens_FSRC  iucomh.F)
endif()
#ORIGINAL #if defined(CERNLIB_QMVAOS) || defined(CERNLIB_IBMRT) || defined(CERNLIB_SOLARIS) || defined(CERNLIB_LINUX) || defined(CERNLIB_SGI)
if (CERNLIB_QMVAOS OR CERNLIB_IBMRT OR CERNLIB_SOLARIS OR CERNLIB_LINUX OR CERNLIB_SGI)
  set(kernlib_kerngen_tcgens_CSRC ucopy2c.c)
#ORIGINAL #if defined(CERNLIB_2022)
if (CERNLIB_2022)
  list(APPEND kernlib_kerngen_tcgens_CSRC  ucopy2ci.c ucopy2cr.c ucopy2cd.c)
endif()
else()
  list(APPEND kernlib_kerngen_tcgens_FSRC  ucopy2.F)
endif()
#ORIGINAL #if defined(CERNLIB_QMVAOS)
if (CERNLIB_QMVAOS)
endif()
  list(TRANSFORM kernlib_kerngen_tcgens_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kerngen/tcgens/")
  list(TRANSFORM kernlib_kerngen_tcgens_CSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kerngen/tcgens/")
 
#kernlib/kerngen/unix/gfortgs/Imakefile
 
  set(kernlib_kerngen_unix_gfortgs_FSRC irndm.F qnext.F rdmin.F kernlibgetarg.F)
  set(kernlib_kerngen_unix_gfortgs_CSRC lshift.c ishftr.c)
  list(TRANSFORM kernlib_kerngen_unix_gfortgs_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kerngen/unix/gfortgs/")
  list(TRANSFORM kernlib_kerngen_unix_gfortgs_CSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kerngen/unix/gfortgs/")
 
#kernlib/kerngen/xvect/Imakefile
 
  set(kernlib_kerngen_xvect_FSRC xinb.F xinbf.F xinbs.F xincf.F xoutb.F xoutbf.F xoutbs.F xoutcf.F)
  list(TRANSFORM kernlib_kerngen_xvect_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kerngen/xvect/")
 
#kernlib/kernnum/c204fort/Imakefile
 
  set(kernlib_kernnum_c204fort_FSRC muller.F)
#ORIGINAL #if defined(CERNLIB_IBMRT)
if (CERNLIB_IBMRT)
  list(APPEND kernlib_kernnum_c204fort_FSRC cabs.F)
endif()
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
endif()
if (CERNLIB_HPUX)
endif()
  list(TRANSFORM kernlib_kernnum_c204fort_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernnum/c204fort/")
 
#kernlib/kernnum/c205fort/Imakefile
 
  set(kernlib_kernnum_c205fort_FSRC dzero.F rzero.F)
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
endif()
  list(TRANSFORM kernlib_kernnum_c205fort_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernnum/c205fort/")
 
#kernlib/kernnum/d106fort/Imakefile
 
  set(kernlib_kernnum_d106fort_FSRC d106xx.F gquad.F gset.F)
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
endif()
  list(TRANSFORM kernlib_kernnum_d106fort_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernnum/d106fort/")
 
#kernlib/kernnum/d509fort/Imakefile
 
  set(kernlib_kernnum_d509fort_FSRC d509hi.F minvar.F)
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
endif()
  list(TRANSFORM kernlib_kernnum_d509fort_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernnum/d509fort/")
 
#kernlib/kernnum/d703fort/Imakefile
 
  set(kernlib_kernnum_d703fort_FSRC rfft.F)
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
endif()
  list(TRANSFORM kernlib_kernnum_d703fort_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernnum/d703fort/")
 
#kernlib/kernnum/d704fort/Imakefile
 
  set(kernlib_kernnum_d704fort_FSRC cfft.F)
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
endif()
#ORIGINAL #if defined(CERNLIB_MACOSX)
if (CERNLIB_MACOSX)
endif()
  list(TRANSFORM kernlib_kernnum_d704fort_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernnum/d704fort/")
 
#kernlib/kernnum/e100fort/Imakefile
 
  set(kernlib_kernnum_e100fort_FSRC polint.F)
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
endif()
  list(TRANSFORM kernlib_kernnum_e100fort_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernnum/e100fort/")
 
#kernlib/kernnum/e104fort/Imakefile
 
  set(kernlib_kernnum_e104fort_FSRC fint.F)
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
endif()
  list(TRANSFORM kernlib_kernnum_e104fort_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernnum/e104fort/")
 
#kernlib/kernnum/e105fort/Imakefile
 
  set(kernlib_kernnum_e105fort_FSRC divdif.F)
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
endif()
  list(TRANSFORM kernlib_kernnum_e105fort_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernnum/e105fort/")
 
#kernlib/kernnum/e106fort/Imakefile
 
  set(kernlib_kernnum_e106fort_FSRC locatf.F locati.F)
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
endif()
  list(TRANSFORM kernlib_kernnum_e106fort_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernnum/e106fort/")
 
#kernlib/kernnum/e208fort/Imakefile
 
  set(kernlib_kernnum_e208fort_FSRC e208pr.F llsq.F lsq.F)
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
endif()
  list(TRANSFORM kernlib_kernnum_e208fort_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernnum/e208fort/")
 
#kernlib/kernnum/f002fort/Imakefile
 
  set(kernlib_kernnum_f002fort_FSRC cvadd.F cvcpy.F cvdiv.F cvmpa.F cvmpac.F cvmpy.F cvmpyc.F cvmul.F cvmula.F cvmuna.F cvran.F cvsca.F cvscl.F cvscs.F cvset.F cvsub.F cvsum.F cvxch.F dvadd.F dvcpy.F dvdiv.F
 dvmpa.F dvmpy.F dvmul.F dvmula.F dvmuna.F dvran.F dvsca.F dvscl.F dvscs.F dvset.F dvsub.F dvsum.F dvxch.F rvadd.F rvcpy.F rvdiv.F rvmpa.F rvmpy.F rvmul.F rvmula.F rvmuna.F rvran.F rvsca.F rvscl.F rvscs.F
 rvset.F rvsub.F rvsum.F rvxch.F)
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
endif()
#ORIGINAL #if defined(CERNLIB_MACOSX)
if (CERNLIB_MACOSX)
endif()
  list(TRANSFORM kernlib_kernnum_f002fort_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernnum/f002fort/")
 
#kernlib/kernnum/f003fort/Imakefile
 
  set(kernlib_kernnum_f003fort_FSRC ccmmpy.F ccumpy.F cmadd.F cmbil.F cmcpy.F cmmna.F cmmns.F cmmpa.F cmmps.F cmmpy.F cmmpyc.F cmran.F cmscl.F cmset.F cmsub.F cmutl.F crscl.F cumna.F cumns.F cumpa.F cumps.F
 cumpy.F cumpyc.F dmadd.F dmbil.F dmcpy.F dmmna.F dmmns.F dmmpa.F dmmps.F dmmpy.F dmran.F dmscl.F dmset.F dmsub.F dmutl.F drscl.F dumna.F dumns.F dumpa.F dumps.F dumpy.F rmadd.F rmbil.F rmcpy.F rmmna.F
 rmmns.F rmmpa.F rmmps.F rmmpy.F rmran.F rmscl.F rmset.F rmsub.F rmutl.F rrscl.F rumna.F rumns.F rumpa.F rumps.F rumpy.F)
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
endif()
#ORIGINAL #if defined(CERNLIB_MACOSX)
if (CERNLIB_MACOSX)
endif()
  list(TRANSFORM kernlib_kernnum_f003fort_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernnum/f003fort/")
 
#kernlib/kernnum/f004fort/Imakefile
 
  set(kernlib_kernnum_f004fort_FSRC cmmla.F cmmls.F cmmlt.F cmmltc.F cmnma.F cmnms.F dmmla.F dmmls.F dmmlt.F dmnma.F dmnms.F rmmla.F rmmls.F rmmlt.F rmnma.F rmnms.F)
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
endif()
#ORIGINAL #if defined(CERNLIB_MACOSX)
if (CERNLIB_MACOSX)
endif()
  list(TRANSFORM kernlib_kernnum_f004fort_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernnum/f004fort/")
 
#kernlib/kernnum/f010fort/Imakefile
 
  set(kernlib_kernnum_f010fort_FSRC ceqinv.F ceqn.F cinv.F deqinv.F deqn.F dinv.F reqinv.F reqn.F rinv.F f010pr.F)
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
endif()
#ORIGINAL #if defined(CERNLIB_MACOSX)
if (CERNLIB_MACOSX)
endif()
  list(TRANSFORM kernlib_kernnum_f010fort_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernnum/f010fort/")
 
#kernlib/kernnum/f011fort/Imakefile
 
  set(kernlib_kernnum_f011fort_FSRC cfact.F cfeqn.F cfinv.F dfact.F dfeqn.F dfinv.F rfact.F rfeqn.F rfinv.F tmprnt.F)
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
endif()
#ORIGINAL #if defined(CERNLIB_MACOSX)
if (CERNLIB_MACOSX)
endif()
  list(TRANSFORM kernlib_kernnum_f011fort_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernnum/f011fort/")
 
#kernlib/kernnum/f012fort/Imakefile
 
  set(kernlib_kernnum_f012fort_FSRC dseqn.F dsfact.F dsfeqn.F dsfinv.F dsinv.F rseqn.F rsfact.F rsfeqn.F rsfinv.F rsinv.F)
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
endif()
  list(TRANSFORM kernlib_kernnum_f012fort_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernnum/f012fort/")
 
#kernlib/kernnum/f406fort/Imakefile
 
  set(kernlib_kernnum_f406fort_FSRC dbeqn.F rbeqn.F)
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
endif()
  list(TRANSFORM kernlib_kernnum_f406fort_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernnum/f406fort/")
 
#kernlib/kernnum/g900fort/Imakefile
 
  set(kernlib_kernnum_g900fort_FSRC ranf.F ranget.F)
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
endif()
  list(TRANSFORM kernlib_kernnum_g900fort_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernnum/g900fort/")
 
#kernlib/kernnum/g901fort/Imakefile
 
  set(kernlib_kernnum_g901fort_FSRC ran2vs.F ran3vs.F vran2s.F vran3s.F)
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
endif()
  list(TRANSFORM kernlib_kernnum_g901fort_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernnum/g901fort/")
 
#kernlib/kernnum/n001fort/Imakefile
 
  set(kernlib_kernnum_n001fort_FSRC kerset.F)
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
endif()
  list(TRANSFORM kernlib_kernnum_n001fort_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/kernnum/n001fort/")
 
#kernlib/umon/umonftn/Imakefile
 
  set(kernlib_umon_umonftn_FSRC umcom.F umlog.F)
  list(TRANSFORM kernlib_umon_umonftn_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../kernlib/umon/umonftn/")
 
set(kernlib_esources )
if (CERNLIB_BUILD_STATIC)
add_library(kernlib_static STATIC ${kernlib_esources}
                             ${kernlib_kernbit_i303_FSRC} 
                             ${kernlib_kernbit_j530_FSRC} 
                             ${kernlib_kernbit_m231asm_SSRC} 
                             ${kernlib_kernbit_m233vax_SSRC} 
                             ${kernlib_kernbit_m429_FSRC} 
                             ${kernlib_kernbit_m429_SSRC} 
                             ${kernlib_kernbit_m433_FSRC} 
                             ${kernlib_kernbit_m433_CSRC} 
                             ${kernlib_kernbit_m437_FSRC} 
                             ${kernlib_kernbit_m437_SSRC} 
                             ${kernlib_kernbit_m439_FSRC} 
                             ${kernlib_kernbit_m442_FSRC} 
                             ${kernlib_kernbit_m443_FSRC} 
                             ${kernlib_kernbit_t000_FSRC} 
                             ${kernlib_kernbit_z009_FSRC} 
                             ${kernlib_kernbit_z265_FSRC} 
                             ${kernlib_kernbit_z268_CSRC} 
                             ${kernlib_kerngen_ccgen_FSRC} 
                             ${kernlib_kerngen_ccgen_CSRC} 
                             ${kernlib_kerngen_ccgencf_FSRC} 
                             ${kernlib_kerngen_ccgencf_CSRC} 
                             ${kernlib_kerngen_ccgenci_FSRC} 
                             ${kernlib_kerngen_ccgenci_CSRC} 
                             ${kernlib_kerngen_ccgenu_CSRC} 
                             ${kernlib_kerngen_tcgen_FSRC} 
                             ${kernlib_kerngen_tcgens_FSRC} 
                             ${kernlib_kerngen_tcgens_CSRC} 
                             ${kernlib_kerngen_unix_gfortgs_FSRC} 
                             ${kernlib_kerngen_unix_gfortgs_CSRC} 
                             ${kernlib_kerngen_xvect_FSRC} 
                             ${kernlib_kernnum_c204fort_FSRC} 
                             ${kernlib_kernnum_c205fort_FSRC} 
                             ${kernlib_kernnum_d106fort_FSRC} 
                             ${kernlib_kernnum_d509fort_FSRC} 
                             ${kernlib_kernnum_d703fort_FSRC} 
                             ${kernlib_kernnum_d704fort_FSRC} 
                             ${kernlib_kernnum_e100fort_FSRC} 
                             ${kernlib_kernnum_e104fort_FSRC} 
                             ${kernlib_kernnum_e105fort_FSRC} 
                             ${kernlib_kernnum_e106fort_FSRC} 
                             ${kernlib_kernnum_e208fort_FSRC} 
                             ${kernlib_kernnum_f002fort_FSRC} 
                             ${kernlib_kernnum_f003fort_FSRC} 
                             ${kernlib_kernnum_f004fort_FSRC} 
                             ${kernlib_kernnum_f010fort_FSRC} 
                             ${kernlib_kernnum_f011fort_FSRC} 
                             ${kernlib_kernnum_f012fort_FSRC} 
                             ${kernlib_kernnum_f406fort_FSRC} 
                             ${kernlib_kernnum_g900fort_FSRC} 
                             ${kernlib_kernnum_g901fort_FSRC} 
                             ${kernlib_kernnum_n001fort_FSRC} 
                             ${kernlib_umon_umonftn_FSRC} 
)
target_include_directories(kernlib_static PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(kernlib_static PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(kernlib_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/kernbit")
target_include_directories(kernlib_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/kerngen")
target_include_directories(kernlib_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/kerngen/kerngen")
target_include_directories(kernlib_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/kerngen/test")
target_include_directories(kernlib_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/kernnum")
target_include_directories(kernlib_static PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS kernlib_static DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(kernlib_static PROPERTIES POSITION_INDEPENDENT_CODE ${CERNLIB_POSITION_INDEPENDENT_CODE} OUTPUT_NAME kernlib)
install_symlink(libkernlib.a  ${CMAKE_INSTALL_LIBDIR}/libkernlib-${SHIFTSUFFIX}.a)
endif()
if (CERNLIB_BUILD_SHARED)
add_library(kernlib SHARED ${kernlib_esources}
                             ${kernlib_kernbit_i303_FSRC} 
                             ${kernlib_kernbit_j530_FSRC} 
                             ${kernlib_kernbit_m231asm_SSRC} 
                             ${kernlib_kernbit_m233vax_SSRC} 
                             ${kernlib_kernbit_m429_FSRC} 
                             ${kernlib_kernbit_m429_SSRC} 
                             ${kernlib_kernbit_m433_FSRC} 
                             ${kernlib_kernbit_m433_CSRC} 
                             ${kernlib_kernbit_m437_FSRC} 
                             ${kernlib_kernbit_m437_SSRC} 
                             ${kernlib_kernbit_m439_FSRC} 
                             ${kernlib_kernbit_m442_FSRC} 
                             ${kernlib_kernbit_m443_FSRC} 
                             ${kernlib_kernbit_t000_FSRC} 
                             ${kernlib_kernbit_z009_FSRC} 
                             ${kernlib_kernbit_z265_FSRC} 
                             ${kernlib_kernbit_z268_CSRC} 
                             ${kernlib_kerngen_ccgen_FSRC} 
                             ${kernlib_kerngen_ccgen_CSRC} 
                             ${kernlib_kerngen_ccgencf_FSRC} 
                             ${kernlib_kerngen_ccgencf_CSRC} 
                             ${kernlib_kerngen_ccgenci_FSRC} 
                             ${kernlib_kerngen_ccgenci_CSRC} 
                             ${kernlib_kerngen_ccgenu_CSRC} 
                             ${kernlib_kerngen_tcgen_FSRC} 
                             ${kernlib_kerngen_tcgens_FSRC} 
                             ${kernlib_kerngen_tcgens_CSRC} 
                             ${kernlib_kerngen_unix_gfortgs_FSRC} 
                             ${kernlib_kerngen_unix_gfortgs_CSRC} 
                             ${kernlib_kerngen_xvect_FSRC} 
                             ${kernlib_kernnum_c204fort_FSRC} 
                             ${kernlib_kernnum_c205fort_FSRC} 
                             ${kernlib_kernnum_d106fort_FSRC} 
                             ${kernlib_kernnum_d509fort_FSRC} 
                             ${kernlib_kernnum_d703fort_FSRC} 
                             ${kernlib_kernnum_d704fort_FSRC} 
                             ${kernlib_kernnum_e100fort_FSRC} 
                             ${kernlib_kernnum_e104fort_FSRC} 
                             ${kernlib_kernnum_e105fort_FSRC} 
                             ${kernlib_kernnum_e106fort_FSRC} 
                             ${kernlib_kernnum_e208fort_FSRC} 
                             ${kernlib_kernnum_f002fort_FSRC} 
                             ${kernlib_kernnum_f003fort_FSRC} 
                             ${kernlib_kernnum_f004fort_FSRC} 
                             ${kernlib_kernnum_f010fort_FSRC} 
                             ${kernlib_kernnum_f011fort_FSRC} 
                             ${kernlib_kernnum_f012fort_FSRC} 
                             ${kernlib_kernnum_f406fort_FSRC} 
                             ${kernlib_kernnum_g900fort_FSRC} 
                             ${kernlib_kernnum_g901fort_FSRC} 
                             ${kernlib_kernnum_n001fort_FSRC} 
                             ${kernlib_umon_umonftn_FSRC} 
)
target_include_directories(kernlib PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(kernlib PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(kernlib PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/kernbit")
target_include_directories(kernlib PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/kerngen")
target_include_directories(kernlib PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/kerngen/kerngen")
target_include_directories(kernlib PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/kerngen/test")
target_include_directories(kernlib PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/kernnum")
target_include_directories(kernlib PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS kernlib DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(kernlib        PROPERTIES POSITION_INDEPENDENT_CODE ON OUTPUT_NAME kernlib SOVERSION 1_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR})
install_symlink(libkernlib.so.1_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR} ${CMAKE_INSTALL_LIBDIR}/libkernlib.so.1_${COMPSUFFIX})
endif()
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/kernbit/kernbit DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}  COMPONENT devel  PATTERN "*makefile*" EXCLUDE  PATTERN "*\.c" EXCLUDE )
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/kerngen/kerngen DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}  COMPONENT devel  PATTERN "*makefile*" EXCLUDE  PATTERN "*\.c" EXCLUDE )
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/kernnum/kernnum DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}  COMPONENT devel  PATTERN "*makefile*" EXCLUDE  PATTERN "*\.c" EXCLUDE )

if(CERNLIB_ENABLE_TEST)
  ENABLE_TESTING()
  add_subdirectory(kerngen/test)
  add_subdirectory(kernnum/test)
  add_subdirectory(kernbit/test)
endif()

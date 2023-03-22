
########################################################################
#
#  Automatically or semiautomaticall generated, do not edit.
#
########################################################################
# The following input was used
# cspack/cz/Imakefile
# cspack/fz/Imakefile
# cspack/sysreq/Imakefile
# cspack/sz/Imakefile
# cspack/tcpaw/Imakefile
# cspack/xz/Imakefile
# epio/code/Imakefile
# epio/util/Imakefile
# fatmen/fatbody/Imakefile
# fatmen/fatuous/Imakefile
# fatmen/fatuser/Imakefile
# fatmen/fatutil/Imakefile
# fatmen/fmc/Imakefile
# fatmen/fmint/Imakefile
# fatmen/fmtms/Imakefile
# fatmen/fmutil/Imakefile
# fatmen/l3util/Imakefile
# ffread/sffread/Imakefile
# hbook/chbook/Imakefile
# hbook/code/Imakefile
# hbook/d/Imakefile
# hbook/fpclassc/Imakefile
# hbook/hmcstat/Imakefile
# hbook/hmerge/Imakefile
# hbook/hmmap/Imakefile
# hbook/hntup/Imakefile
# hbook/hquad/Imakefile
# hbook/hrz/Imakefile
# hbook/n/Imakefile
# hepdb/cdc/Imakefile
# hepdb/cdcdf/Imakefile
# hepdb/cddict/Imakefile
# hepdb/cdfzup/Imakefile
# hepdb/cdinit/Imakefile
# hepdb/cdmdir/Imakefile
# hepdb/cdofflin/Imakefile
# hepdb/cdpack/Imakefile
# hepdb/cdpurge/Imakefile
# hepdb/cdread/Imakefile
# hepdb/cdroot/Imakefile
# hepdb/cdstore/Imakefile
# hepdb/cdunpack/Imakefile
# hepdb/cdutil/Imakefile
# kapack/code/Imakefile
# kuip/code_kuip/Imakefile
# minuit/code/Imakefile
# zbook/code/Imakefile
# zbook/ybook/Imakefile
# zebra/dzebra/Imakefile
# zebra/fq/Imakefile
# zebra/jz91/Imakefile
# zebra/mq/Imakefile
# zebra/mqg/Imakefile
# zebra/mqs/Imakefile
# zebra/mqv/Imakefile
# zebra/qend/Imakefile
# zebra/qutil/Imakefile
# zebra/rz/Imakefile
# zebra/tq/Imakefile

########################################################################
set_package_flags(packlib)
#packlib/cspack/cz/Imakefile
 
  set(packlib_cspack_cz_FSRC czclos.F czdumm.F czgeta.F czgetc.F czopen.F czputa.F czputc.F czrand.F czrtim.F czstop.F czswap.F cztcp.F)
#ORIGINAL #if defined(CERNLIB_VAXVMS)
if (CERNLIB_VAXVMS)
  list(APPEND packlib_cspack_cz_FSRC  czgtlg.F)
endif()
  list(TRANSFORM packlib_cspack_cz_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/cspack/cz/")
 
#packlib/cspack/fz/Imakefile
 
  set(packlib_cspack_fz_FSRC fzclos.F fzopen.F fzrmio.F)
  list(TRANSFORM packlib_cspack_fz_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/cspack/fz/")
 
#packlib/cspack/sysreq/Imakefile
 

#Inserted by get_if_condition()->
if ( (CERNLIB_VAXVMS OR CERNLIB_UNIX)  AND  ( (NOT CERNLIB_SHIFT) AND ( NOT CERNLIB_WINNT) ) )

  set(packlib_cspack_sysreq_CSRC getacct.c getconfent.c log.c netreq.c serror.c socket.c sysreqf.c trace.c xdr.c)

else()
  set(packlib_cspack_sysreq_CSRC )
endif()
#Inserted by get_if_condition()<-

if (NOT CERNLIB_VAXVMS)
  list(APPEND packlib_cspack_sysreq_CSRC  sysreqc.c)
endif()
if (CERNLIB_UNIX)
# EXTRA_INCLUDES = -I. -I$(CVSCOSRC)$(CURRENT_DIR)
endif()
if (CERNLIB_SOLARIS)
endif()
if (CERNLIB_SGI)
endif()
if (CERNLIB_LINUX)
endif()
if (CERNLIB_VAXVMS)
# EXTRA_INCLUDES = -I[] DEFINES: = $(DEFINES) -DCOMPILE_NOPREFIX -DTGV CCOPTIONS: = $(CCOPTIONS) /stan\ = vaxc/pref\ = ansi
if (NOT CERNLIB_QMALPH)
# DEFINES: = $(DEFINES) -DDECC
endif()
endif()
#ORIGINAL #if defined(CERNLIB_HPUX) || defined(CERNLIB_LINUX)
if (CERNLIB_HPUX OR CERNLIB_LINUX)
endif()
  list(TRANSFORM packlib_cspack_sysreq_CSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/cspack/sysreq/")
 
#packlib/cspack/sz/Imakefile
 
  set(packlib_cspack_sz_FSRC setdef.F szcd.F szclos.F szinqr.F szls.F szmv.F szopen.F szpiaf.F szread.F szrewd.F szrite.F szrm.F szvers.F)
#ORIGINAL #if defined(CERNLIB_IBMRT) && defined(CERNLIB_PLODGE)
if (CERNLIB_IBMRT AND CERNLIB_PLODGE)
  list(APPEND packlib_cspack_sz_FSRC  chdir.F getcwd.F)
endif()
#ORIGINAL #if defined(CERNLIB_VAXVMS)
if (CERNLIB_VAXVMS)
  list(APPEND packlib_cspack_sz_FSRC  getdef.F)
endif()
  list(TRANSFORM packlib_cspack_sz_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/cspack/sz/")
 
#packlib/cspack/tcpaw/Imakefile
 
  set(packlib_cspack_tcpaw_CSRC tcpaw.c)
#ORIGINAL #if defined(CERNLIB_UCX)
if (CERNLIB_UCX)
  list(APPEND packlib_cspack_tcpaw_CSRC  getservbyname.c)
endif()
#ORIGINAL #if defined(CERNLIB_WINNT)
if (CERNLIB_WINNT)
# define CERNLIB_TCPSOCK
  list(APPEND packlib_cspack_tcpaw_CSRC  sleep.c)
endif()
#ORIGINAL #if defined(CERNLIB_IBMVM)
if (CERNLIB_IBMVM)
#ORIGINAL #if !defined(CERNLIB_TCPSOCK)
if (NOT CERNLIB_TCPSOCK)
  set(packlib_cspack_tcpaw_FSRC tcpawibm.F)
  set(packlib_cspack_tcpaw_SSRC readne.s)
else()
  list(APPEND packlib_cspack_tcpaw_CSRC  sleep.c)
endif()
endif()
#ORIGINAL #if defined(CERNLIB_IBM) && !defined(CERNLIB_TCPSOCK)
if (CERNLIB_IBM AND NOT CERNLIB_TCPSOCK)
  set(packlib_cspack_tcpaw_FSRC tcpawibm.F)
endif()
#ORIGINAL #if defined(CERNLIB_HPUX)
if (CERNLIB_HPUX)
endif()
#ORIGINAL #if defined(CERNLIB_SGI)
if (CERNLIB_SGI)
# CCOPTIONS+ = -cckr
endif()
#ORIGINAL #if defined(CERNLIB_SOLARIS)
if (CERNLIB_SOLARIS)
# CCOPTIONS+ = -Xs
endif()
if (CERNLIB_VAXVMS)
# EXTRA_INCLUDES = -I[] DEFINES: = $(DEFINES) -DCOMPILE_NOPREFIX -DTGV CCOPTIONS: = $(CCOPTIONS) /stan\ = vaxc/pref\ = ansi
if (NOT CERNLIB_QMALPH)
# DEFINES: = $(DEFINES) -DDECC
endif()
endif()
#ORIGINAL #if defined(CERNLIB_LINUX) && defined(__GNUC__)
if (CERNLIB_LINUX AND __GNUC__)
# CCOPTIONS+ = -trigraphs
endif()
  list(TRANSFORM packlib_cspack_tcpaw_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/cspack/tcpaw/")
  list(TRANSFORM packlib_cspack_tcpaw_CSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/cspack/tcpaw/")
  list(TRANSFORM packlib_cspack_tcpaw_SSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/cspack/tcpaw/")
 
#packlib/cspack/xz/Imakefile
 
  set(packlib_cspack_xz_FSRC xzcd.F xzclos.F xzconv.F xzctof.F xzftoc.F xzfzcp.F xzgeta.F xzgetb.F xzgetd.F xzgetf.F xzgetl.F xzgetp.F xzgetr.F xzgetx.F xzhrop.F xzinit.F xzinqr.F xzitoc.F xzlcd.F xzlls.F
 xzlmv.F xzlogl.F xzlrm.F xzls.F xzlsys.F xzmv.F xzopen.F xzputa.F xzputb.F xzputd.F xzputf.F xzputl.F xzputp.F xzputr.F xzputx.F xzpwd.F xzread.F xzrewd.F xzrfrf.F xzrite.F xzrm.F xzrsys.F xzrtof.F xzrzcp.F
 xzrzop.F xzsver.F xzvers.F xzwrtm.F)
#ORIGINAL #if defined(CERNLIB_VAXVMS)
if (CERNLIB_VAXVMS)
  list(APPEND packlib_cspack_xz_FSRC  xzfinf.F xzprot.F)
endif()
#ORIGINAL #if defined(CERNLIB_IBMMVS)
if (CERNLIB_IBMMVS)
  list(APPEND packlib_cspack_xz_FSRC  xzlcat.F xzmvsd.F xzpref.F)
endif()
#ORIGINAL #if defined(CERNLIB_IBM)
if (CERNLIB_IBM)
  set(packlib_cspack_xz_SSRC xzatoe.s xzetoa.s)
endif()
  list(TRANSFORM packlib_cspack_xz_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/cspack/xz/")
  list(TRANSFORM packlib_cspack_xz_SSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/cspack/xz/")
 
#packlib/epio/code/Imakefile
 
  set(packlib_epio_code_FSRC epaddh.F epblin.F epbout.F epclos.F epdacr.F epdefu.F epdrop.F epend.F epeof.F eperrh.F epfhdr.F epfrd.F epgeta.F epgetc.F epgetw.F ephead.F epinit.F epiot.F epoutl.F epouts.F
 epread.F eprwnd.F epseta.F epsetc.F epsetw.F epstat.F epunit.F epupdh.F epuref.F)
if (NOT CERNLIB_VAX)
  list(APPEND packlib_epio_code_FSRC  epopestf.F)
else()
  list(APPEND packlib_epio_code_FSRC  epopevax.F)
endif()
  list(TRANSFORM packlib_epio_code_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/epio/code/")
 
#packlib/epio/util/Imakefile
 
if (CERNLIB_UNIX)
#ORIGINAL #if defined(CERNLIB_DECS) || (defined(CERNLIB_LINUX) && !defined(CERNLIB_PPC)) || defined(CERNLIB_WINNT)
if (CERNLIB_DECS OR (CERNLIB_LINUX AND NOT CERNLIB_PPC) OR CERNLIB_WINNT)
 set(F_ARCHITECTURE blo16stv.F blo32wsv.F blo8stv.F btswpstv.F bun16stv.F bun32wsv.F bun8stv.F cfribmsv.F ctoibstv.F iwd16stv.F sfrascvx.F stoascvx.F w16mvstv.F)
else()
 set(F_ARCHITECTURE blo16stf.F blo32wsf.F blo8stf.F btswpstf.F bun16stf.F bun32wsf.F bun8stf.F cfribmsf.F ctoibstf.F iwd16stf.F sfrascap.F stoascap.F w16mvstf.F)
endif()
endif()
if (CERNLIB_VAX)
 set(F_ARCHITECTURE blo16wva.F blo32wva.F blo8wib.F bun16wib.F bun32wva.F bun8wib.F cfribmva.F ctoibmva.F iwd16vax.F sfrascvx.F stoascvx.F)
  set(packlib_epio_util_SSRC btswapvx.s epiovax2.s mtformat.s vaxibm.s w16movvx.s)
if (CERNLIB_QMALPH)
  list(APPEND packlib_epio_util_SSRC  epioaxp.s)
else()
  list(APPEND packlib_epio_util_SSRC  epiovax.s)
endif()
endif()
  set(packlib_epio_util_FSRC cfrascun.F ctoascun.F ${F_ARCHITECTURE}  )
  list(TRANSFORM packlib_epio_util_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/epio/util/")
  list(TRANSFORM packlib_epio_util_SSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/epio/util/")
 
#packlib/fatmen/fatbody/Imakefile
 
  set(packlib_fatmen_fatbody_FSRC fafill.F farini.F fatini.F fatmdi.F fmbook.F fmexst.F fmlift.F fmlogl.F fmrzin.F ftrend.F)
if (CERNLIB_SHIFT)
endif()
  list(TRANSFORM packlib_fatmen_fatbody_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/fatmen/fatbody/")
 
#packlib/fatmen/fatuous/Imakefile
 
  set(packlib_fatmen_fatuous_FSRC fmaddd.F fmaddt.F fmfend.F fmfile.F fmpeek.F fmpoke.F fmstrt.F)
  list(TRANSFORM packlib_fatmen_fatuous_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/fatmen/fatuous/")
 
#packlib/fatmen/fatuser/Imakefile
 
  set(packlib_fatmen_fatuser_FSRC fmusel.F fuscan.F)
  list(TRANSFORM packlib_fatmen_fatuser_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/fatmen/fatuser/")
 
#The original Imake file below included files:pilot.h
#Those were NOT processed.
#packlib/fatmen/fatutil/Imakefile
 
#include "pilot.h"
  set(packlib_fatmen_fatutil_FSRC facdir.F fadare.F faeras.F faexst.F faextr.F fafc.F fahunt.F fainqr.F fald.F falink.F faln.F fals.F famodu.F fantrc.F faopen.F faseac.F fasear.F faselp.F fastat.F fatare.F
 fatrek.F fazoom.F fmback.F fmchop.F fmcopq.F fmdate.F fmdays.F fmdump.F fmfzo.F fmhunt.F fmiset.F fmjuli.F fmkeys.F fmlcop.F fmldir.F fmlink.F fmlist.F fmloop.F fmnode.F fmpaff.F fmpstg.F fmpurg.F fmrank.F
 fmrkey.F fmscan.F fmsend.F fmsetc.F fmsetk.F fmsetl.F fmsetm.F fmsetu.F fmsetv.F fmsort.F fmstgq.F fmtree.F fmuver.F fmveri.F sortch.F)
#ORIGINAL #if defined(CERNLIB_UNIX)
if (CERNLIB_UNIX)
  list(APPEND packlib_fatmen_fatutil_FSRC  fafndf.F)
endif()
#ORIGINAL #if defined(CERNLIB_VAXVMS)
if (CERNLIB_VAXVMS)
  list(APPEND packlib_fatmen_fatutil_FSRC  fmcfio.F)
endif()
#ORIGINAL #if defined(CERNLIB_SHIFT)
if (CERNLIB_SHIFT)
  list(APPEND packlib_fatmen_fatutil_FSRC  fmxyio.F)
else()
  list(APPEND packlib_fatmen_fatutil_FSRC  fmxyio_dum.F xyopen.F)
endif()
#ORIGINAL #if defined(CERNLIB_cspack)
if (CERNLIB_cspack)
  list(APPEND packlib_fatmen_fatutil_FSRC  fmxzio.F)
endif()
#ORIGINAL #if defined(CERNLIB_IBMVM)
if (CERNLIB_IBMVM)
  list(APPEND packlib_fatmen_fatutil_FSRC  fmvmio.F)
endif()
if (CERNLIB_HPUX)
endif()
  list(TRANSFORM packlib_fatmen_fatutil_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/fatmen/fatutil/")
 
#packlib/fatmen/fmc/Imakefile
 
  set(packlib_fatmen_fmc_CSRC faexit.c fmactc.c fmhstc.c fmjob.c fmuser.c)
  list(TRANSFORM packlib_fatmen_fmc_CSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/fatmen/fmc/")
 
#The original Imake file below included files:pilot.h
#Those were NOT processed.
#packlib/fatmen/fmint/Imakefile
 
#include "pilot.h"
  set(packlib_fatmen_fmint_FSRC fmclos.F fmcomp.F fmcopy.F fmcp.F fmdcb.F fmddir.F fmdisk.F fmfilc.F fmfill.F fmfils.F fmfind.F fmfnms.F fmfzcp.F fmgbyk.F fmgdsn.F fmget.F fmgeta.F fmgetc.F fmgeti.F fmgetk.F
 fmgetl.F fmgetv.F fminit.F fmkdir.F fmlfil.F fmln.F fmls.F fmmake.F fmmod.F fmmodu.F fmmv.F fmopen.F fmpuse.F fmput.F fmputc.F fmputi.F fmputv.F fmrcop.F fmrepl.F fmrm.F fmrmdr.F fmrmln.F fmsear.F fmselb.F
 fmselk.F fmselm.F fmsho2.F fmshow.F fmsmcf.F fmspac.F fmtape.F fmtouc.F fmuniq.F fmupdt.F fmupky.F fmuprt.F fmvers.F)
#ORIGINAL #if defined(CERNLIB_CZ)
if (CERNLIB_CZ)
  list(APPEND packlib_fatmen_fmint_FSRC  fmrin.F)
endif()
#ORIGINAL #if defined(CERNLIB_FPACK)
if (CERNLIB_FPACK)
  list(APPEND packlib_fatmen_fmint_FSRC  fmfpak.F)
endif()
if (CERNLIB_SHIFT)
endif()
  list(TRANSFORM packlib_fatmen_fmint_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/fatmen/fmint/")
 
#packlib/fatmen/fmtms/Imakefile
 
  set(packlib_fatmen_fmtms_FSRC fmallo.F fmamed.F fmedia.F fmgetp.F fmgtms.F fmgvid.F fmgvol.F fmlock.F fmpool.F fmpref.F fmprot.F fmqmed.F fmqtms.F fmqvol.F fmsreq.F fmtags.F fmuall.F fmulok.F fmutms.F
 fmuvol.F fmvinf.F fmxvid.F)
if (CERNLIB_HPUX)
endif()
if (CERNLIB_SHIFT)
endif()
  list(TRANSFORM packlib_fatmen_fmtms_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/fatmen/fmtms/")
 
#The original Imake file below included files:pilot.h
#Those were NOT processed.
#packlib/fatmen/fmutil/Imakefile
 
#include "pilot.h"
  set(packlib_fatmen_fmutil_FSRC fabnet.F fafilb.F fafile.F fm0tob.F fmacct.F fmacl.F fmacnt.F fmatch.F fmatob.F fmatoe.F fmbtoa.F fmclass.F fmdd2l.F fmddnm.F fmdtrn.F fmend.F fmetoa.F fmexpo.F fmfixf.F
 fmflun.F fmfnm.F fmfnme.F fmglun.F fmitoc.F fmjdat.F fmjour.F fml2dd.F fmlcod.F fmlocc.F fmloco.F fmlton.F fmmedt.F fmmss.F fmnick.F fmntol.F fmnwrd.F fmodat.F fmoptc.F fmpkey.F fmpktm.F fmpkvx.F fmplog.F
 fmpurl.F fmqfat.F fmrand.F fmrslv.F fmrtim.F fmshok.F fmstop.F fmtdpk.F fmtime.F fmtovm.F fmuptm.F fmupvx.F fmurl.F fmword.F)
#ORIGINAL #if defined(CERNLIB_IBMVM)
if (CERNLIB_IBMVM)
  list(APPEND packlib_fatmen_fmutil_FSRC  fmonit.F)
else()
  list(APPEND packlib_fatmen_fmutil_FSRC  fmhost.F)
endif()
#ORIGINAL #if defined(CERNLIB_UNIX)
if (CERNLIB_UNIX)
  list(APPEND packlib_fatmen_fmutil_FSRC  fmassn.F fmrsln.F)
else()
  list(APPEND packlib_fatmen_fmutil_FSRC  fmjob.F fmuser.F)
endif()
#ORIGINAL #if defined(CERNLIB_SHIFT)
if (CERNLIB_SHIFT)
  list(APPEND packlib_fatmen_fmutil_FSRC  fmfget.F)
endif()
#ORIGINAL #if ( defined(CERNLIB_UNIX) || defined(CERNLIB_VAXVMS) ) && (!defined(CERNLIB_NOCIO))
if ( CERNLIB_UNIX OR CERNLIB_VAXVMS  AND (NOT CERNLIB_NOCIO))
  list(APPEND packlib_fatmen_fmutil_FSRC  fmcfgl.F)
endif()
#ORIGINAL #if defined(CERNLIB_FPACK) || defined(CERNLIB_CSPACK)
if (CERNLIB_FPACK OR CERNLIB_CSPACK)
  list(APPEND packlib_fatmen_fmutil_FSRC  fmntrc.F)
endif()
#ORIGINAL #if defined(CERNLIB_CSPACK)
if (CERNLIB_CSPACK)
  list(APPEND packlib_fatmen_fmutil_FSRC  fmnamf.F)
endif()
  list(TRANSFORM packlib_fatmen_fmutil_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/fatmen/fmutil/")
 
#packlib/fatmen/l3util/Imakefile
 
  set(packlib_fatmen_l3util_FSRC dbpktm.F dbpkts.F dbuptm.F dbupts.F)
  list(TRANSFORM packlib_fatmen_l3util_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/fatmen/l3util/")
 
#packlib/ffread/sffread/Imakefile
 
  set(packlib_ffread_sffread_FSRC ffcard.F fffind.F ffget.F ffgo.F ffinit.F ffkey.F ffread.F ffrset.F ffset.F ffskip.F ffupca.F ffuser.F ffuset.F)
  list(TRANSFORM packlib_ffread_sffread_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/ffread/sffread/")
 
#packlib/hbook/chbook/Imakefile
 
  set(packlib_hbook_chbook_CSRC halloc.c hbvers.c hbpqry.c)
if (CERNLIB_UNIX)
#ORIGINAL #if defined(CERNLIB_APOLLO) || defined(CERNLIB_CONVEX) || defined(CERNLIB_WINNT)
if (CERNLIB_APOLLO OR CERNLIB_CONVEX OR CERNLIB_WINNT)
  list(APPEND packlib_hbook_chbook_CSRC hmmap.c)
else()
  list(APPEND packlib_hbook_chbook_CSRC hshm.c)
endif()
endif()
#ORIGINAL #if defined(CERNLIB_HPUX) || defined(CERNLIB_IBMRT)
if (CERNLIB_HPUX OR CERNLIB_IBMRT)
endif()
#ORIGINAL #if defined(CERNLIB_LINUX)
if (CERNLIB_LINUX)
endif()
#ORIGINAL #if defined(CERNLIB_LINUX) && !defined(CERNLIB_QMLXIA64)
if (CERNLIB_LINUX AND NOT CERNLIB_QMLXIA64)
endif()
#ORIGINAL #if defined(CERNLIB_QMLXIA64)
if (CERNLIB_QMLXIA64)
#ORIGINAL #if defined(CERNLIB_GFORTRAN)
if (CERNLIB_GFORTRAN)
else()
endif()
endif()
  list(TRANSFORM packlib_hbook_chbook_CSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/hbook/chbook/")
 
#The original Imake file below included files:pilot.h
#Those were NOT processed.
#packlib/hbook/code/Imakefile
 
  set(packlib_hbook_code_FSRC h1evli.F h2page.F harith.F harray.F hauto.F hbandx.F hbandy.F hbar2.F hbarx.F hbary.F hbasft.F hbcd.F hbcdf.F hbcdi.F hbfun1.F hbfun2.F hbigbi.F hbin.F hbinsz.F hblack.F hbook1.F
 hbook2.F hbookb.F hbookn.F hbooknc.F hbpro.F hbprof.F hbprox.F hbproy.F hbslix.F hbsliy.F hbstat.F hbtit.F hbuff.F hbug.F hcdir.F hchnam.F hcmom.F hcompa.F hconvol.F hcopy.F hcopym.F hcopyn.F hcopyr.F
 hcopyt.F hcopyu.F hcorrl.F hcovw.F hcx.F hcxy.F hdcofl.F hddir.F hdelet.F hderi1.F hderi2.F hderin.F hderiv.F hdexpo.F hdipkl.F hdummy.F hdump.F heleft.F hermes.F herror.F hexda1.F hexdat.F hexist.F hf1.F
 hf1aut.F hf1e.F hf1n.F hf2.F hfact.F hfc1.F hfc2.F hfcn.F hfcnh.F hfcnv.F hfcnv1.F hfcx.F hfcxy.F hfetc1.F hfetch.F hff1.F hff2.F hfidp.F hfill.F hfilpf.F hfilpr.F hfinam.F hfind.F hfinop.F hfit.F hfit1.F
 hfitex.F hfitf.F hfitga.F hfith.F hfith1.F hfithc.F hfithn.F hfitl.F hfitn.F hfitpo.F hfits.F hfitv.F hfn.F hfnov.F hforma.F hfpak1.F hfpbug.F hframe.F hfumil.F hfunc.F hgaus.F hgdire.F hgetff.F hgetfl.F
 hgfit.F hgive.F hgiven.F hgn.F hgnf.F hgnpar.F hgstat.F hhipar.F hhxye.F hi.F hictoi.F hid1.F hid2.F hidall.F hidopt.F hidpos.F hie.F hif.F hij.F hije.F hijxy.F hindex.F hinprx.F hinteg.F hipak1.F histdo.F
 histgo.F hix.F hkf1.F hkf2.F hkff1.F hkff2.F hkffi1.F hkfi1.F hkfil2.F hkfilpf.F hkind.F hknul1.F hknuli.F hlabel.F hlabeq.F hlabnb.F hlattr.F hlccmp.F hldir.F hldir1.F hldir2.F hldirt.F hlgnxt.F hlhcmp.F
 hlimit.F hllsq.F hlnext.F hlocat.F hlogar.F hloop.F hlpos.F hlshft.F hlsort.F hlsq.F hlswap.F hmachi.F hmax.F hmaxim.F hmconv.F hmdir.F hmedia.F hmin.F hminim.F hminui.F hminut.F hmonit.F hmufit.F hnoent.F
 hnorma.F hobsol.F hoper1.F hoper1a.F hopera.F houtpu.F hp1dim.F hp1rot.F hpaff.F hpagsz.F hpak.F hpakad.F hpake.F hpakes.F hparam.F hparmn.F hpath.F hpchan.F hpchar.F hpcont.F hpdir.F hphist.F hphs.F
 hphst.F hpkr32.F hpolyn.F hponce.F hpr1h.F hpr1v.F hpr2.F hprcha.F hprcon.F hprerr.F hprfun.F hprhis.F hprint.F hprlow.F hprntu.F hprof2.F hproj1.F hproj2.F hprot.F hprst.F hprsta.F hpsca.F hpscat.F hpstat.F
 hpta.F hptab.F hptit.F hrdir.F hread.F hrebin.F hrename.F hrep1.F hreset.F hrez0.F hrndm.F hrndm1.F hrndm2.F hrngpf.F hrotat.F hrval.F hscale.F hselbf.F hseqnr.F hsetbf.F hsetpr.F hsgz.F hsifla.F hsmoof.F
 hspace.F hspfun.F hspli1.F hspli2.F hsquez.F hstaf.F hstar.F hstati.F hstelf.F hsum.F hsupim.F hsupin.F hsupis.F htable.F htfunc.F htitle.F hunpak.F hunpke.F huoptc.F hupkrd.F hwork.F hwritf.F hx.F hxe.F
 hxi.F hxnorm.F hxy.F hxye.F hxyij.F hinq.F)
#ORIGINAL #if defined(CERNLIB_VAXVMS)
if (CERNLIB_VAXVMS)
else()
endif()
#include "pilot.h"
if (CERNLIB_MACMPW)
  list(APPEND packlib_hbook_code_FSRC h0mpw.F)
endif()
#ORIGINAL #if defined(CERNLIB_CZ)
if (CERNLIB_CZ)
  list(APPEND packlib_hbook_code_FSRC  hlogpf.F hinpf.F houtpf.F hoptpf.F)
endif()
  list(TRANSFORM packlib_hbook_code_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/hbook/code/")
 
#The original Imake file below included files:pilot.h
#Those were NOT processed.
#packlib/hbook/d/Imakefile
 
#include "pilot.h"
  set(packlib_hbook_d_FSRC rgmlt64.F)
#ORIGINAL #if defined(CERNLIB_DOUBLE)
if (CERNLIB_DOUBLE)
  list(APPEND packlib_hbook_d_FSRC  rgmlt.F)
else()
  list(APPEND packlib_hbook_d_FSRC  rgmlt128.F)
endif()
if (CERNLIB_HPUX)
endif()
#ORIGINAL #if defined(CERNLIB_SGI)
if (CERNLIB_SGI)
endif()
  list(TRANSFORM packlib_hbook_d_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/hbook/d/")
 
#packlib/hbook/fpclassc/Imakefile
 
  set(packlib_hbook_fpclassc_CSRC ifp.c ifpdcl.c ifpscl.c)
  list(TRANSFORM packlib_hbook_fpclassc_CSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/hbook/fpclassc/")
 
#packlib/hbook/hmcstat/Imakefile
 
  set(packlib_hbook_hmcstat_FSRC hadjust.F hfcnmin.F hmcini.F hmclnl.F hmclno.F hmcmll.F)
  list(TRANSFORM packlib_hbook_hmcstat_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/hbook/hmcstat/")
 
#packlib/hbook/hmerge/Imakefile
 
  set(packlib_hbook_hmerge_FSRC hmerge.F hmerge1.F hmerge2.F hmerge3.F)
  list(TRANSFORM packlib_hbook_hmerge_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/hbook/hmerge/")
 
#packlib/hbook/hmmap/Imakefile
 
  set(packlib_hbook_hmmap_FSRC hcreatem.F hlimap.F hlnxtm.F hlnxtm1.F hmapm.F hplism.F hplism1.F hrdirm.F hresetm.F hresetm1.F hrez0m.F hrzinm.F)
  list(TRANSFORM packlib_hbook_hmmap_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/hbook/hmmap/")
 
#packlib/hbook/hntup/Imakefile
 
  set(packlib_hbook_hntup_FSRC hballoc.F hbnam.F hbnamc.F hbname.F hbnt.F hbset.F hcleft.F hcompr.F hcpoff.F hfnt.F hfnt1.F hfnt2.F hfntb.F hgnt.F hgnt1.F hgnt2.F hgntb.F hgntbf.F hgntf.F hgntv.F hgtdir.F
 hicton.F hitoc.F hnbent.F hnbfwr.F hnbmin.F hnbptr.F hnbuf.F hnbufd.F hnbuff.F hnbufr.F hndesc.F hnform.F hnhdwr.F hnmadr.F hnmptr.F hnmset.F hnpart.F hnsize.F hntdel.F hntdim.F hntdup.F hntget.F hntgeti.F
 hntmp.F hntmpd.F hntmpf.F hntnam.F hntnew.F hntrd.F hntrng.F hntrset.F hntsav.F hnttok.F hntvar.F hntvdef.F hntwrt.F hparnt.F hprnt.F hprnts.F hreco1.F hreco2.F hrecov.F hrzfra.F hrztoa.F huwfun.F hvxist.F
 hwbnam.F hwdecl.F hwpdcl.F)
  list(TRANSFORM packlib_hbook_hntup_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/hbook/hntup/")
 
#packlib/hbook/hquad/Imakefile
 
  set(packlib_hbook_hquad_FSRC hqbin.F hqd.F hqdd.F hqddj.F hqddjn.F hqdj.F hqdjn.F hqdn.F hqend.F hqf.F hqfer.F hqfnl.F hqfpl.F hqgetf.F hqgiv.F hqin.F hqinit.F hqlif1.F hqlif2.F hqlif3.F hqlsqc.F hqlsqu.F
 hqmxa1.F hqmxa2.F hqmxa3.F hqmxb1.F hqmxb2.F hqmxb3.F hqmxc1.F hqmxc2.F hqmxc3.F hqmxli.F hqout.F hqpois.F hqputf.F hqsig.F hqsig1.F hqsig2.F hqsig3.F hqsiga.F hqsolv.F hqssv.F hquad.F hqwave.F hqwrif.F
 hqxi.F hqmnu.F)
  list(TRANSFORM packlib_hbook_hquad_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/hbook/hquad/")
 
#packlib/hbook/hrz/Imakefile
 
  set(packlib_hbook_hrz_FSRC hrendc.F hrendf.F hrenid.F hrfile.F hrget.F hrin.F hrmake.F hrmdir.F hropen.F hrout.F hrput.F hrsort.F hrzcd.F hrzin.F hrzkey.F hrzld.F hrzout.F hscr.F hreadonedir.F)
  list(TRANSFORM packlib_hbook_hrz_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/hbook/hrz/")
 
#packlib/hbook/n/Imakefile
 
  set(packlib_hbook_n_FSRC mtlprt.F mtlset.F)
#ORIGINAL #if defined(CERNLIB_SGI)
if (CERNLIB_SGI)
endif()
  list(TRANSFORM packlib_hbook_n_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/hbook/n/")
 
#packlib/hepdb/cdc/Imakefile
 
  set(packlib_hepdb_cdc_CSRC cdhstc.c cduser.c)
  list(TRANSFORM packlib_hepdb_cdc_CSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/hepdb/cdc/")
 
#packlib/hepdb/cdcdf/Imakefile
 
  set(packlib_hepdb_cdcdf_CDFSRC cdcdf.cdf)
  list(TRANSFORM packlib_hepdb_cdcdf_CDFSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/hepdb/cdcdf/")
 
#packlib/hepdb/cddict/Imakefile
 
  set(packlib_hepdb_cddict_FSRC cdalia.F cddinf.F cdeali.F cdehlp.F cdenam.F cdgali.F cdgnam.F cdgpid.F cdhelp.F cdmdic.F cdname.F cdrali.F cdrdic.F cdrhlp.F cdrnam.F cdsnam.F cdudic.F)
#ORIGINAL #if !defined(CERNLIB_P3CHILD)
if (NOT CERNLIB_P3CHILD)
  list(APPEND packlib_hepdb_cddict_FSRC  cdcdic.F)
endif()
  list(TRANSFORM packlib_hepdb_cddict_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/hepdb/cddict/")
 
#packlib/hepdb/cdfzup/Imakefile
 
  set(packlib_hepdb_cdfzup_FSRC cdextr.F cdfzop.F cdfzwr.F cdrtfz.F)
#ORIGINAL #if !defined(CERNLIB_P3CHILD)
if (NOT CERNLIB_P3CHILD)
  list(APPEND packlib_hepdb_cdfzup_FSRC  cdfzup.F cdildf.F cdildu.F)
endif()
  list(TRANSFORM packlib_hepdb_cdfzup_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/hepdb/cdfzup/")
 
#packlib/hepdb/cdinit/Imakefile
 
  set(packlib_hepdb_cdinit_FSRC cdexpd.F cdfrst.F cdinit.F cdjour.F cdnew.F cdopen.F cdpaw.F cdshar.F cdudiv.F cdupdt.F)
  list(TRANSFORM packlib_hepdb_cdinit_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/hepdb/cdinit/")
 
#packlib/hepdb/cdmdir/Imakefile
 
  set(packlib_hepdb_cdmdir_FSRC cdddir.F cdfpat.F cdkeep.F cdmdir.F cdmkdi.F cdpart.F cdsdir.F)
  list(TRANSFORM packlib_hepdb_cdmdir_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/hepdb/cdmdir/")
 
#packlib/hepdb/cdofflin/Imakefile
 
  set(packlib_hepdb_cdofflin_FSRC cdfopn.F cdfsnd.F cdfzlo.F cdsave.F cdstsv.F)
  list(TRANSFORM packlib_hepdb_cdofflin_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/hepdb/cdofflin/")
 
#packlib/hepdb/cdpack/Imakefile
 
  set(packlib_hepdb_cdpack_FSRC cdcmpr.F cdcmpz.F cdcomp.F cdflin.F cdfrus.F cdfzin.F cdifch.F cdifrc.F cdinin.F cdizin.F cdpack.F)
#ORIGINAL #if !defined(CERNLIB_P3CHILD)
if (NOT CERNLIB_P3CHILD)
  list(APPEND packlib_hepdb_cdpack_FSRC  cdlinc.F)
endif()
  list(TRANSFORM packlib_hepdb_cdpack_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/hepdb/cdpack/")
 
#packlib/hepdb/cdpurge/Imakefile
 
  set(packlib_hepdb_cdpurge_FSRC cdpurg.F cdpurk.F cdpurp.F cdspur.F)
#ORIGINAL #if !defined(CERNLIB_P3CHILD)
if (NOT CERNLIB_P3CHILD)
  list(APPEND packlib_hepdb_cdpurge_FSRC  cddelk.F)
endif()
  list(TRANSFORM packlib_hepdb_cdpurge_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/hepdb/cdpurge/")
 
#packlib/hepdb/cdread/Imakefile
 
  set(packlib_hepdb_cdread_FSRC cdafri.F cdbkks.F cdbook.F cdcfri.F cdchck.F cdchky.F cdfree.F cdget.F cdgetdb.F cdkeyb.F cdkmld.F cdkmul.F cdksel.F cdkxin.F cdkydb.F cdkyse.F cdnode.F cdprdt.F cdprin.F
 cdpsel.F cdseky.F cduse.F cdusedb.F cdusem.F)
#ORIGINAL #if defined(CERNLIB_P3CHILD)
if (CERNLIB_P3CHILD)
  list(APPEND packlib_hepdb_cdread_FSRC  cdstp3.F cdusp3.F)
endif()
  list(TRANSFORM packlib_hepdb_cdread_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/hepdb/cdread/")
 
#packlib/hepdb/cdroot/Imakefile
 
  set(packlib_hepdb_cdroot_FSRC cdbank.F cdkeyr.F cdkeyt.F cdkytg.F cdlddi.F cdldic.F cdldup.F cdopts.F cdpars.F cdpath.F cdprky.F cdprnt.F cdropn.F cdrzin.F cdsblc.F cdsopn.F cdtopn.F cduvtx.F cdvers.F
 cdwtop.F icdtyp.F)
  list(TRANSFORM packlib_hepdb_cdroot_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/hepdb/cdroot/")
 
#packlib/hepdb/cdstore/Imakefile
 
  set(packlib_hepdb_cdstore_FSRC cdatoi.F cdctoi.F cddont.F cdentb.F cdhunt.F cdkout.F cdpval.F cdrenk.F cdrepl.F cdstom.F cdstor.F)
#ORIGINAL #if !defined(CERNLIB_P3CHILD)
if (NOT CERNLIB_P3CHILD)
  list(APPEND packlib_hepdb_cdstore_FSRC  cdenfz.F)
endif()
  list(TRANSFORM packlib_hepdb_cdstore_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/hepdb/cdstore/")
 
#packlib/hepdb/cdunpack/Imakefile
 
  set(packlib_hepdb_cdunpack_FSRC cdchfi.F cditoc.F cdtous.F cducmp.F cducmz.F cduncp.F cdupck.F cdupfz.F cdupiz.F)
#ORIGINAL #if !defined(CERNLIB_P3CHILD)
if (NOT CERNLIB_P3CHILD)
  list(APPEND packlib_hepdb_cdunpack_FSRC  cdlind.F)
endif()
  list(TRANSFORM packlib_hepdb_cdunpack_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/hepdb/cdunpack/")
 
#packlib/hepdb/cdutil/Imakefile
 
  set(packlib_hepdb_cdutil_FSRC cdacl.F cdaclc.F cdalarm.F cdbfor.F cdcdir.F cdchar.F cdcoun.F cddtrn.F cdend.F cdfixf.F cdflun.F cdglun.F cdhost.F cdinct.F cdinfo.F cdinic.F cdlast.F cdldir.F cdlist.F
 cdlkey.F cdlls.F cdlmod.F cdlogl.F cdls.F cdlupp.F cdlupu.F cdmovf.F cdmtch.F cdnwrd.F cdobjx.F cdopnf.F cdoptc.F cdpaff.F cdpktm.F cdpkts.F cdpref.F cdrand.F cdscan.F cdselp.F cdsetu.F cdshow.F cdstat.F
 cdsumy.F cdtext.F cdtrek.F cduniq.F cduptm.F cdupts.F cdvalid.F cdvect.F cdword.F cdzoo1.F)
#ORIGINAL #if defined(CERNLIB_UNIX)
if (CERNLIB_UNIX)
  list(APPEND packlib_hepdb_cdutil_FSRC  cdgetp.F)
else()
  list(APPEND packlib_hepdb_cdutil_FSRC  cduser.F)
endif()
#ORIGINAL #if defined(CERNLIB_VAXVMS)
if (CERNLIB_VAXVMS)
  list(APPEND packlib_hepdb_cdutil_FSRC  cdgtlg.F)
endif()
#ORIGINAL #if defined(CERNLIB_OLD)
if (CERNLIB_OLD)
  list(APPEND packlib_hepdb_cdutil_FSRC  cdsave.F)
endif()
#ORIGINAL #if defined(CERNLIB_HPUX)
if (CERNLIB_HPUX)
endif()
  list(TRANSFORM packlib_hepdb_cdutil_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/hepdb/cdutil/")
 
#packlib/kapack/code/Imakefile
 
  set(packlib_kapack_code_FSRC ka1to2.F kaadd.F kaaddm.F kacopy.F kadel.F kadelm.F kafree.F kaget.F kagetm.F kahold.F kalen.F kalist.F kaloc.F kamake.F kamsg.F kaoptn.F kapre.F kaprem.F kaprik.F kaput.F
 kaputm.F karlse.F kaseq.F kaseqm.F kastop.F kat.F kaxad1.F kaxad2.F kaxad3.F kaxadd.F kaxage.F kaxcmp.F kaxcon.F kaxdel.F kaxdl1.F kaxdl2.F kaxdlv.F kaxe2i.F kaxed.F kaxend.F kaxfbk.F kaxgbk.F kaxget.F
 kaxglv.F kaxgxa.F kaxgxd.F kaxi2e.F kaxini.F kaxinr.F kaxins.F kaxjid.F kaxls1.F kaxmaj.F kaxmsg.F kaxnam.F kaxolk.F kaxopn.F kaxput.F kaxrd.F kaxrlk.F kaxshl.F kaxshr.F kaxtlk.F kaxwrd.F kaxwrt.F kaz1a2.F
 kaz1b2.F)
#ORIGINAL #if !defined(CERNLIB_IBM)
if (NOT CERNLIB_IBM)
  list(APPEND packlib_kapack_code_FSRC  kaxrcl.F)
else()
  list(APPEND packlib_kapack_code_FSRC  kaxrclib.F)
endif()
#ORIGINAL #if defined(CERNLIB_HPUX)
if (CERNLIB_HPUX)
endif()
  list(TRANSFORM packlib_kapack_code_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/kapack/code/")
 
#packlib/kuip/code_kuip/Imakefile
 
  set(packlib_kuip_code_kuip_CSRC getline.c kalias.c kbrow.c kedit.c kexec.c khash.c kicon.c kienbr.c kipiaf.c kkern.c kmacro.c kmath.c kmenu.c kmisc.c kmodel.c kmterm.c kuinit.c kutrue.c kuvers.c kuwhat.c
 kvect.c kmutil.c)
if (CERNLIB_WINNT)
  list(APPEND packlib_kuip_code_kuip_CSRC  kmutil0.c)
endif()
  set(packlib_kuip_code_kuip_FSRC kiargc.F kibres.F kiclos.F kictoi.F kicton.F kidate.F kierrf.F kiinit.F kilexp.F kilogn.F kilun.F kindex.F kindot.F kintoc.F kisndv.F kivind.F kudpar.F kugetv.F kuinqf.F
 kulogn.F kuopen.F kuread.F kuvcre.F kuvdel.F kuvec.F kuvect.F kuwrit.F kxcopv.F kxcrv1.F kxcrv2.F kxdelv.F kxlisv.F kxreav.F kxunit.F kxvope.F kxwriv.F kxdsig.F)
  set(packlib_kuip_code_kuip_CDFSRC kuipcdf.cdf)
#ORIGINAL #if defined(CERNLIB_QMVAOS)
if (CERNLIB_QMVAOS)
endif()
#ORIGINAL #if defined(CERNLIB_IBMMVS)
if (CERNLIB_IBMMVS)
  list(APPEND packlib_kuip_code_kuip_FSRC  kdialo.F kprefi.F putgeti.F kmvsed.F kmvspg.F kmvssh.F SCRS_S = kprefb.s put.s putget.s userid.s)
endif()
#ORIGINAL #if defined(CERNLIB_IBMVM) || defined(CERNLIB_IBMMVS)
if (CERNLIB_IBMVM OR CERNLIB_IBMMVS)
  list(APPEND packlib_kuip_code_kuip_FSRC  k77calls.F kuserid.F)
endif()
#ORIGINAL #if defined(CERNLIB_NEWLIB)
if (CERNLIB_NEWLIB)
  list(APPEND packlib_kuip_code_kuip_FSRC  itoft.F)
endif()
  list(TRANSFORM packlib_kuip_code_kuip_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/kuip/code_kuip/")
  list(TRANSFORM packlib_kuip_code_kuip_CSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/kuip/code_kuip/")
  list(TRANSFORM packlib_kuip_code_kuip_CDFSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/kuip/code_kuip/")
 
#packlib/minuit/code/Imakefile
 
  set(packlib_minuit_code_FSRC minuit.F mnamin.F mnbins.F mncalf.F mncler.F mncntr.F mncomd.F mncont.F mncrck.F mncros.F mncuve.F mnderi.F mndxdi.F mneig.F mnemat.F mnerrs.F mneval.F mnexcm.F mnexin.F
 mnfixp.F mnfree.F mngrad.F mnhelp.F mnhes1.F mnhess.F mnimpr.F mninex.F mninit.F mninpu.F mnintr.F mnlims.F mnline.F mnmatu.F mnmigr.F mnmnos.F mnmnot.F mnparm.F mnpars.F mnpfit.F mnpint.F mnplot.F mnpout.F
 mnprin.F mnpsdf.F mnrazz.F mnread.F mnrn15.F mnrset.F mnsave.F mnscan.F mnseek.F mnset.F mnseti.F mnsimp.F mnstat.F mnstin.F mntiny.F mnunpt.F mnvers.F mnvert.F mnwarn.F mnwerr.F stand.F)
  list(TRANSFORM packlib_minuit_code_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/minuit/code/")
 
#packlib/zbook/code/Imakefile
 
  set(packlib_zbook_code_FSRC zagain.F zbform.F zbook.F zbook0.F zbookn.F zbooks.F zbookt.F zbug.F zclose.F zdebug.F zdelet.F zdgarb.F zdisk.F zdrop.F zecfor.F zepcat.F zepcls.F zepdef.F zepend.F zepin.F
 zepkey.F zeploc.F zepnxt.F zepout.F zerror.F zfconv.F zfetch.F zfribm.F zgarb.F zgform.F zgtfor.F zhinit.F zhlim.F zidok.F zinit.F ziodo.F zleft.F zloc.F zlocal.F zlook.F zmigra.F zmove.F zname.F znamsr.F
 zopen.F zpbank.F zprint.F zptfor.F zptree.F zpush.F zpush0.F zpushs.F zread.F zrecal.F zreset.F zscr.F zsearc.F zshifd.F zshifp.F zshift.F zstore.F zswap.F ztoibm.F ztrap.F zuploc.F zuser.F zwork.F zwrite.F)
if (CERNLIB_UNIX)
  set(packlib_zbook_code_CSRC zjump.c)
else()
  list(APPEND packlib_zbook_code_FSRC  zjumpft.F)
endif()
  list(TRANSFORM packlib_zbook_code_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/zbook/code/")
  list(TRANSFORM packlib_zbook_code_CSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/zbook/code/")
 
#packlib/zbook/ybook/Imakefile
 
  set(packlib_zbook_ybook_FSRC ybook.F ybook0.F yfetch.F yinit.F ymove.F ypush.F ywork.F)
  list(TRANSFORM packlib_zbook_ybook_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/zbook/ybook/")
 
#packlib/zebra/dzebra/Imakefile
 
  set(packlib_zebra_dzebra_FSRC dzare1.F dzarea.F dzbkdv.F dzbkhd.F dzbkup.F dzbkxr.F dzchbk.F dzchst.F dzchv1.F dzchvc.F dzdata.F dzform.F dzforp.F dziopd.F dzioph.F dziopr.F dzmap.F dzopt.F dzshow.F
 dzshpr.F dzsnap.F dzstdv.F dzstla.F dzstor.F dzsurv.F dzswap.F dztext.F dztyp.F dzveri.F dzzero.F lzloc.F nzleft.F zdvcop.F zpage.F)
if (CERNLIB_HPUX)
endif()
  list(TRANSFORM packlib_zebra_dzebra_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/zebra/dzebra/")
 
#packlib/zebra/fq/Imakefile
 
  set(packlib_zebra_fq_FSRC fzcffn.F fzcffx.F fzcopy.F fzendi.F fzendo.F fzficr.F fzfile.F fzhook.F fziacn.F fzialn.F fziasc.F fzichh.F fzidat.F fzidia.F fzidum.F fziffn.F fziffx.F fzilin.F fzimtb.F fzin.F
 fzinfo.F fzinxt.F fzipha.F fziphd.F fziphm.F fziphr.F fziprl.F fzirec.F fzirel.F fzitrn.F fzlimi.F fzloc.F fzlogl.F fzmach.F fzmemo.F fzoaln.F fzoapk.F fzoasc.F fzodat.F fzoffn.F fzoffx.F fzon1.F fzon2.F
 fzon3.F fzon4.F fzon5.F fzon6.F fzophr.F fzorec.F fzotab.F fzotrn.F fzotxt.F fzout.F fzrun.F fzudat.F)
#ORIGINAL #if !defined(CERNLIB_UNIX) || defined(CERNLIB_DECS) || defined(CERNLIB_CERNLIB_QMVAOS) || defined(CERNLIB_WINNT OR (CERNLIB_LINUX AND (NOT CERNLIB_PPC)))
if (NOT CERNLIB_UNIX OR CERNLIB_DECS OR CERNLIB_CERNLIB_QMVAOS OR CERNLIB_WINNT OR (CERNLIB_LINUX AND (NOT CERNLIB_PPC)))
  list(APPEND packlib_zebra_fq_FSRC  fzicv.F fzitrx.F fzocv.F fzotrx.F)
endif()
if (CERNLIB_HPUX)
endif()
  list(TRANSFORM packlib_zebra_fq_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/zebra/fq/")
 
#packlib/zebra/jz91/Imakefile
 
  set(packlib_zebra_jz91_FSRC jzend.F jzin.F jzinit.F jzlift.F jzlog.F jzonly.F jzout.F jzroot.F jzsetf.F jztell.F jztrac.F jzwind.F jzzero.F)
  list(TRANSFORM packlib_zebra_jz91_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/zebra/jz91/")
 
#packlib/zebra/mq/Imakefile
 
  set(packlib_zebra_mq_FSRC mzattm.F mzbook.F mzcopy.F mzdiv.F mzdred.F mzdrop.F mzebra.F mzend.F mzflag.F mzinco.F mzinqd.F mzinqs.F mzlift.F mzlink.F mzlint.F mzlogl.F mzmaps.F mzmark.F mzneed.F mzpaw.F
 mzpudx.F mzpush.F mzrepl.F mzstor.F mzvers.F mzvolm.F mzwork.F)
  list(TRANSFORM packlib_zebra_mq_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/zebra/mq/")
 
#packlib/zebra/mqg/Imakefile
 
  set(packlib_zebra_mqg_FSRC mzfgap.F mzgar1.F mzgarb.F mzgsta.F mzmove.F mzrelb.F mzrell.F mzrelx.F mztabc.F mztabf.F mztabh.F mztabm.F mztabr.F mztabs.F mztabx.F mzwipe.F)
  list(TRANSFORM packlib_zebra_mqg_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/zebra/mqg/")
 
#packlib/zebra/mqs/Imakefile
 
  set(packlib_zebra_mqs_FSRC lzfid.F lzfidh.F lzhead.F lzscan.F mzchln.F mzchls.F mzchnb.F mzdvac.F mzfdiv.F mzform.F mziobk.F mziocf.F mzioch.F mziocr.F mziotc.F mzixco.F mzneig.F mzresv.F mzsdiv.F mzxref.F
 mzxrpr.F mzxrup.F)
  list(TRANSFORM packlib_zebra_mqs_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/zebra/mqs/")
 
#packlib/zebra/mqv/Imakefile
 
  set(packlib_zebra_mqv_FSRC zvauto.F zvautu.F zvautx.F zvauty.F zvdo1.F zvdo2.F zvdobk.F zvdola.F zverif.F zvfpri.F)
  list(TRANSFORM packlib_zebra_mqv_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/zebra/mqv/")
 
#packlib/zebra/qend/Imakefile
 
  set(packlib_zebra_qend_FSRC zabend.F zend.F zfatal.F zfatam.F zphase.F zpostm.F ztell.F ztelus.F)
if (CERNLIB_HPUX)
endif()
  list(TRANSFORM packlib_zebra_qend_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/zebra/qend/")
 
#packlib/zebra/qutil/Imakefile
 
  set(packlib_zebra_qutil_FSRC izbcd.F izbcdt.F izbcdv.F izchav.F izhnum.F lzbyt.F lzfind.F lzfval.F lzlast.F lzlong.F nzbank.F nzfind.F nzlong.F zhtoi.F zitoh.F zkrak.F zkrakn.F znumid.F zpress.F zshunt.F
 zsort.F zsorth.F zsorti.F zsorv.F zsorvh.F zsorvi.F ztopsy.F)
  list(TRANSFORM packlib_zebra_qutil_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/zebra/qutil/")
 
#packlib/zebra/rz/Imakefile
 
  set(packlib_zebra_rz_FSRC rzallo.F rzcdir.F rzchcy.F rzclos.F rzcop1.F rzcopy.F rzdate.F rzdelk.F rzdelt.F rzdlok.F rzend.F rzexpd.F rzfdir.F rzfile.F rzfree.F rzfrf1.F rzfrfz.F rzhfra.F rzhook.F rzhtoa.F
 rzin.F rzink.F rzinpa.F rzins.F rziodo.F rziphd.F rzkeep.F rzkeyd.F rzkeys.F rzldi1.F rzldir.F rzlinc.F rzlind.F rzllok.F rzlock.F rzlogl.F rzmake.F rzmdir.F rzmods.F rzndir.F rzobkn.F rzopen.F rzophd.F
 rzout.F rzpaff.F rzpass.F rzpath.F rzprnk.F rzpurf.F rzpurg.F rzquot.F rzrdir.F rzread.F rzrenk.F rzrtop.F rzsame.F rzsave.F rzscan.F rzstat.F rzstrip.F rzstrir.F rztof1.F rztofz.F rzused.F rzvcyc.F rzver1.F
 rzver2.F rzveri.F rzvers.F rzvin.F rzvout.F rzwrt.F)
  list(TRANSFORM packlib_zebra_rz_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/zebra/rz/")
 
#packlib/zebra/tq/Imakefile
 
  set(packlib_zebra_tq_FSRC tzacw.F tzfind.F tzfree.F tzinit.F tzinq.F tzshun.F tzuser.F tzvers.F)
  list(TRANSFORM packlib_zebra_tq_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../packlib/zebra/tq/")
 
set(packlib_esources )
cdf_compile(${CMAKE_CURRENT_SOURCE_DIR}/kuip/code_kuip/kuipcdf.cdf ${CMAKE_CURRENT_BINARY_DIR}/kuipcdf.cdf.c)
list(APPEND packlib_esources ${CMAKE_CURRENT_BINARY_DIR}/kuipcdf.cdf.c)
if (CERNLIB_BUILD_STATIC)
add_library(packlib_static STATIC ${packlib_esources}
                             ${packlib_cspack_cz_FSRC} 
                             ${packlib_cspack_fz_FSRC} 
                             ${packlib_cspack_sysreq_CSRC} 
                             ${packlib_cspack_sz_FSRC} 
                             ${packlib_cspack_tcpaw_FSRC} 
                             ${packlib_cspack_tcpaw_CSRC} 
                             ${packlib_cspack_tcpaw_SSRC} 
                             ${packlib_cspack_xz_FSRC} 
                             ${packlib_cspack_xz_SSRC} 
                             ${packlib_epio_code_FSRC} 
                             ${packlib_epio_util_FSRC} 
                             ${packlib_epio_util_SSRC} 
                             ${packlib_fatmen_fatbody_FSRC} 
                             ${packlib_fatmen_fatuous_FSRC} 
                             ${packlib_fatmen_fatuser_FSRC} 
                             ${packlib_fatmen_fatutil_FSRC} 
                             ${packlib_fatmen_fmc_CSRC} 
                             ${packlib_fatmen_fmint_FSRC} 
                             ${packlib_fatmen_fmtms_FSRC} 
                             ${packlib_fatmen_fmutil_FSRC} 
                             ${packlib_fatmen_l3util_FSRC} 
                             ${packlib_ffread_sffread_FSRC} 
                             ${packlib_hbook_chbook_CSRC} 
                             ${packlib_hbook_code_FSRC} 
                             ${packlib_hbook_d_FSRC} 
                             ${packlib_hbook_fpclassc_CSRC} 
                             ${packlib_hbook_hmcstat_FSRC} 
                             ${packlib_hbook_hmerge_FSRC} 
                             ${packlib_hbook_hmmap_FSRC} 
                             ${packlib_hbook_hntup_FSRC} 
                             ${packlib_hbook_hquad_FSRC} 
                             ${packlib_hbook_hrz_FSRC} 
                             ${packlib_hbook_n_FSRC} 
                             ${packlib_hepdb_cdc_CSRC} 
                             ${packlib_hepdb_cdcdf_CDFSRC} 
                             ${packlib_hepdb_cddict_FSRC} 
                             ${packlib_hepdb_cdfzup_FSRC} 
                             ${packlib_hepdb_cdinit_FSRC} 
                             ${packlib_hepdb_cdmdir_FSRC} 
                             ${packlib_hepdb_cdofflin_FSRC} 
                             ${packlib_hepdb_cdpack_FSRC} 
                             ${packlib_hepdb_cdpurge_FSRC} 
                             ${packlib_hepdb_cdread_FSRC} 
                             ${packlib_hepdb_cdroot_FSRC} 
                             ${packlib_hepdb_cdstore_FSRC} 
                             ${packlib_hepdb_cdunpack_FSRC} 
                             ${packlib_hepdb_cdutil_FSRC} 
                             ${packlib_kapack_code_FSRC} 
                             ${packlib_kuip_code_kuip_FSRC} 
                             ${packlib_kuip_code_kuip_CSRC} 
                             ${packlib_kuip_code_kuip_CDFSRC} 
                             ${packlib_minuit_code_FSRC} 
                             ${packlib_zbook_code_FSRC} 
                             ${packlib_zbook_code_CSRC} 
                             ${packlib_zbook_ybook_FSRC} 
                             ${packlib_zebra_dzebra_FSRC} 
                             ${packlib_zebra_fq_FSRC} 
                             ${packlib_zebra_jz91_FSRC} 
                             ${packlib_zebra_mq_FSRC} 
                             ${packlib_zebra_mqg_FSRC} 
                             ${packlib_zebra_mqs_FSRC} 
                             ${packlib_zebra_mqv_FSRC} 
                             ${packlib_zebra_qend_FSRC} 
                             ${packlib_zebra_qutil_FSRC} 
                             ${packlib_zebra_rz_FSRC} 
                             ${packlib_zebra_tq_FSRC} 
)
target_include_directories(packlib_static PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(packlib_static PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(packlib_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../mathlib/gen")
target_include_directories(packlib_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/cspack")
target_include_directories(packlib_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/cspack/sysreq")
target_include_directories(packlib_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/epio")
target_include_directories(packlib_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/fatmen")
target_include_directories(packlib_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/ffread")
target_include_directories(packlib_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/hepdb")
target_include_directories(packlib_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/kapack")
target_include_directories(packlib_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/kuip")
target_include_directories(packlib_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/minuit")
target_include_directories(packlib_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/zbook")
target_include_directories(packlib_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/zebra")
target_include_directories(packlib_static PRIVATE ${FREETYPE_INCLUDE_DIRS})
target_link_libraries(packlib_static PRIVATE ${crypto})
install(TARGETS packlib_static DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(packlib_static PROPERTIES POSITION_INDEPENDENT_CODE ${CERNLIB_POSITION_INDEPENDENT_CODE} OUTPUT_NAME packlib)
install_symlink(libpacklib.a  ${CMAKE_INSTALL_LIBDIR}/libpacklib-${SHIFTSUFFIX}.a)
endif()
if (CERNLIB_BUILD_SHARED)
add_library(packlib SHARED ${packlib_esources}
                             ${packlib_cspack_cz_FSRC} 
                             ${packlib_cspack_fz_FSRC} 
                             ${packlib_cspack_sysreq_CSRC} 
                             ${packlib_cspack_sz_FSRC} 
                             ${packlib_cspack_tcpaw_FSRC} 
                             ${packlib_cspack_tcpaw_CSRC} 
                             ${packlib_cspack_tcpaw_SSRC} 
                             ${packlib_cspack_xz_FSRC} 
                             ${packlib_cspack_xz_SSRC} 
                             ${packlib_epio_code_FSRC} 
                             ${packlib_epio_util_FSRC} 
                             ${packlib_epio_util_SSRC} 
                             ${packlib_fatmen_fatbody_FSRC} 
                             ${packlib_fatmen_fatuous_FSRC} 
                             ${packlib_fatmen_fatuser_FSRC} 
                             ${packlib_fatmen_fatutil_FSRC} 
                             ${packlib_fatmen_fmc_CSRC} 
                             ${packlib_fatmen_fmint_FSRC} 
                             ${packlib_fatmen_fmtms_FSRC} 
                             ${packlib_fatmen_fmutil_FSRC} 
                             ${packlib_fatmen_l3util_FSRC} 
                             ${packlib_ffread_sffread_FSRC} 
                             ${packlib_hbook_chbook_CSRC} 
                             ${packlib_hbook_code_FSRC} 
                             ${packlib_hbook_d_FSRC} 
                             ${packlib_hbook_fpclassc_CSRC} 
                             ${packlib_hbook_hmcstat_FSRC} 
                             ${packlib_hbook_hmerge_FSRC} 
                             ${packlib_hbook_hmmap_FSRC} 
                             ${packlib_hbook_hntup_FSRC} 
                             ${packlib_hbook_hquad_FSRC} 
                             ${packlib_hbook_hrz_FSRC} 
                             ${packlib_hbook_n_FSRC} 
                             ${packlib_hepdb_cdc_CSRC} 
                             ${packlib_hepdb_cdcdf_CDFSRC} 
                             ${packlib_hepdb_cddict_FSRC} 
                             ${packlib_hepdb_cdfzup_FSRC} 
                             ${packlib_hepdb_cdinit_FSRC} 
                             ${packlib_hepdb_cdmdir_FSRC} 
                             ${packlib_hepdb_cdofflin_FSRC} 
                             ${packlib_hepdb_cdpack_FSRC} 
                             ${packlib_hepdb_cdpurge_FSRC} 
                             ${packlib_hepdb_cdread_FSRC} 
                             ${packlib_hepdb_cdroot_FSRC} 
                             ${packlib_hepdb_cdstore_FSRC} 
                             ${packlib_hepdb_cdunpack_FSRC} 
                             ${packlib_hepdb_cdutil_FSRC} 
                             ${packlib_kapack_code_FSRC} 
                             ${packlib_kuip_code_kuip_FSRC} 
                             ${packlib_kuip_code_kuip_CSRC} 
                             ${packlib_kuip_code_kuip_CDFSRC} 
                             ${packlib_minuit_code_FSRC} 
                             ${packlib_zbook_code_FSRC} 
                             ${packlib_zbook_code_CSRC} 
                             ${packlib_zbook_ybook_FSRC} 
                             ${packlib_zebra_dzebra_FSRC} 
                             ${packlib_zebra_fq_FSRC} 
                             ${packlib_zebra_jz91_FSRC} 
                             ${packlib_zebra_mq_FSRC} 
                             ${packlib_zebra_mqg_FSRC} 
                             ${packlib_zebra_mqs_FSRC} 
                             ${packlib_zebra_mqv_FSRC} 
                             ${packlib_zebra_qend_FSRC} 
                             ${packlib_zebra_qutil_FSRC} 
                             ${packlib_zebra_rz_FSRC} 
                             ${packlib_zebra_tq_FSRC} 
)
target_include_directories(packlib PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(packlib PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(packlib PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../mathlib/gen")
target_include_directories(packlib PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/cspack")
target_include_directories(packlib PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/cspack/sysreq")
target_include_directories(packlib PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/epio")
target_include_directories(packlib PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/fatmen")
target_include_directories(packlib PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/ffread")
target_include_directories(packlib PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/hepdb")
target_include_directories(packlib PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/kapack")
target_include_directories(packlib PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/kuip")
target_include_directories(packlib PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/minuit")
target_include_directories(packlib PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/zbook")
target_include_directories(packlib PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/zebra")
target_include_directories(packlib PRIVATE ${FREETYPE_INCLUDE_DIRS})
target_link_libraries(packlib PRIVATE ${crypto})
install(TARGETS packlib DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(packlib        PROPERTIES POSITION_INDEPENDENT_CODE ON OUTPUT_NAME packlib SOVERSION 1_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR})
install_symlink(libpacklib.so.1_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR} ${CMAKE_INSTALL_LIBDIR}/libpacklib.so.1_${COMPSUFFIX})
endif()
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/cspack/cspack DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}  COMPONENT devel  PATTERN "*makefile*" EXCLUDE  PATTERN "*\.c" EXCLUDE )
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/epio/epio DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}  COMPONENT devel  PATTERN "*makefile*" EXCLUDE  PATTERN "*\.c" EXCLUDE )
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/fatmen/fatmen DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}  COMPONENT devel  PATTERN "*makefile*" EXCLUDE  PATTERN "*\.c" EXCLUDE )
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/ffread/ffread DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}  COMPONENT devel  PATTERN "*makefile*" EXCLUDE  PATTERN "*\.c" EXCLUDE )
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/hepdb/hepdb DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}  COMPONENT devel  PATTERN "*makefile*" EXCLUDE  PATTERN "*\.c" EXCLUDE )
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/kapack/kapack DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}  COMPONENT devel  PATTERN "*makefile*" EXCLUDE  PATTERN "*\.c" EXCLUDE )
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/kuip/kuip DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}  COMPONENT devel  PATTERN "*makefile*" EXCLUDE  PATTERN "*\.c" EXCLUDE )
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/minuit/minuit DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}  COMPONENT devel  PATTERN "*makefile*" EXCLUDE  PATTERN "*\.c" EXCLUDE )
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/zbook/zbook DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}  COMPONENT devel  PATTERN "*makefile*" EXCLUDE  PATTERN "*\.c" EXCLUDE )
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/zebra/zebra DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}  COMPONENT devel  PATTERN "*makefile*" EXCLUDE  PATTERN "*\.c" EXCLUDE )

set(FF "f2cFortran")
if (CERNLIB_QMLXIA64) 
if (CERNLIB_GFORTRAN)
set(FF "gFortran")
else()
set(FF "f2cFortran")
endif()
endif()
if (CMAKE_C_COMPILER_ID STREQUAL "Intel")
set(SR _DEFAULT_SOURCE)
else()
set(SR _SVID_SOURCE)
endif()
foreach(x IN LISTS packlib_hbook_chbook_CSRC)
   set_source_files_properties(${x} PROPERTIES COMPILE_DEFINITIONS "${SR};${FF}")
endforeach()
if (CERNLIB_LINUX)
foreach(x IN LISTS packlib_cspack_sysreq_CSRC)
   set_source_files_properties(${x} PROPERTIES COMPILE_DEFINITIONS "LINUX")
endforeach()
endif()
if(CERNLIB_ENABLE_TEST)
  ENABLE_TESTING()
  #STRANGE! add_subdirectory(hbook/tests)
  add_subdirectory(ffread/test)
  add_subdirectory(kapack/test)
  add_subdirectory(zbook/test)
  add_subdirectory(zebra/test)
  add_subdirectory(epio/tests)
  add_subdirectory(minuit/examples)
  add_subdirectory(kuip/examples)
endif()
     

########################################################################
#
#  Automatically or semiautomaticall generated, do not edit.
#
########################################################################
# The following input was used
# comis/code/Imakefile
# comis/comisftn/Imakefile
# comis/comismar/Imakefile
# comis/deccc/Imakefile
# comis/dynam/Imakefile
# paw/cdf/Imakefile
# paw/code/Imakefile
# paw/cpaw/Imakefile
# paw/mlpfit/Imakefile
# paw/ntuple/Imakefile
# sigma/src/Imakefile

########################################################################
set_package_flags(pawlib)
#The original Imake file below included files:pilot.h
#Those were NOT processed.
#pawlib/comis/code/Imakefile
 
#include "pilot.h"
  set(pawlib_comis_code_FSRC alphch.F anumch.F cgcont.F cs1200.F cs1600.F cs2036.F csacom.F csadcb.F csadcl.F csaddb.F csaddr.F csadecb.F csalphch.F csanumch.F csbuse.F cscall.F cscalx.F cscath.F csccal.F
 csccax.F cscfun.F cschcd.F cschid.F cscli.F csclos.F csclrb.F cscomx.F cscpar.F cscrsl.F csctli.F cscxnu.F csdcal.F csdcax.F csdclr.F csdeds.F csdefn.F csdepa.F csdfun.F csdigch.F csdio.F csdirh.F csdpow.F
 csdpro.F csdtab.F csdtli.F csdvln.F csedit.F csetcva.F csexec.F csexgb.F csexpr.F csextx.F csfile.F csfilx.F csflch.F csfmtc.F csfmtp.F csfrcbl.F csgetl.F csgetn.F csgscl.F csgtid.F csgtidb.F csgtidg.F
 csgtidl.F csgtidp.F cshlopt.F cshndl.F csical.F csicax.F csicns.F csierr.F csifun.F csilet.F csimed.F csimpl.F csinccl.F csinc1.F csincl.F csinfh.F csinfn.F csinit.F csint1.F csinta.F csintx.F csiocv.F
 csiodv.F csioed.F csioiv.F csiord.F csiori.F csiorv.F csiowi.F csiowr.F csioxv.F csipar.F csippd.F csitgb.F csitgi.F csitgp.F csitli.F csitll.F csjcax.F csjtjp.F cskcal.F cskide.F cskidn.F cskinp.F cskinq.F
 cskioa.F cskiov.F csknch.F cskpar.F cskrdw.F csktyp.F cskuvi.F cslab1.F cslbcl.F cslcal.F csldli.F csleqs.F cslexm.F cslfre.F cslib.F cslibr.F cslimp.F cslink.F cslistc.F cslistd.F cslistx.F csllib.F
 cslog.F cslpar.F csltab.F csltgb.F csltgi.F csltgp.F csltli.F csltll.F cslunf.F csmap.F csmark.F csmbit.F csmhel.F csnidn.F csnifn.F csnlex.F csnotb.F csnpar.F csnumb.F csofil.F csolog.F csomap.F csoutb.F
 csparsfn.F cspaus.F cspcll.F cspdat.F cspdir1.F cspdls.F cspecb.F cspmd0.F cspmd1.F cspmd2.F cspmd3.F cspmd4.F cspmd5.F cspmd6.F cspmd7.F cspmd8.F cspmd9.F cspmfs.F csptbl.F csptcl.F csptfs.F csptli.F
 csputl.F csr1fn.F csr2fn.F csr3fn.F csrblk.F csrcal.F csrcax.F csrd.F csrepv.F csrfun.F csrmcl.F csrmcll.F csrmsl.F csrnext.F csrpar.F csrspt.F csrtgb.F csrtgi.F csrtgp.F csrtli.F csrtll.F cssedt.F cssems.F
 cssetl.F cssgnu.F csshld.F csshmu.F csskue.F csslab.F cssout.F csspar.F cssubr.F cssvpt.F cstadv.F cstarr.F csterr.F cstext.F cstfrf.F cstinf.F cstlgb.F cstlog.F cstpar.F cstran.F cstrer.F cstypar.F cstype.F
 csubad.F csunam.F csundf.F csxpar.F mcline.F mcsident.F)
  list(APPEND pawlib_comis_code_FSRC  hkfill.F hkf1q.F)
#ORIGINAL #if defined(CERNLIB_PAW)
if (CERNLIB_PAW)
  list(APPEND pawlib_comis_code_FSRC  cspawi.F cskuix.F cktoiv.F cspawv.F csmkvd.F csf77.F cshext.F cshfast.F cssinpaw.F cspivec.F cspiwrvl.F)
else()
  list(APPEND pawlib_comis_code_FSRC  cssinp.F)
endif()
#ORIGINAL #if defined(CERNLIB_SHL)
if (CERNLIB_SHL)
  list(APPEND pawlib_comis_code_FSRC  cscrexec.F)
endif()
#ORIGINAL #if defined(CERNLIB_QMLXIA64)
if (CERNLIB_QMLXIA64)
  list(APPEND pawlib_comis_code_FSRC  csrtgpl.F csitgpl.F)
endif()
#ORIGINAL #if defined(CERNLIB_OLD)
if (CERNLIB_OLD)
  list(APPEND pawlib_comis_code_FSRC  cspdir.F csrmbk.F)
endif()
#ORIGINAL #if defined(CERNLIB_IBM)
if (CERNLIB_IBM)
  list(APPEND pawlib_comis_code_FSRC  csintz.F)
endif()
#ORIGINAL #if defined(CERNLIB_CSDEBUG)
if (CERNLIB_CSDEBUG)
  list(APPEND pawlib_comis_code_FSRC  cspcod.F)
endif()
#ORIGINAL #if defined(CERNLIB_HPUX)
if (CERNLIB_HPUX)
endif()
#ORIGINAL #if defined(CERNLIB_SGI) || defined(CERNLIB_SUN)
if (CERNLIB_SGI OR CERNLIB_SUN)
endif()
#ORIGINAL #if defined(CERNLIB_SGI)
if (CERNLIB_SGI)
endif()
#ORIGINAL #if defined(CERNLIB_QMVAOS)
if (CERNLIB_QMVAOS)
endif()
#ORIGINAL #if defined(CERNLIB_VAXVMS)
if (CERNLIB_VAXVMS)
endif()
#ORIGINAL #if defined(CERNLIB_QFAPOGEE)
if (CERNLIB_QFAPOGEE)
endif()
#ORIGINAL #if defined(CERNLIB_SOLARIS)
if (CERNLIB_SOLARIS)
endif()
  list(TRANSFORM pawlib_comis_code_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../pawlib/comis/code/")
 
#The original Imake file below included files:pilot.h
#Those were NOT processed.
#pawlib/comis/comisftn/Imakefile
 
  set(pawlib_comis_comisftn_FSRC casetw.F ccopya.F copyaj.F crword.F cschar.F cscom.F cscomc.F csext.F csicha.F mcsges.F mdext.F miword.F mjscha.F mkchar.F mlcmp8.F mlempt.F mlette.F)
#include "pilot.h"
#ORIGINAL #if defined(CERNLIB_APOLLO)
if (CERNLIB_APOLLO)
  list(APPEND pawlib_comis_comisftn_FSRC  csd01f.F csd02f.F csd03f.F csd04f.F csd05f.F csd06f.F csd07f.F csd08f.F csd09f.F csd10f.F csd11f.F csd12f.F csd13f.F csd14f.F csd15f.F csi01f.F csi02f.F csi03f.F csi04f.F csi05f.F csi06f.F csi07f.F csi08f.F csi09f.F csi10f.F csi11f.F csi12f.F csi13f.F csi14f.F csi15f.F csr01f.F csr02f.F csr03f.F csr04f.F csr05f.F csr06f.F csr07f.F csr08f.F csr09f.F csr10f.F csr11f.F csr12f.F csr13f.F csr14f.F csr15f.F mjchara.F mjsubra.F mjworda.F)
endif()
#ORIGINAL #if defined(CERNLIB_APOLLO) || defined(CERNLIB_VAX)
if (CERNLIB_APOLLO OR CERNLIB_VAX)
  list(APPEND pawlib_comis_comisftn_FSRC  cscald.F cscali.F cscalr.F)
endif()
#ORIGINAL #if defined(CERNLIB_UNIX) && (!defined(CERNLIB_WINNT))
if (CERNLIB_UNIX AND NOT CERNLIB_WINNT)
  list(APPEND pawlib_comis_comisftn_FSRC  mjchard.F mjsubrd.F)
endif()
#ORIGINAL #if defined(CERNLIB_UNIX) || defined(CERNLIB_WINNT)
if (CERNLIB_UNIX OR CERNLIB_WINNT)
  list(APPEND pawlib_comis_comisftn_FSRC  mjworda.F)
endif()
#ORIGINAL #if defined(CERNLIB_VAX)
if (CERNLIB_VAX)
  list(APPEND pawlib_comis_comisftn_FSRC  mjcharv.F mjsubrv.F mjwordv.F)
endif()
#ORIGINAL #if defined(CERNLIB_IBM)
if (CERNLIB_IBM)
  list(APPEND pawlib_comis_comisftn_FSRC  mjchard.F mjsubri.F mjworda.F)
endif()
#ORIGINAL #if defined(CERNLIB_OLDVSUN)
if (CERNLIB_OLDVSUN)
  list(APPEND pawlib_comis_comisftn_FSRC  mjchars.F mjsubrs.F)
endif()
#ORIGINAL #if defined(CERNLIB_WINNT)
if (CERNLIB_WINNT)
  list(APPEND pawlib_comis_comisftn_FSRC  mjchars.F)
endif()
#ORIGINAL #if !defined(CERNLIB_PAW)
if (NOT CERNLIB_PAW)
  list(APPEND pawlib_comis_comisftn_FSRC  lenocc.F uctoh.F uhtoc.F)
endif()
#ORIGINAL #if defined(CERNLIB_LIB)
if (CERNLIB_LIB)
  list(APPEND pawlib_comis_comisftn_FSRC  cvsetr.F csword.F)
endif()
#ORIGINAL #if (!defined(CERNLIB_ASSEMB) && defined(CERNLIB_OLD))
if ( NOT CERNLIB_ASSEMB AND CERNLIB_OLD)
  list(APPEND pawlib_comis_comisftn_FSRC  csbcll.F cifncl.F clfcll.F)
endif()
#ORIGINAL #if defined(CERNLIB_QMVAOS)
if (CERNLIB_QMVAOS)
endif()
#ORIGINAL #if defined(CERNLIB_VAXVMS)
if (CERNLIB_VAXVMS)
endif()
  list(TRANSFORM pawlib_comis_comisftn_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../pawlib/comis/comisftn/")
 
#pawlib/comis/comismar/Imakefile
 
  set(pawlib_comis_comismar_SSRC comismar.s)
  list(TRANSFORM pawlib_comis_comismar_SSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../pawlib/comis/comismar/")
 
#The original Imake file below included files:pilot.h
#Those were NOT processed.
#pawlib/comis/deccc/Imakefile
 
#ORIGINAL #if defined(CERNLIB_VAXVMS)
if (CERNLIB_VAXVMS)
  set(pawlib_comis_deccc_CSRC csallo.c csvers.c)
else()
  set(pawlib_comis_deccc_CSRC csallo.c csvers.c jumpcn.c)
endif()
#include "pilot.h"
#ORIGINAL #if defined(CERNLIB_VAXVMS)
if (CERNLIB_VAXVMS)
  set(pawlib_comis_deccc_CSRC csallo.c csvers.c)
else()
  set(pawlib_comis_deccc_CSRC csallo.c csvers.c jumpcn.c)
#ORIGINAL #if defined(CERNLIB_QMVAOS)
if (CERNLIB_QMVAOS)
  list(APPEND pawlib_comis_deccc_CSRC  cscalda.c cscalia.c cscalra.c)
else()
  list(APPEND pawlib_comis_deccc_CSRC  cscald.c cscali.c cscalr.c cstrcmp.c ccopys.c)
endif()
#ORIGINAL #if defined(CERNLIB_UNIX)
if (CERNLIB_UNIX)
  list(APPEND pawlib_comis_deccc_CSRC  cstmpd.c)
endif()
#ORIGINAL #if defined(CERNLIB_HPUX) && defined(CERNLIB_SHL)
if (CERNLIB_HPUX AND CERNLIB_SHL)
  list(APPEND pawlib_comis_deccc_CSRC  cs_shl_get.c cs_shl_load.c cs_shl_symbols.c cs_shl_unload.c cs_get_func.c)
endif()
#ORIGINAL #if defined(CERNLIB_SHL) && ( defined(CERNLIB_SUN) || defined(CERNLIB_SGI) || defined(CERNLIB_IBMRT) || defined(CERNLIB_QMVAOS) || defined(CERNLIB_LINUX) )
if (CERNLIB_SHL AND ( CERNLIB_SUN OR CERNLIB_SGI OR CERNLIB_IBMRT OR CERNLIB_QMVAOS OR CERNLIB_LINUX) )
  list(APPEND pawlib_comis_deccc_CSRC  cs_hlshl.c)
#ORIGINAL #if defined(CERNLIB_IBMRT)
if (CERNLIB_IBMRT)
  list(APPEND pawlib_comis_deccc_CSRC  dlfcn.c)
endif()
endif()
endif()
#ORIGINAL #if defined(CERNLIB_HPUX) || defined(CERNLIB_IBMRT)
if (CERNLIB_HPUX OR CERNLIB_IBMRT)
endif()
#ORIGINAL #if defined(CERNLIB_LINUX)
if (CERNLIB_LINUX)
#ORIGINAL #if defined(CERNLIB_GFORTRAN)
if (CERNLIB_GFORTRAN)
else()
endif()
endif()
#ORIGINAL #if defined(CERNLIB_SUN) && !defined(CERNLIB_SOLARIS)
if (CERNLIB_SUN AND NOT CERNLIB_SOLARIS)
# CCOPTIONS =
endif()
  list(TRANSFORM pawlib_comis_deccc_CSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../pawlib/comis/deccc/")
 
#The original Imake file below included files:pilot.h
#Those were NOT processed.
#pawlib/comis/dynam/Imakefile
 
  set(pawlib_comis_dynam_FSRC cbis.F copymp.F copypm.F csetc.F cssetc.F mddef.F mdelim.F mdexl.F mdexp.F mdfh.F mdfree.F mdhini.F mdigit.F mdinit.F mdlh.F mdloc.F mdpaus.F mhdef.F mhfree.F mhloc.F mident.F
 mimpjw.F mjbges.F mjfges.F mjsins.F mkblan.F mkdigi.F mlbeqs.F mlbinp.F mlbsrp.F mlbxsp.F mldef.F mldigi.F mleqs.F mlfeqs.F mlnumb.F mlsear.F mlstrt.F mnblan.F movemp.F movepm.F mpdef.F mpdsk.F mpirec.F
 mpsetw.F)
#include "pilot.h"
#ORIGINAL #if !defined(CERNLIB_UNIX)
if (NOT CERNLIB_UNIX)
  list(APPEND pawlib_comis_dynam_FSRC  ccopys.F)
endif()
#ORIGINAL #if defined(CERNLIB_QMVAOS)
if (CERNLIB_QMVAOS)
  list(APPEND pawlib_comis_dynam_FSRC  ccopysa.F)
endif()
#ORIGINAL #if defined(CERNLIB_LIB)
if (CERNLIB_LIB)
  list(APPEND pawlib_comis_dynam_FSRC  mlseqs.F mlsges.F)
endif()
#ORIGINAL #if defined(CERNLIB_QMVAOS)
if (CERNLIB_QMVAOS)
endif()
#ORIGINAL #if defined(CERNLIB_VAXVMS)
if (CERNLIB_VAXVMS)
endif()
  list(TRANSFORM pawlib_comis_dynam_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../pawlib/comis/dynam/")
 
#pawlib/paw/cdf/Imakefile
 
  set(pawlib_paw_cdf_CDFSRC pawcdf.cdf mlpdef.cdf)
if (CERNLIB_IBMRT)
endif()
  list(TRANSFORM pawlib_paw_cdf_CDFSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../pawlib/paw/cdf/")
 
#The original Imake file below included files:pilot.h
#Those were NOT processed.
#pawlib/paw/code/Imakefile
 
  set(pawlib_paw_code_FSRC getatt.F hcopyp.F hfixid.F hgetco.F hgetid.F hgetir.F hqfxyz.F hqixyz.F hvtob.F linear.F lintra.F lmatou.F ltql2.F ltred2.F mergin.F paclos.F pacsel.F padrfa.F padriso.F padvar.F
 paexit.F pafeyn.F pafitf.F pafith.F pafitv.F pafort.F pafunc.F pageti.F paghpl.F pagksa.F pagpri.F pagraf.F pagrid.F pahbok.F pahelp.F pahexy.F pahfit.F pahio.F pahist.F pahlog.F pahmov.F pahope.F pahpr.F
 pahset.F pahsmo.F pahvec.F palin1.F palint.F pallsq.F palogo.F palogs.F palsq.F palunf.F pantax.F paobs.F paopen.F pant3d.F papiaf.F papict.F paplot.F paread.F pasigm.F paspi2.F paexpr.F paexp1.F pautit.F
 pavect.F paw.F pawbrk.F pawdef.F pawfca.F pawfitz.F pawfop.F pawfu1.F pawfu2.F pawfu3.F pawfud.F pawfun.F pawfuy.F pawild.F pawins.F pawint.F pawint1.F pawint2.F pawint3.F pawint4.F pawjoj.F pawloc.F
 pawork.F pawrit.F pawrop.F pawsim.F pawusr.F pawuwf.F paxcut.F pazdz.F pazfz.F pazrz.F pchain.F pchclo.F pchncd.F pchrop.F pcnext.F pfclos.F pfhigz.F pfindc.F pfindf.F pfindf1.F pfindv.F pfinit.F pflog.F
 pfmask.F pfpaw.F pfplot.F pfrange.F pfstate.F phinfo.F phxtoc.F plog10.F plphch.F pmncomd.F pntlog.F pntval.F pnumch.F pnutil.F pnwork.F pvmem.F rlogin.F rshell.F pfminmax.F pflabels.F pfempty.F)
#include "pilot.h"
#ORIGINAL #if defined(CERNLIB_IBM)
if (CERNLIB_IBM)
  list(APPEND pawlib_paw_code_FSRC  hbug.F igerr.F)
endif()
#ORIGINAL #if defined(CERNLIB_APOLLO)
if (CERNLIB_APOLLO)
  list(APPEND pawlib_paw_code_FSRC  hbug.F)
endif()
#ORIGINAL #if defined(CERNLIB_COMIS)
if (CERNLIB_COMIS)
  list(APPEND pawlib_paw_code_FSRC  pacsfn.F pawcs.F)
#ORIGINAL #if defined(CERNLIB_CZ)
if (CERNLIB_CZ)
  list(APPEND pawlib_paw_code_FSRC  pfcsex.F)
endif()
endif()
#ORIGINAL #if defined(CERNLIB_CZ)
if (CERNLIB_CZ)
  list(APPEND pawlib_paw_code_FSRC  pfcuts.F pfhout.F pfkuip.F pfkupn.F pfloop.F pfping.F pfpush.F pfsock.F pzgeta.F pzopen.F)
endif()
#ORIGINAL #if defined(CERNLIB_SOLARIS)
if (CERNLIB_SOLARIS)
endif()
#ORIGINAL #if defined(CERNLIB_LINUX) && defined(CERNLIB_POWERPC)
if (CERNLIB_LINUX AND CERNLIB_POWERPC)
endif()
  list(TRANSFORM pawlib_paw_code_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../pawlib/paw/code/")
 
#The original Imake file below included files:pilot.h
#Those were NOT processed.
#pawlib/paw/cpaw/Imakefile
 
  set(pawlib_paw_cpaw_CSRC chain.c pavercmd.c pavers.c)
if (NOT CERNLIB_WINNT)
  list(APPEND pawlib_paw_cpaw_CSRC  tcpiaf.c)
else()
  list(APPEND pawlib_paw_cpaw_CSRC  pfdummy.c)
endif()
#include "pilot.h"
#ORIGINAL #if defined(CERNLIB_HPUX) || defined(CERNLIB_IBMRT)
if (CERNLIB_HPUX OR CERNLIB_IBMRT)
endif()
#ORIGINAL #if defined(CERNLIB_LINUX)
if (CERNLIB_LINUX)
#ORIGINAL #if defined(CERNLIB_GFORTRAN)
if (CERNLIB_GFORTRAN)
else()
endif()
endif()
#ORIGINAL #if defined(CERNLIB_BUGREPORT)
if (CERNLIB_BUGREPORT)
  list(APPEND pawlib_paw_cpaw_CSRC  bugrep.c)
else()
  list(APPEND pawlib_paw_cpaw_CSRC  bugrep1.c)
endif()
if (CERNLIB_VAXVMS)
# DEFINES: = $(DEFINES) -DCERNLIB_TGV -DTGV
if (NOT CERNLIB_QMALPH)
# CCOPTIONS: = $(CCOPTIONS) /pref\ = ansi SpecialCObjectRule(NullParameter,tcpiaf,tcpiaf,/stand = RELAXED_ANSI89)
endif()
endif()
  list(TRANSFORM pawlib_paw_cpaw_CSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../pawlib/paw/cpaw/")
 
#pawlib/paw/mlpfit/Imakefile
 
  set(pawlib_paw_mlpfit_CSRC mlp_gen.c mlp_inter.c mlppawc.c mlp_sigmoide.c)
  set(pawlib_paw_mlpfit_FSRC mlpfit.F pawmlp1.F)
#ORIGINAL #if defined(CERNLIB_HPUX) || defined(CERNLIB_IBMRT)
if (CERNLIB_HPUX OR CERNLIB_IBMRT)
endif()
#ORIGINAL #if defined(CERNLIB_LINUX)
if (CERNLIB_LINUX)
#ORIGINAL #if defined(CERNLIB_GFORTRAN)
if (CERNLIB_GFORTRAN)
else()
endif()
endif()
if (NOT CERNLIB_VAXVMS)
# EXTRA_INCLUDES: = $(EXTRA_INCLUDES) -I$(VPATH)
endif()
  list(TRANSFORM pawlib_paw_mlpfit_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../pawlib/paw/mlpfit/")
  list(TRANSFORM pawlib_paw_mlpfit_CSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../pawlib/paw/mlpfit/")
 
#The original Imake file below included files:pilot.h
#Those were NOT processed.
#pawlib/paw/ntuple/Imakefile
 
#include "pilot.h"
  set(pawlib_paw_ntuple_CSRC c_decl.c hash_int_table.c mstr.c npantup.c qp_command.c qp_compile.c qp_convert.c qp_cuts.c qp_dimension.c qp_dyn_check.c qp_execute.c qp_exec_evt.c qp_generate.c qp_mask.c
 qp_name.c qp_parser.c qp_plot_opt.c qp_query.c qp_report.c qp_scanner.c qp_segment.c qp_semantic.c qp_signature.c qp_st_init.c qp_symtab.c qp_tree.c qp_value.c qp_hbook_if.c qpflags.c smap.c str.c svec.c
 qp_vvec.c)
  set(pawlib_paw_ntuple_FSRC ftnprn.F)
#ORIGINAL #if defined(CERNLIB_HPUX) || defined(CERNLIB_IBMRT)
if (CERNLIB_HPUX OR CERNLIB_IBMRT)
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
#ORIGINAL #if defined(CERNLIB_HPUX)
if (CERNLIB_HPUX)
# CCOPTIONS + = -Wp,-H10000
endif()
if (NOT CERNLIB_VAXVMS)
# EXTRA_INCLUDES: = $(EXTRA_INCLUDES) -I$(VPATH)
endif()
#ORIGINAL #if defined(CERNLIB_SUN) && !defined(CERNLIB_SOLARIS)
if (CERNLIB_SUN AND NOT CERNLIB_SOLARIS)
endif()
if (CERNLIB_WINNT)
endif()
#ORIGINAL #if defined(CERNLIB_VAXVMS) && !defined(CERNLIB_QMALPH)
if (CERNLIB_VAXVMS AND NOT CERNLIB_QMALPH)
# SpecialCObjectRule(NullParameter,qp_execute,qp_execute,/noopt)
endif()
# CCOPTIONS: = $(CCOPTIONS) CcAnsiMode
#ORIGINAL #if defined(CERNLIB_LINUX)
if (CERNLIB_LINUX)
# SpecialObjectRule(archive/qp_execute.o,qp_execute.c archive/qp_execute.d,-O0 -g -o $@) SpecialObjectRule(debug/qp_execute.o,qp_execute.c debug/qp_execute.d,-O0 -g -o $@) SpecialObjectRule(shared/qp_execute.o,qp_execute.c shared/qp_execute.d,-O0 -g -fPIC -o $@)
endif()
  list(TRANSFORM pawlib_paw_ntuple_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../pawlib/paw/ntuple/")
  list(TRANSFORM pawlib_paw_ntuple_CSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../pawlib/paw/ntuple/")
 
#pawlib/sigma/src/Imakefile
 
  set(pawlib_sigma_src_FSRC siallm.F siarch.F siarra.F siassi.F sibool.F sickon.F siclrp.F sicmpl.F sicmpr.F sicoma.F sicomp.F sideli.F sidiag.F sidstp.F sieige.F sieost.F sierro.F siersy.F sieval.F sifam0.F
 sifam1.F sifam2.F sifam3.F sifam4.F sifam5.F sifam6.F sifam7.F sifind.F sigecd.F sigini1.F sigma.F sigmac.F sigmae.F sigmtp.F sigop1.F sigop2.F sigsee.F sigtt2.F siinps.F sikons.F silbc7.F sildrv.F silif1.F
 silskk.F silstk.F simstk.F simult.F simvco.F sindle.F sindlf.F sindxi.F sinerr.F sinext.F singet.F sinmcd.F sinstr.F sintrp.F sinumb.F sinvco.F sinvde.F sionam.F siop1c.F siop2c.F siopr2.F siorde.F siout.F
 sioutp.F siprin.F siprit.F siquad.F sirefr.F sirnws.F siroun.F sisavp.F sistak.F sistr2.F sistri.F sisumn.F sisymb.F sisysf.F sisyso.F sitrac.F sitrax.F siupna.F siustk.F siustr.F sivari.F siwait.F siwhat.F
 six3st.F)
  set(pawlib_sigma_src_CSRC sivers.c)
if (CERNLIB_SGI)
endif()
  list(TRANSFORM pawlib_sigma_src_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../pawlib/sigma/src/")
  list(TRANSFORM pawlib_sigma_src_CSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../pawlib/sigma/src/")
 
set(pawlib_esources )
cdf_compile(${CMAKE_CURRENT_SOURCE_DIR}/paw/cdf/mlpdef.cdf ${CMAKE_CURRENT_BINARY_DIR}/mlpdef.cdf.c)
list(APPEND pawlib_esources ${CMAKE_CURRENT_BINARY_DIR}/mlpdef.cdf.c)
cdf_compile(${CMAKE_CURRENT_SOURCE_DIR}/paw/cdf/pawcdf.cdf ${CMAKE_CURRENT_BINARY_DIR}/pawcdf.cdf.c)
list(APPEND pawlib_esources ${CMAKE_CURRENT_BINARY_DIR}/pawcdf.cdf.c)
if (CERNLIB_BUILD_STATIC)
add_library(pawlib_static STATIC ${pawlib_esources}
                             ${pawlib_comis_code_FSRC} 
                             ${pawlib_comis_comisftn_FSRC} 
                             ${pawlib_comis_comismar_SSRC} 
                             ${pawlib_comis_deccc_CSRC} 
                             ${pawlib_comis_dynam_FSRC} 
                             ${pawlib_paw_cdf_CDFSRC} 
                             ${pawlib_paw_code_FSRC} 
                             ${pawlib_paw_cpaw_CSRC} 
                             ${pawlib_paw_mlpfit_FSRC} 
                             ${pawlib_paw_mlpfit_CSRC} 
                             ${pawlib_paw_ntuple_FSRC} 
                             ${pawlib_paw_ntuple_CSRC} 
                             ${pawlib_sigma_src_FSRC} 
                             ${pawlib_sigma_src_CSRC} 
)
target_include_directories(pawlib_static PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(pawlib_static PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(pawlib_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/paw")
target_include_directories(pawlib_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/sigma")
target_include_directories(pawlib_static PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS pawlib_static DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(pawlib_static PROPERTIES POSITION_INDEPENDENT_CODE ${CERNLIB_POSITION_INDEPENDENT_CODE} OUTPUT_NAME pawlib)
endif()
if (CERNLIB_BUILD_SHARED)
add_library(pawlib SHARED ${pawlib_esources}
                             ${pawlib_comis_code_FSRC} 
                             ${pawlib_comis_comisftn_FSRC} 
                             ${pawlib_comis_comismar_SSRC} 
                             ${pawlib_comis_deccc_CSRC} 
                             ${pawlib_comis_dynam_FSRC} 
                             ${pawlib_paw_cdf_CDFSRC} 
                             ${pawlib_paw_code_FSRC} 
                             ${pawlib_paw_cpaw_CSRC} 
                             ${pawlib_paw_mlpfit_FSRC} 
                             ${pawlib_paw_mlpfit_CSRC} 
                             ${pawlib_paw_ntuple_FSRC} 
                             ${pawlib_paw_ntuple_CSRC} 
                             ${pawlib_sigma_src_FSRC} 
                             ${pawlib_sigma_src_CSRC} 
)
target_include_directories(pawlib PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(pawlib PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(pawlib PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/paw")
target_include_directories(pawlib PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/sigma")
target_include_directories(pawlib PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS pawlib DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(pawlib        PROPERTIES POSITION_INDEPENDENT_CODE ON OUTPUT_NAME pawlib SOVERSION 2_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR})
install_symlink(libpawlib.so.2_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR} ${CMAKE_INSTALL_LIBDIR}/libpawlib.so.2_${COMPSUFFIX})
endif()
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/comis/comis DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}  COMPONENT devel  PATTERN "*makefile*" EXCLUDE  PATTERN "*\.c" EXCLUDE  PATTERN tree.h EXCLUDE )
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/paw/ntuple DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}  COMPONENT devel  PATTERN "*makefile*" EXCLUDE  PATTERN "*\.c" EXCLUDE  PATTERN tree.h EXCLUDE )
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/paw/paw DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}  COMPONENT devel  PATTERN "*makefile*" EXCLUDE  PATTERN "*\.c" EXCLUDE  PATTERN tree.h EXCLUDE )
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/sigma/sigma DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}  COMPONENT devel  PATTERN "*makefile*" EXCLUDE  PATTERN "*\.c" EXCLUDE  PATTERN tree.h EXCLUDE )

install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/../contrib/tree.h DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/paw)


set(FF "f2cFortran")
if (CERNLIB_QMLXIA64) 
if (CERNLIB_GFORTRAN)
set(FF "gFortran")
else()
set(FF "f2cFortran")
endif()
endif()
foreach(x IN LISTS 
                      pawlib_paw_ntuple_FSRC
                      pawlib_paw_ntuple_CSRC
                      pawlib_comis_deccc_CSRC
                      pawlib_paw_cpaw_CSRC
                     pawlib_paw_mlpfit_CSRC
                     pawlib_paw_mlpfit_FSRC
                      )
   set_source_files_properties(${x} PROPERTIES COMPILE_DEFINITIONS ${FF})
endforeach()
if(CERNLIB_ENABLE_TEST)
  ENABLE_TESTING()
  add_subdirectory(comis/test)
endif()

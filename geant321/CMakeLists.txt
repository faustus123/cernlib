
########################################################################
#
#  Automatically or semiautomaticall generated, do not edit.
#
########################################################################
# The following input was used
# block/Imakefile
# cdf/Imakefile
# cgpack/Imakefile
# erdecks/Imakefile
# erpremc/Imakefile
# fiface/Imakefile
# fluka/Imakefile
# gbase/Imakefile
# gcons/Imakefile
# gdraw/Imakefile
# geocad/Imakefile
# ggeom/Imakefile
# gheisha/Imakefile
# ghits/Imakefile
# ghrout/Imakefile
# ghutils/Imakefile
# giface/Imakefile
# giopa/Imakefile
# gkine/Imakefile
# gparal/Imakefile
# gphys/Imakefile
# gscan/Imakefile
# gstrag/Imakefile
# gtrak/Imakefile
# guser/Imakefile
# gxint/Imakefile
# matx55/Imakefile
# miface/Imakefile
# miguti/Imakefile
# neutron/Imakefile
# peanut/Imakefile

########################################################################
set_package_flags(geant321)
#geant321/block/Imakefile
 
  set(geant321_block_FSRC fdevap.F fdnopt.F fdpree.F flkdt1.F flkdt2.F flkdt3.F flkdt4.F flkdt5.F flkdt6.F flkdt7.F)
if (CERNLIB_QMVAOS)
# FORTRANSAVEOPTION = FortranSaveFlags FORTRANOPTIONS = -math_library accurate $(FORTRANSAVEOPTION)
endif()
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
# FDEBUGFLAGS = -O1 FORTRANOPTIONS = $(FORTRANSAVEOPTION)
endif()
  list(TRANSFORM geant321_block_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../geant321/block/")
 
#geant321/cdf/Imakefile
 
  set(geant321_cdf_CDFSRC g321m.cdf g321x.cdf)
  list(TRANSFORM geant321_cdf_CDFSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../geant321/cdf/")
 
#geant321/cgpack/Imakefile
 
  set(geant321_cgpack_FSRC cgaffi.F cgbfit.F cgbint.F cgbmmt.F cgbool.F cgbox.F cgbrik.F cgbsea.F cgbsec.F cgbsor.F cgbsub.F cgbtef.F cgbtfp.F cgbttt.F cgcev.F cgcopy.F cgelli.F cgfac2.F cgfaco.F cgfare.F
 cgfvis.F cghcre.F cghdfa.F cghend.F cgheva.F cghins.F cghmov.F cghpla.F cghren.F cghshi.F cghsiz.F cghtre.F cginve.F cgmnmx.F cgpers.F cgrifl.F cgsaan.F cgscop.F cgshel.F cgshif.F cgsize.F cgslic.F cgsnor.F
 cgsphe.F cgsub.F cgtset.F cgtstr.F cgvedg.F cgvhed.F cgvtef.F cgvtin.F cgwire.F cgwsor.F cgzre.F cgzrev.F)
if (CERNLIB_QMVAOS)
# FORTRANSAVEOPTION = FortranSaveFlags FORTRANOPTIONS = -math_library accurate $(FORTRANSAVEOPTION)
endif()
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
# FDEBUGFLAGS = -O1 FORTRANOPTIONS = $(FORTRANSAVEOPTION)
endif()
  list(TRANSFORM geant321_cgpack_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../geant321/cgpack/")
 
#geant321/erdecks/Imakefile
 
  set(geant321_erdecks_FSRC erbcer.F erbctr.F erland.F ermcsc.F erpini.F erprop.F erstor.F ertrak.F ertrch.F ertrgo.F ertrnt.F erxyzc.F eufill.F eufilp.F eufilv.F eustep.F evolio.F)
  list(TRANSFORM geant321_erdecks_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../geant321/erdecks/")
 
#geant321/erpremc/Imakefile
 
  set(geant321_erpremc_FSRC trprfn.F trprop.F trptsc.F trptsd.F trs1s2.F trscpt.F trscsd.F trscsp.F trsdpt.F trsdsc.F trspsc.F)
  list(TRANSFORM geant321_erpremc_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../geant321/erpremc/")
 
#geant321/fiface/Imakefile
 
  set(geant321_fiface_FSRC fldist.F flinit.F flufin.F)
if (CERNLIB_QMVAOS)
# FORTRANSAVEOPTION = FortranSaveFlags FORTRANOPTIONS = -math_library accurate $(FORTRANSAVEOPTION)
endif()
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
# FDEBUGFLAGS = -O1 FORTRANOPTIONS = $(FORTRANSAVEOPTION)
endif()
  list(TRANSFORM geant321_fiface_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../geant321/fiface/")
 
#geant321/fluka/Imakefile
 
  set(geant321_fluka_FSRC abbrch.F ainel.F akeka.F altra.F altraf.F amga.F ankeka.F bamjev.F beexi.F bekeka.F berttp.F beta.F betarn.F betrst.F bkeka.F bklass.F bnkeka.F calumo.F calumv.F chanwt.F corevt.F
 corrin.F datar3.F decaux.F difevv.F dost.F drelab.F eexi.F eexlvl.F ekeka.F energi.F enrg.F evdeex.F eventv.F evevap.F evvini.F ferevv.F ferhav.F fisfra.F fkdeca.F fkdres.F fkener.F fkerup.F fkflav.F
 fkimpu.F fksigi.F fkvert.F fkzero.F fpower.F fprob.F gamrn.F geta.F hadden.F hadevv.F hadrin.F hadriv.F hevhin.F hinhev.F hklass.F hypero.F iefun.F incini.F index2.F kinpar.F kpois.F lortra.F nizl.F nizlnw.F
 nucevv.F nucrel.F nucriv.F nudisv.F nuprel.F parjet.F pmprab.F poli.F qnrg.F raco.F rakekv.F rbkekv.F rchanv.F rotat.F samcst.F sfecfe.F shptot.F sigel.F sihael.F sitsao.F stalin.F tchoic.F threpd.F trafo.F
 trahad.F trans.F ttrans.F twopad.F twopar.F verein.F xlamb.F xseneu.F xsepro.F)
if (CERNLIB_OLDNAME)
  list(APPEND geant321_fluka_FSRC  decay.F dres.F energy.F erup.F flavor.F impuls.F sigint.F vertex.F zeroin.F)
endif()
if (CERNLIB_QMVAOS)
# FORTRANSAVEOPTION = FortranSaveFlags FORTRANOPTIONS = -math_library accurate $(FORTRANSAVEOPTION)
endif()
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
# FDEBUGFLAGS = -O1 FORTRANOPTIONS = $(FORTRANSAVEOPTION)
endif()
  list(TRANSFORM geant321_fluka_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../geant321/fluka/")
 
#The original Imake file below included files:pilot.h
#Those were NOT processed.
#geant321/gbase/Imakefile
 
#include "pilot.h"
  set(geant321_gbase_FSRC gbhsta.F getnum.F getver.F gffgo.F gfhead.F gfhsta.F gfrung.F ghclos.F ginit.F glast.F glook.F gmail.F gphead.F gprint.F gprung.F grun.F gshead.F gsrung.F gtrig.F gtrigc.F gtrigi.F
 gwork.F gzebra.F gzinit.F)
#ORIGINAL #if defined(CERNLIB_MONITOR)
if (CERNLIB_MONITOR)
  list(APPEND geant321_gbase_FSRC  geamon.F)
endif()
#ORIGINAL #if defined(CERNLIB_OLD)
if (CERNLIB_OLD)
  list(APPEND geant321_gbase_FSRC  ggclo2.F)
else()
  list(APPEND geant321_gbase_FSRC  ggclos.F)
endif()
if (CERNLIB_QMVAOS)
# FORTRANSAVEOPTION = FortranSaveFlags FORTRANOPTIONS = -math_library accurate $(FORTRANSAVEOPTION)
endif()
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
# FDEBUGFLAGS = -O1 FORTRANOPTIONS = $(FORTRANSAVEOPTION)
endif()
#ORIGINAL #if defined(CERNLIB_SOLARIS)
if (CERNLIB_SOLARIS)
endif()
  list(TRANSFORM geant321_gbase_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../geant321/gbase/")
 
#geant321/gcons/Imakefile
 
  set(geant321_gcons_FSRC gevkev.F gfcoul.F gfmate.F gfpart.F gftmat.F gftmed.F ghmix.F gmate.F gpart.F gpions.F gplmat.F gpmate.F gpmatx.F gppart.F gpparx.F gprmat.F gptmed.F gptmex.F gsckov.F gsdk.F
 gsmate.F gsmixt.F gspart.F gstmed.F gstpar.F gxsi.F)
if (CERNLIB_QMVAOS)
# FORTRANSAVEOPTION = FortranSaveFlags FORTRANOPTIONS = -math_library accurate $(FORTRANSAVEOPTION)
endif()
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
# FDEBUGFLAGS = -O1 FORTRANOPTIONS = $(FORTRANSAVEOPTION)
endif()
  list(TRANSFORM geant321_gcons_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../geant321/gcons/")
 
#The original Imake file below included files:pilot.h
#Those were NOT processed.
#geant321/gdraw/Imakefile
 
#include "pilot.h"
  set(geant321_gdraw_FSRC gchnwk.F gd3d3d.F gdahit.F gdarc.F gdarr.F gdaxis.F gdbomb.F gdcgcl.F gdcgem.F gdcger.F gdcghi.F gdcgob.F gdcgpr.F gdcgrs.F gdcgsl.F gdcgwv.F gdchit.F gdcirc.F gdcirr.F gdciry.F
 gdclos.F gdcol.F gdcol1.F gdcurs.F gdcut.F gdcxyz.F gdelet.F gdeltu.F gdfr3d.F gdfspc.F gdhead.F gdhits.F gdinit.F gdkine.F gdlcyl.F gdlens.F gdline.F gdlumi.F gdlw.F gdlw1.F gdman.F gdnino.F gdnson.F
 gdopen.F gdopt.F gdpart.F gdplst.F gdprtr.F gdrack.F gdraw.F gdrawc.F gdrawp.F gdraws.F gdrawt.F gdrawv.F gdrawx.F gdrayt.F gdrect.F gdrvol.F gdrwsc.F gdsarc.F gdscal.F gdshif.F gdshow.F gdson.F gdspec.F
 gdssur.F gdstep.F gdsurf.F gdthrz.F gdtr0.F gdtr1.F gdtr10.F gdtr11.F gdtr12.F gdtr2.F gdtr3.F gdtr4.F gdtr5.F gdtr6.F gdtr8.F gdtr99.F gdtrak.F gdtree.F gdwmn1.F gdwmn2.F gdwmn3.F gdxyz.F gdxzoo.F gdzoom.F
 geditv.F gfind.F gkhits.F gkxyz.F glight.F gm3pol.F gmclos.F gmopen.F greswk.F gspe3d.F gunliv.F gviewf.F)
if (CERNLIB_CG)
  list(APPEND geant321_gdraw_FSRC  gd16v.F gdcgvw.F gdcota.F gdshad.F)
endif()
if (CERNLIB_QMVAOS)
# FORTRANSAVEOPTION = FortranSaveFlags FORTRANOPTIONS = -math_library accurate $(FORTRANSAVEOPTION)
endif()
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
# FDEBUGFLAGS = -O1 FORTRANOPTIONS = $(FORTRANSAVEOPTION)
endif()
  list(TRANSFORM geant321_gdraw_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../geant321/gdraw/")
 
#geant321/geocad/Imakefile
 
  set(geant321_geocad_FSRC gboset.F gckmat.F gckpar.F gcoset.F gctset.F gdexca.F gelset.F genset.F getshp.F gjwrit.F gpaset.F gpcset.F gpgset.F gposi.F gptset.F greucl.F gspset.F gstmat.F gstset.F gtrase.F
 gtrdse.F gtrset.F gtuset.F gtxset.F gweucl.F gwrtre.F)
if (CERNLIB_QMVAOS)
# FORTRANSAVEOPTION = FortranSaveFlags FORTRANOPTIONS = -math_library accurate $(FORTRANSAVEOPTION)
endif()
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
# FDEBUGFLAGS = -O1 FORTRANOPTIONS = $(FORTRANSAVEOPTION)
endif()
  list(TRANSFORM geant321_geocad_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../geant321/geocad/")
 
#geant321/ggeom/Imakefile
 
  set(geant321_ggeom_FSRC gbstat.F gcent.F gdtom.F gfatt.F gfclim.F gfcoor.F gfcord.F gfcvol.F gfipar.F gflcar.F gflphi.F gflrad.F gflthe.F gfmoth.F gfpara.F gfstat.F gfupar.F gfvolu.F ggcave.F ggdpar.F
 ggdspe.F ggdvlp.F ggnlev.F ggord.F ggordq.F ggperp.F ggppar.F ggvchk.F ginctu.F gingtr.F ginme.F ginpar.F ginpco.F ginpgo.F ginrot.F gintco.F gintrp.F gitran.F glmoth.F glvolu.F gmedin.F gmediv.F gmepos.F
 gmtod.F gnbox.F gncone.F gnctub.F gneltu.F gnhype.F gnobox.F gnocon.F gnoctu.F gnoelt.F gnohyp.F gnopar.F gnopco.F gnopg1.F gnopgo.F gnosph.F gnotr1.F gnotr2.F gnotr9.F gnotra.F gnotrp.F gnotub.F gnpara.F
 gnpcon.F gnpgo1.F gnpgon.F gnsphr.F gntrap.F gntrp.F gntube.F gprotm.F gprotx.F gpstat.F gpvolu.F gpvolx.F grmtd.F grmul.F grot.F grpar.F gsagtr.F gsaphi.F gsatt.F gschk.F gscvol.F gsdvn.F gsdvn2.F gsdvs.F
 gsdvs2.F gsdvt.F gsdvt2.F gsdvx.F gsipar.F gsnear.F gsnext.F gsngtr.F gsord.F gspos.F gsposp.F gsrotm.F gsunea.F gsvolu.F gtrain.F gtrmul.F gtrnsf.F gvdcar.F gvdlim.F gvdphi.F gvdrad.F gvdthe.F gvgrad.F
 gvlong.F gvpsqr.F gvsafe.F gvsign.F)
if (CERNLIB_OLD)
  list(APPEND geant321_ggeom_FSRC  gmedi2.F gnex2.F)
else()
  list(APPEND geant321_ggeom_FSRC  gmedia.F gnext.F)
endif()
if (CERNLIB_QMVAOS)
# FORTRANSAVEOPTION = FortranSaveFlags FORTRANOPTIONS = -math_library accurate $(FORTRANSAVEOPTION)
endif()
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
# FDEBUGFLAGS = -O1 FORTRANOPTIONS = $(FORTRANSAVEOPTION)
endif()
  list(TRANSFORM geant321_ggeom_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../geant321/ggeom/")
 
#geant321/gheisha/Imakefile
 
  set(geant321_gheisha_FSRC atomas.F captur.F casal0.F casaom.F casasm.F casasp.F casax0.F casaxm.F casfrg.F cask0.F cask0b.F caskm.F caskp.F casl0.F casn.F casnb.F casom.F casp.F caspb.F caspim.F caspip.F
 cassm.F cassp.F casx0.F casxm.F cinema.F coranh.F coscat.F defs1.F dlpnuc.F dlpsor.F dotes2.F dotnuc.F dpdnuc.F exnu.F fctcos.F fermi.F fissio.F gdpdk.F genxpt.F gpdk.F kmabs.F nbanh.F nfac.F normal.F
 nucrec.F pbanh.F phasp.F phpnuc.F pimabs.F pmltpc.F poisso.F ranres.F rotes2.F rtmi.F selfab.F setcur.F settrk.F steep.F steeq.F steer.F stees.F stpair.F tdelay.F twob.F twoclu.F add.F add3.F sub3.F cross3.F
 sub.F lor.F length.F ang.F defs.F trac.F)
if (CERNLIB_QMVAOS)
# FORTRANSAVEOPTION = FortranSaveFlags FORTRANOPTIONS = -math_library accurate $(FORTRANSAVEOPTION)
endif()
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
# FDEBUGFLAGS = -O1 FORTRANOPTIONS = $(FORTRANSAVEOPTION)
endif()
  list(TRANSFORM geant321_gheisha_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../geant321/gheisha/")
 
#geant321/ghits/Imakefile
 
  set(geant321_ghits_FSRC gcderr.F gcdrif.F gcmwpc.F gcubs.F gfdet.F gfdeta.F gfdetd.F gfdeth.F gfdetu.F gfdigi.F gfhits.F gfndig.F gfnhit.F gfpath.F ggdetv.F gicyl.F giplan.F gpdigi.F gpdrif.F gphits.F
 gpmwpc.F gpsets.F grhits.F gsahit.F gschit.F gsdet.F gsdeta.F gsdetd.F gsdeth.F gsdetu.F gsdetv.F gsdigi.F)
if (CERNLIB_QMVAOS)
# FORTRANSAVEOPTION = FortranSaveFlags FORTRANOPTIONS = -math_library accurate $(FORTRANSAVEOPTION)
endif()
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
# FDEBUGFLAGS = -O1 FORTRANOPTIONS = $(FORTRANSAVEOPTION)
endif()
  list(TRANSFORM geant321_ghits_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../geant321/ghits/")
 
#geant321/ghrout/Imakefile
 
  set(geant321_ghrout_FSRC cohert.F ghepec.F ghetun.F higclu.F highab.F higsel.F higxpt.F sverl2.F svgam7.F)
if (CERNLIB_QMVAOS)
# FORTRANSAVEOPTION = FortranSaveFlags FORTRANOPTIONS = -math_library accurate $(FORTRANSAVEOPTION)
endif()
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
# FDEBUGFLAGS = -O1 FORTRANOPTIONS = $(FORTRANSAVEOPTION)
endif()
if (CERNLIB_SGI)
# SpecialFortranLibObjectRule(higclu,higclu,NullParameter,NullParameter)
endif()
  list(TRANSFORM geant321_ghrout_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../geant321/ghrout/")
 
#geant321/ghutils/Imakefile
 
  set(geant321_ghutils_FSRC minv.F pcsdat.F)
if (CERNLIB_QMVAOS)
# FORTRANSAVEOPTION = FortranSaveFlags FORTRANOPTIONS = -math_library accurate $(FORTRANSAVEOPTION)
endif()
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
# FDEBUGFLAGS = -O1 FORTRANOPTIONS = $(FORTRANSAVEOPTION)
endif()
  list(TRANSFORM geant321_ghutils_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../geant321/ghutils/")
 
#geant321/giface/Imakefile
 
  set(geant321_giface_FSRC compo.F gheini.F gheish.F ghesig.F ghstop.F gmunu.F gmunui.F gmusig.F gnslwd.F gpfis.F gpfisi.F gpghei.F gphmfi.F limdat.F)
if (CERNLIB_QMVAOS)
# FORTRANSAVEOPTION = FortranSaveFlags FORTRANOPTIONS = -math_library accurate $(FORTRANSAVEOPTION)
endif()
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
# FDEBUGFLAGS = -O1 FORTRANOPTIONS = $(FORTRANSAVEOPTION)
endif()
  list(TRANSFORM geant321_giface_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../geant321/giface/")
 
#geant321/giopa/Imakefile
 
  set(geant321_giopa_FSRC gclose.F gfin.F gfout.F gget.F gopen.F grend.F grfile.F grget.F grin.F grleas.F grmdir.F grout.F grsave.F gsave.F)
if (CERNLIB_QMVAOS)
# FORTRANSAVEOPTION = FortranSaveFlags FORTRANOPTIONS = -math_library accurate $(FORTRANSAVEOPTION)
endif()
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
# FDEBUGFLAGS = -O1 FORTRANOPTIONS = $(FORTRANSAVEOPTION)
endif()
  list(TRANSFORM geant321_giopa_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../geant321/giopa/")
 
#geant321/gkine/Imakefile
 
  set(geant321_gkine_FSRC gfkine.F gfvert.F gludky.F glund.F glundi.F gpkine.F gpkinx.F gpvert.F gskine.F gskinu.F gsvert.F gsveru.F gtau.F)
if (CERNLIB_QMVAOS)
# FORTRANSAVEOPTION = FortranSaveFlags FORTRANOPTIONS = -math_library accurate $(FORTRANSAVEOPTION)
endif()
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
# FDEBUGFLAGS = -O1 FORTRANOPTIONS = $(FORTRANSAVEOPTION)
endif()
  list(TRANSFORM geant321_gkine_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../geant321/gkine/")
 
#geant321/gparal/Imakefile
 
#ORIGINAL #if defined(CERNLIB_IBMRT)
if (CERNLIB_IBMRT)
#  set(geant321_gparal_FSRC gpabort.F gplast.F gprun.F gptrigi.F gpdefrng.F gpreadrng.F gpsumhr.F gpwriterng.F checkstr.F gpinit.F gprocs.F gptrigi.F pbarrier.F grun.F ginit.F EXTRA_INCLUDES = -I/usr/lpp/ppe.poe/include
endif()
  list(TRANSFORM geant321_gparal_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../geant321/gparal/")
 
#The original Imake file below included files:pilot.h
#Those were NOT processed.
#geant321/gphys/Imakefile
 
#include "pilot.h"
  set(geant321_gphys_FSRC ganni.F ganni2.F gannii.F gannir.F gavrl2.F gavrl3.F gbflos.F gbfsig.F gbirk.F gbrela.F gbrele.F gbrelm.F gbreme.F gbremm.F gbrsga.F gbrsge.F gbrsgm.F gbteth.F gcbrem.F gcoeff.F
 gcomp.F gcompi.F gdeca2.F gdeca3.F gdecay.F gdray.F gdrela.F gdrele.F gdreli.F gdrelm.F gdrelp.F gdrelx.F gdrot.F gdrprt.F gdrsga.F gefch2.F gfang.F gfluct.F gfnrdt.F gfrdt.F gfsdpr.F gfshdc.F gfshls.F
 ghsig.F ghsigm.F glande.F glandg.F glando.F glandr.F glands.F glandz.F glisur.F gloren.F gmcoul.F gmgaus.F gmol4.F gmoli.F gmolie.F gmolio.F gmulof.F gmults.F gpairg.F gpairm.F gphak.F gphal2.F gphal3.F
 gphini.F gphot.F gphoti.F gphrin.F gphsg1.F gphsg2.F gphsgp.F gphsig.F gphxin.F gphxsi.F gphysi.F gpoiss.F gprela.F gprelm.F gprobi.F gprsga.F gprsgg.F gprsgm.F grangi.F grayl.F grayli.F gshlin.F gsync.F
 gsynge.F gvaviv.F gvrot.F)
if (CERNLIB_VER314)
  list(APPEND geant321_gphys_FSRC  gmols.F gmoli1.F gmoli2.F)
endif()
if (CERNLIB_NEVER)
  list(APPEND geant321_gphys_FSRC  grangi1.F gsynit.F)
endif()
if (CERNLIB_QMVAOS)
# FORTRANSAVEOPTION = FortranSaveFlags FORTRANOPTIONS = -math_library accurate $(FORTRANSAVEOPTION)
endif()
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
# FDEBUGFLAGS = -O1 FORTRANOPTIONS = $(FORTRANSAVEOPTION)
endif()
  list(TRANSFORM geant321_gphys_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../geant321/gphys/")
 
#geant321/gscan/Imakefile
 
  set(geant321_gscan_FSRC gscani.F gscank.F gscano.F gscanu.F gsscan.F)
if (CERNLIB_QMVAOS)
# FORTRANSAVEOPTION = FortranSaveFlags FORTRANOPTIONS = -math_library accurate $(FORTRANSAVEOPTION)
endif()
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
# FDEBUGFLAGS = -O1 FORTRANOPTIONS = $(FORTRANSAVEOPTION)
endif()
  list(TRANSFORM geant321_gscan_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../geant321/gscan/")
 
#The original Imake file below included files:pilot.h
#Those were NOT processed.
#geant321/gstrag/Imakefile
 
#include "pilot.h"
  set(geant321_gstrag_FSRC gkokri.F goscin.F gpscin.F gstcor.F gstdn.F gstini.F gstint.F gstren.F gsttab.F gstxin.F gxgint.F)
if (CERNLIB_ASHO)
  list(APPEND geant321_gstrag_FSRC  gasho.F gdifmg.F giasho.F goscmg.F)
endif()
if (CERNLIB_QMVAOS)
# FORTRANSAVEOPTION = FortranSaveFlags FORTRANOPTIONS = -math_library accurate $(FORTRANSAVEOPTION)
endif()
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
# FDEBUGFLAGS = -O1 FORTRANOPTIONS = $(FORTRANSAVEOPTION)
endif()
  list(TRANSFORM geant321_gstrag_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../geant321/gstrag/")
 
#geant321/gtrak/Imakefile
 
  set(geant321_gtrak_FSRC garndm.F gdebug.F gekbin.F gfinds.F gftrac.F ggckov.F ghelix.F ghelx3.F glsklt.F gltrac.F gnckov.F gpcxyz.F gpgkin.F gpjxyz.F granor.F grkuta.F grndm.F grndmq.F gsking.F gskpho.F
 gsstak.F gstord.F gstrac.F gsxyz.F gtckov.F gtelec.F gtgama.F gthadr.F gthion.F gtmuon.F gtneut.F gtnino.F gtrack.F gtreve.F)
if (CERNLIB_OLD)
  list(APPEND geant321_gtrak_FSRC  ginvo2.F gtmed2.F gtnex2.F)
else()
  list(APPEND geant321_gtrak_FSRC  ginvol.F gtmedi.F gtnext.F)
endif()
if (CERNLIB_QMVAOS)
# FORTRANSAVEOPTION = FortranSaveFlags FORTRANOPTIONS = -math_library accurate $(FORTRANSAVEOPTION)
endif()
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
# FDEBUGFLAGS = -O1 FORTRANOPTIONS = $(FORTRANSAVEOPTION)
endif()
#ORIGINAL #if defined(CERNLIB_LNX) && !defined(CERNLIB_QMLXIA64) && (!defined(CERNLIB_GFORTRAN))
if ( CERNLIB_LNX AND NOT CERNLIB_QMLXIA64 AND NOT CERNLIB_GFORTRAN)
# FDEBUGFLAGS = -O0 FORTRANOPTIONS = $(FORTRANSAVEOPTION)
endif()
  list(TRANSFORM geant321_gtrak_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../geant321/gtrak/")
 
#geant321/guser/Imakefile
 
  set(geant321_guser_FSRC gudcay.F gudigi.F gudtim.F gufld.F guhadr.F guiget.F guinme.F guinti.F gukine.F gunear.F guout.F gupara.F guphad.F guplsh.F guskip.F gustep.F guswim.F gutrak.F gutrev.F guview.F
 guxcs.F)
if (CERNLIB_QMVAOS)
# FORTRANSAVEOPTION = FortranSaveFlags FORTRANOPTIONS = -math_library accurate $(FORTRANSAVEOPTION)
endif()
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
# FDEBUGFLAGS = -O1 FORTRANOPTIONS = $(FORTRANSAVEOPTION)
endif()
  list(TRANSFORM geant321_guser_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../geant321/guser/")
 
#geant321/gxint/Imakefile
 
  set(geant321_gxint_FSRC gdrmat.F gidrop.F gintri.F goptim.F gpaw.F gpawpp.F gxclos.F gxcont.F gxcs.F gxdraw.F gxdz.F gxfca.F gxfort.F gxfz.F gxgcon.F gxgeom.F gxlist.F gxlunf.F gxobj.F gxphys.F gxpick.F
 gxrz.F gxscah.F gxscal.F gxscan.F)
if (CERNLIB_QMVAOS)
# FORTRANSAVEOPTION = FortranSaveFlags FORTRANOPTIONS = -math_library accurate $(FORTRANSAVEOPTION)
endif()
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
# FDEBUGFLAGS = -O1 FORTRANOPTIONS = $(FORTRANSAVEOPTION)
endif()
#ORIGINAL #if defined(CERNLIB_VAXVMS)
if (CERNLIB_VAXVMS)
 CppFileTarget(gxint321.f,gxint.$$f,$(FORTRANINCLUDES) $(ALLDEFINES),NullParameter)
endif()
#ORIGINAL #if defined(CERNLIB_UNIX)
if (CERNLIB_UNIX)
endif()
  list(TRANSFORM geant321_gxint_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../geant321/gxint/")
 
#geant321/matx55/Imakefile
 
  set(geant321_matx55_FSRC dcross.F ddot.F dmm55.F dnorm.F dsmt5t.F rmm55.F rsmt5t.F ssmt5t.F xmm55.F)
  list(TRANSFORM geant321_matx55_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../geant321/matx55/")
 
#geant321/miface/Imakefile
 
  set(geant321_miface_FSRC gmicap.F gmiset.F gmorin.F gmplxs.F gmxsec.F)
if (CERNLIB_QMVAOS)
# FORTRANSAVEOPTION = FortranSaveFlags FORTRANOPTIONS = -math_library accurate $(FORTRANSAVEOPTION)
endif()
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
# FDEBUGFLAGS = -O1 FORTRANOPTIONS = $(FORTRANSAVEOPTION)
endif()
  list(TRANSFORM geant321_miface_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../geant321/miface/")
 
#geant321/miguti/Imakefile
 
  set(geant321_miguti_FSRC azirn.F exprnf.F gtiso.F randc.F sflraf.F sigmor.F)
if (CERNLIB_QMVAOS)
# FORTRANSAVEOPTION = FortranSaveFlags FORTRANOPTIONS = -math_library accurate $(FORTRANSAVEOPTION)
endif()
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
# FDEBUGFLAGS = -O1 FORTRANOPTIONS = $(FORTRANSAVEOPTION)
endif()
  list(TRANSFORM geant321_miguti_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../geant321/miguti/")
 
#geant321/neutron/Imakefile
 
  set(geant321_neutron_FSRC angcdf.F bankr.F barier.F cadig.F cangle.F cevap.F cevap1.F chkzeb.F clear.F cmlabe.F cmlabi.F colisn.F cterp.F evaplr.F fisrnf.F fltrnf.F getene.F getnu.F getpar.F grndst.F
 gtmed.F interp.F intsch.F isotpe.F labnf.F lr2bod.F lrnorm.F matiso.F micset.F moxsec.F n2nn3n.F nghevy.F nn2bod.F nsigta.F partxs.F photon.F rnmaxf.F secegy.F secl11.F seclf1.F seclf5.F seclf7.F seclf9.F
 stopar.F tbsplt.F thrmsc.F thrsel.F trebod.F twobod.F xsecn1.F xsecn2.F xsecn3.F xsecn5.F xsecnu.F)
if (CERNLIB_QMVAOS)
# FORTRANSAVEOPTION = FortranSaveFlags FORTRANOPTIONS = -math_library accurate $(FORTRANSAVEOPTION)
endif()
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
# FDEBUGFLAGS = -O1 FORTRANOPTIONS = $(FORTRANSAVEOPTION)
endif()
  list(TRANSFORM geant321_neutron_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../geant321/neutron/")
 
#geant321/peanut/Imakefile
 
  set(geant321_peanut_FSRC bimsel.F cosleg.F fekfnc.F fpfrnc.F fradnc.F frhinc.F frhonc.F nclvin.F nclvst.F nucnuc.F nwisel.F peanut.F pfnclv.F phdset.F phdwll.F pioabs.F prepre.F rstsel.F sbcomp.F sigfer.F
 umofin.F xinneu.F xinpro.F)
if (CERNLIB_QMVAOS)
# FORTRANSAVEOPTION = FortranSaveFlags FORTRANOPTIONS = -math_library accurate $(FORTRANSAVEOPTION)
endif()
#ORIGINAL #if defined(CERNLIB_DECS) && !defined(CERNLIB_QMVAOS)
if (CERNLIB_DECS AND NOT CERNLIB_QMVAOS)
# FDEBUGFLAGS = -O1 FORTRANOPTIONS = $(FORTRANSAVEOPTION)
endif()
  list(TRANSFORM geant321_peanut_FSRC PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/../geant321/peanut/")
 
set(geant321_esources )
cdf_compile(${CMAKE_CURRENT_SOURCE_DIR}/cdf/g321m.cdf ${CMAKE_CURRENT_BINARY_DIR}/g321m.cdf.c)
list(APPEND geant321_esources ${CMAKE_CURRENT_BINARY_DIR}/g321m.cdf.c)
cdf_compile(${CMAKE_CURRENT_SOURCE_DIR}/cdf/g321x.cdf ${CMAKE_CURRENT_BINARY_DIR}/g321x.cdf.c)
list(APPEND geant321_esources ${CMAKE_CURRENT_BINARY_DIR}/g321x.cdf.c)
if (CERNLIB_BUILD_STATIC)
add_library(geant321_static STATIC ${geant321_esources}
                             ${geant321_block_FSRC} 
                             ${geant321_cdf_CDFSRC} 
                             ${geant321_cgpack_FSRC} 
                             ${geant321_erdecks_FSRC} 
                             ${geant321_erpremc_FSRC} 
                             ${geant321_fiface_FSRC} 
                             ${geant321_fluka_FSRC} 
                             ${geant321_gbase_FSRC} 
                             ${geant321_gcons_FSRC} 
                             ${geant321_gdraw_FSRC} 
                             ${geant321_geocad_FSRC} 
                             ${geant321_ggeom_FSRC} 
                             ${geant321_gheisha_FSRC} 
                             ${geant321_ghits_FSRC} 
                             ${geant321_ghrout_FSRC} 
                             ${geant321_ghutils_FSRC} 
                             ${geant321_giface_FSRC} 
                             ${geant321_giopa_FSRC} 
                             ${geant321_gkine_FSRC} 
                             ${geant321_gparal_FSRC} 
                             ${geant321_gphys_FSRC} 
                             ${geant321_gscan_FSRC} 
                             ${geant321_gstrag_FSRC} 
                             ${geant321_gtrak_FSRC} 
                             ${geant321_guser_FSRC} 
                             ${geant321_gxint_FSRC} 
                             ${geant321_matx55_FSRC} 
                             ${geant321_miface_FSRC} 
                             ${geant321_miguti_FSRC} 
                             ${geant321_neutron_FSRC} 
                             ${geant321_peanut_FSRC} 
)
target_include_directories(geant321_static PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(geant321_static PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(geant321_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")
target_include_directories(geant321_static PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/geant321")
target_include_directories(geant321_static PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS geant321_static DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(geant321_static PROPERTIES POSITION_INDEPENDENT_CODE ${CERNLIB_POSITION_INDEPENDENT_CODE} OUTPUT_NAME geant321)
install_symlink(libgeant321.a  ${CMAKE_INSTALL_LIBDIR}/libgeant.a)
endif()
if (CERNLIB_BUILD_SHARED)
add_library(geant321 SHARED ${geant321_esources}
                             ${geant321_block_FSRC} 
                             ${geant321_cdf_CDFSRC} 
                             ${geant321_cgpack_FSRC} 
                             ${geant321_erdecks_FSRC} 
                             ${geant321_erpremc_FSRC} 
                             ${geant321_fiface_FSRC} 
                             ${geant321_fluka_FSRC} 
                             ${geant321_gbase_FSRC} 
                             ${geant321_gcons_FSRC} 
                             ${geant321_gdraw_FSRC} 
                             ${geant321_geocad_FSRC} 
                             ${geant321_ggeom_FSRC} 
                             ${geant321_gheisha_FSRC} 
                             ${geant321_ghits_FSRC} 
                             ${geant321_ghrout_FSRC} 
                             ${geant321_ghutils_FSRC} 
                             ${geant321_giface_FSRC} 
                             ${geant321_giopa_FSRC} 
                             ${geant321_gkine_FSRC} 
                             ${geant321_gparal_FSRC} 
                             ${geant321_gphys_FSRC} 
                             ${geant321_gscan_FSRC} 
                             ${geant321_gstrag_FSRC} 
                             ${geant321_gtrak_FSRC} 
                             ${geant321_guser_FSRC} 
                             ${geant321_gxint_FSRC} 
                             ${geant321_matx55_FSRC} 
                             ${geant321_miface_FSRC} 
                             ${geant321_miguti_FSRC} 
                             ${geant321_neutron_FSRC} 
                             ${geant321_peanut_FSRC} 
)
target_include_directories(geant321 PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_include_directories(geant321 PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(geant321 PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/")
target_include_directories(geant321 PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/geant321")
target_include_directories(geant321 PRIVATE ${FREETYPE_INCLUDE_DIRS})
install(TARGETS geant321 DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT libs)
set_target_properties(geant321        PROPERTIES POSITION_INDEPENDENT_CODE ON OUTPUT_NAME geant321 SOVERSION 2_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR})
install_symlink(libgeant321.so.2_${COMPSUFFIX}.${CERNLIB_VERSION_MAJOR} ${CMAKE_INSTALL_LIBDIR}/libgeant321.so.2_${COMPSUFFIX})
endif()
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/geant321 DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}  COMPONENT devel  PATTERN "*makefile*" EXCLUDE  PATTERN "*\.c" EXCLUDE )

install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/data/flukaaf.dat DESTINATION ${CMAKE_INSTALL_DATADIR}/cernlib/${CERNLIB_VERSION})

foreach(x IN LISTS 
                             geant321_block_FSRC 
                             geant321_cdf_CDFSRC 
                             geant321_cgpack_FSRC 
                             geant321_fiface_FSRC 
                             geant321_fluka_FSRC 
                             geant321_gbase_FSRC 
                             geant321_gcons_FSRC 
                             geant321_gdraw_FSRC 
                             geant321_geocad_FSRC 
                             geant321_ggeom_FSRC
                             geant321_gheisha_FSRC 
                             geant321_ghits_FSRC 
                             geant321_ghrout_FSRC 
                             geant321_ghutils_FSRC 
                             geant321_giface_FSRC 
                             geant321_giopa_FSRC 
                             geant321_gkine_FSRC 
                             geant321_gparal_FSRC 
                             geant321_gphys_FSRC 
                             geant321_gscan_FSRC 
                             geant321_gstrag_FSRC 
                             geant321_gtrak_FSRC 
                             geant321_guser_FSRC 
                             geant321_gxint_FSRC 
                             geant321_miface_FSRC 
                             geant321_miguti_FSRC
                             geant321_neutron_FSRC 
                             geant321_peanut_FSRC)
   set_source_files_properties(${x} PROPERTIES COMPILE_DEFINITIONS "CERNLIB_BLDLIB")
#The following directories will not get the flag.
#                             geant321_matx55_FSRC
#                             geant321_erdecks_FSRC
#                             geant321_erpremc_FSRC 

endforeach()
if(CERNLIB_ENABLE_TEST)
  ENABLE_TESTING()
  add_subdirectory(examples)
endif()
     
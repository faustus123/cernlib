*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/14 13:10:13  mclareni
* Initial revision
*
*
#ifndef CERNLIB_HIGZ_HIGED_INC
#define CERNLIB_HIGZ_HIGED_INC
*
*
* higed.inc
*
*CMZ :  1.18/00 23/04/93  17.27.57  by  O.Couet
*-- Author :
      COMMON /HIGED/ XPM(2,3),YPM(2,3),ICUMEN(3),ICUCHO(3),NBU(3)
     +,NBITEM(3),ISOF,ICPLCI,ICLN,ICFACI,ICFAIS,ICFASI,ICBOCI,ICBOIS
     +,ICBOSI,ICBOBO,ICFBCI,ICFBIS,ICFBSI,ICFBBO,ICPMCI,ICMK,RCMKSC
     +,RCSTAN,RCSTSI,ICSTPA,RCSTSH,ICSTCI,RCTXAN,RCTXSI,ICTXFT,ICTXPR
     +,ICTXCI,ICTXAH,ICTXAV,RCBOF,RCBWD,ICHILN,ICHIPC,ICHIFC,ICHIFI
     +,ICHIFS,RCARSI,ICARLC,ICARFC,ICARFI,ICARFS,ICARLN,RCAXTS,RCAXLS
     +,RCAXLO,RCAXW1,RCAXW2,ICAXND,ICAXLN,ICAXLC,ICAXLF,ICAXLP,ICACFI
     +,ICACFS,ICACBO,ICACLC,ICACFC,RCLWSC,X(100),Y(100)
     +,IXSTEP,IYSTEP,IXFACT,IYFACT,ICPBST,ICPFST,RCDZPV
      CHARACTER*32 TITLE(3)
      CHARACTER*20 CHUSKE(20,3)
      CHARACTER*32 CHITEM(20,3)
      CHARACTER*80 CHDEF(20)
      CHARACTER*32 CHOPST,CHOPAX,CHOPHI,CHOPPV
      CHARACTER*80 CCST,CCTX
      CHARACTER*80 CHFAC,CHPLC,CHTXC,CHPMC,CHFAIS,CHHIFC,CHHIPC,CHARFC
     +            ,CHARLC,CHARFI,CHBOC,CHBOIS,CHFBC,CHFBIS,CHSTC,CHHIIS
     +            ,CHAXLC,CHACIS,CHACLC,CHACFC
      CHARACTER*8 CHDOAR,CHBOBO,CHFBBO,CHAFL,CHACBO
      CHARACTER*80 EDIPIC
      COMMON /HIGEDC/ TITLE,CHUSKE,CHITEM,CHDEF,CHOPST,CHOPAX,CHOPHI
     +,CCST,CCTX,CHFAC,CHPLC,CHTXC,CHPMC,CHFAIS,CHHIFC,CHHIPC,CHARFC
     +,CHARLC,CHARFI,CHBOC,CHBOIS,CHFBC,CHFBIS,CHSTC,CHHIIS,CHAXLC
     +,CHACIS,CHACLC,CHACFC,CHDOAR,CHBOBO,CHFBBO,CHAFL,CHACBO,EDIPIC
     +,CHOPPV


#endif

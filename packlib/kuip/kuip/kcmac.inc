*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:32:58  mclareni
* Initial revision
*
*
#ifndef CERNLIB_KUIP_KCMAC_INC
#define CERNLIB_KUIP_KCMAC_INC
*
*
* kcmac.inc
*
      COMMON /KCMAC/ MACTAB,NSTLEV,QUITFL,WAITFL,WAITFF,DEBTAB,SKIPFL,
     +               HEADFL,IONERF,NOEXEC
      LOGICAL MACTAB,QUITFL,WAITFL,WAITFF,DEBTAB,SKIPFL,HEADFL,NOEXEC

      PARAMETER (MAXLIN=500)
      COMMON /KCMACC/ MACBUF(MAXLIN)
      CHARACTER*80 MACBUF

      PARAMETER (MAXMAC=100,MAXLAB=100,LENSYM=48)
      COMMON /KCMEC/  NUMMAC,NUMLAB,IIIMAC
      COMMON /KCMECI/ LABADD(MAXLAB),MACUND(MAXMAC),LABADM(MAXLAB)
CCCM  COMMON /KCMECC/ MACNAM(MAXMAC),LABNAM(MAXLAB),MACPAT,AUTOEX
      COMMON /KCMECC/ MACNAM(MAXMAC),LABNAM(MAXLAB),MACPAT,AUTOEX,MACLIS
      CHARACTER*(LENSYM) MACNAM,LABNAM
CCCM  CHARACTER*80 MACPAT
      CHARACTER*80 MACPAT,MACLIS
      CHARACTER*20 AUTOEX


#endif

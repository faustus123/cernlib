*
* $Id$
*
* $Log$
* Revision 1.1  1995/10/24 10:20:54  cernlib
* Initial revision
*
*
#include "geant321/pilot.h"
*CMZ :  3.21/02 29/03/94  15.41.30  by  S.Giani
*-- Author :
      SUBROUTINE GSDVS(CHNAME,CHMOTH,STEP,IAXIS,NUMED)
C.
C.    ******************************************************************
C.    *                                                                *
C.    *    To be replaced in the future by GSDVT                       *
C.    *                                                                *
C.    ******************************************************************
C.
#include "geant321/gcunit.inc"
      CHARACTER*4 CHNAME,CHMOTH
      WRITE(CHMAIL,
     +'('' *** GSDVS: Obsolete Routine -- Call GSDVT instead'')')
      CALL GMAIL(1,0)
      WRITE(CHMAIL,
     +'(''            This code will be removed from next version'')')
      CALL GMAIL(0,1)
      CALL GSDVT(CHNAME,CHMOTH,STEP,IAXIS,NUMED,0)
      END

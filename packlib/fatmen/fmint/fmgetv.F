*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/07 15:18:08  mclareni
* Initial revision
*
*
#include "fatmen/pilot.h"
      SUBROUTINE FMGETV(LBANK,IVECT,ISTART,NWORDS,IRC)
*
*     Routine to get an INTEGER vector from the bank at LBANK
*
      DIMENSION IVECT(NWORDS)
#include "fatmen/fatbank.inc"
#include "fatmen/fatpara.inc"
#include "fatmen/fatusr.inc"
      JL = ISTART
      JR = ISTART + NWORDS - 1
      IRC = 0
*
*     Check that JL:JR is a valid range
*
      IF(JR.LT.JL) THEN
         IF(IDEBFA.GE.0) THEN
            PRINT *,'FMGETV. invalid range, end < start'
            PRINT *,'FMGETV. ISTART/IEND = ',JL,JR
         ENDIF
         IRC = 1
         RETURN
      ENDIF
 
*
*     Check that we are not outside the bank
*
      IF((JL.LE.0).OR.(JR.GT.NWDSFA)) THEN
         IF(IDEBFA.GE.0) THEN
            PRINT *,'FMGETV. attempt to read outside bank boundaries'
            PRINT *,'FMGETV. ISTART/IEND = ',JL,JR
         ENDIF
         IRC = 1
         RETURN
      ENDIF
 
      LADDR = LBANK+KOFUFA
      IF(LBANK.EQ.-1) LADDR = LADDBK + KOFUFA
 
      CALL UCOPY(IQ(LADDR+JL),IVECT,JR-JL+1)
      END

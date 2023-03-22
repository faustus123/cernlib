*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/26 17:16:15  mclareni
* Initial revision
*
*
#include "comis/pilot.h"
*CMZ :  1.11/01 24/01/91  11.36.33  by  Rene Brun
*-- Author : V.Berezhnoi
      SUBROUTINE CSTLGB(NUMGB,LENB)
***--------------------------------
*      tests length of global blocks
***--------------------------------
#include "comis/cspar.inc"
#include "comis/mdpool.inc"
#include "comis/cspnts.inc"
      IF(IQ(NUMGB+1).GT.2)THEN
        IF(IABS(IQ(NUMGB+2)).LT.LENB)THEN
          IQ(NUMGB+2)=-LENB
          IEXTGB=1
        ENDIF
      ENDIF
      END

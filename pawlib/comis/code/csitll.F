*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/26 17:16:17  mclareni
* Initial revision
*
*
#include "comis/pilot.h"
*CMZ :  1.11/01 24/01/91  11.36.36  by  Rene Brun
*-- Author : V.Berezhnoi
      INTEGER FUNCTION CSITLL(IP)
***-------------------------
#include "comis/cspar.inc"
#include "comis/mdpool.inc"
#include "comis/cspnts.inc"
      I=MHLOC(4)
      IQ(I)=0
      CALL CSRTLL(I)
      IF(IP.EQ.0)THEN
        IPLL=I
      ELSE
        IQ(IP)=I
      ENDIF
      CSITLL=I
      END

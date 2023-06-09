*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:02:49  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
      SUBROUTINE J509BD
C         SETS DEFAULT VALUES FOR PACKAGE J509, BY COPYING THEM FROM
C         A DATA AREA TO COMMON BLOCKS.   USER MAY OVERRIDE THESE VALUES
C         BY CALLING THE APPROPRIATE SUBROUTINES (NAMES,PAPER,SETUP)
      COMMON /J509C1/XBL,YBL,XUR,YUR,NX(6),NY(6),LETT1,LETT2,LINE1,LINE2
      COMMON /J509C2/CX1,CI1,CX2,CI2,CY1,CJ1,CY2,CJ2
      DATA KLETT1,KLETT2,KLINE1,KLINE2/ 12,111,2,51/
      DATA INIT/0/
      IF (INIT .GT. 0)  RETURN
      INIT = 1
      LETT1 = KLETT1
      LETT2 = KLETT2
      LINE1 = KLINE1
      LINE2 = KLINE2

      CALL VBLANK(NX,6)
      CALL VBLANK(NY,6)

      RETURN
      END

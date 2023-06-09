*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 12:01:13  mclareni
* Initial revision
*
*
#include "zbook/pilot.h"
      SUBROUTINE ZEXAM8
C
C   EXAMPLE  8:  - MANAGEMENT OF TWO DYNAMIC MEMORIES
C
      COMMON/ZCOMM/Z(1),ID1,ID2,ID3,WS(1)
      DIMENSION IZ(1000),IWS(1)
      EQUIVALENCE (IZ(1),Z(1)), (IWS(1),WS(1))
C
      COMMON//B(1),BWS(1)
      DIMENSION IB(2000),IBWS(1)
      EQUIVALENCE (B(1),IB(1)), (BWS(1),IBWS(1))
C
      COMMON/POINTS/IP1,IP2,IP3
C
C   INITIALISATION
C
      CALL ZINIT (Z,WS,1000)
      CALL ZHINIT (B,BWS,2000)
      CALL VZERO (IP1,3)
C
C   BOOKING OF BANKS
C
      CALL ZBOOK (Z,ID1,50)
      CALL ZBOOK (Z,ID2,43)
      CALL ZBOOK (Z,ID3,45)
C
      CALL ZBOOK (Z,IP1,37)
C
      CALL ZBOOK (B,IP2,33)
      CALL ZBOOK (B,IP3,29)
C
  999 RETURN
      END

*
* $Id$
*
* $Log$
* Revision 1.1  1996/01/16 17:07:46  mclareni
* Initial revision
*
*
#include "hbook/pilot.h"
*CMZ :  4.10/05 20/04/89  10.34.17  by  Rene Brun
*-- Author :
      SUBROUTINE HPTAB(IDD)
*.==========>
*.           PRINTS IDD AS A TABLE
*..=========> ( R.Brun )
#include "hbook/hcbook.inc"
#include "hbook/hcbits.inc"
#include "hbook/hcprin.inc"
      COMMON/HFORM/IFORM(128)
*.___________________________________________
      INNOT=1
      IRET=3
*
  10  CALL HLOOP(IDD,'HPTAB ',IRET)
      IF(IRET.EQ.0)GO TO 90
*
      CALL HWORK(103,IAD,'HPTAB ')
*
      IF(IAD.EQ.0)GO TO 20
      CALL HDCOFL
      IF(I230.EQ.0)GO TO 90
      LSCAT=LQ(LCID-1)
      NB=IQ(LSCAT+KNBIT)
      I2=0
      I3=1
      INNOT=0
*
      CALL HPR2(Q(IAD),IFORM(1),IFORM(108))
*
  20  IRET=2
      IF(IPONCE.NE.0.AND.I8.EQ.0)CALL SBYT(0,IQ(LCID+KBITS),1,3)
      GO TO 10
*
  90  IF(INNOT.EQ.0)GO TO 99
      IF(IAD.EQ.0)GO TO 99
      CALL HBUG('Wrong parameter','HPTAB ',IDD)
*
  99  RETURN
      END

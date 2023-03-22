*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:51  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
          DOUBLE PRECISION FUNCTION DVMPY(N,X,X2,Y,Y2)
          DOUBLE PRECISION    X(*), X2(*), Y(*), Y2(*), A, B
          DOUBLE PRECISION    SUM, MPA
          MPA(A,B,SUM)  =  A*B + SUM
          SUM  =  0.D0
          IF(N .LE. 0)  GOTO 20
#include "dxj.inc"
#include "dyj.inc"
#include "vmpa.inc"
  20      DVMPY  =  SUM
          RETURN
          END

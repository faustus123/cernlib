*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:58  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
          SUBROUTINE          DUMNA(N,U,U12,U22,Y,Y2,Z,Z2)
          DOUBLE PRECISION    U(*),U12(*),U22(*),Y(*),Y2(*),Z(*),Z2(*)
          DOUBLE PRECISION    A, B, SUM, F,SIGNF
          F(A,B,SUM)  =  -A*B + SUM
          SIGNF(A)  =  A
          IF(N .LE. 0)  RETURN
#include "dujk.inc"
#include "dyj.inc"
#include "dzi.inc"
#include "umpa.inc"

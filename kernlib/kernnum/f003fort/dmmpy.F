*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:57  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
          SUBROUTINE          DMMPY(M,N,X,X12,X21,Y,Y2,Z,Z2)
          DOUBLE PRECISION    X(*),X12(*),X21(*),Y(*),Y2(*),Z(*),Z2(*)
          DOUBLE PRECISION    A, B, SUM, ZERO, F
          F(A,B,SUM)  =  A*B + SUM
          DATA ZERO    / 0.D0 /
          IF(M .LE. 0  .OR.  N .LE. 0)  RETURN
#include "dxij.inc"
#include "dyj.inc"
#include "dzi.inc"
#include "mmpy.inc"

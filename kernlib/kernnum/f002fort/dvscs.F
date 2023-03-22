*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:52  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
          SUBROUTINE          DVSCS(N,S,X,X2,Y,Y2,Z,Z2)
          DOUBLE PRECISION    S, X(*), X2(*), Y(*), Y2(*), Z(*), Z2(*)
          DOUBLE PRECISION    ADD, A, B
          ADD(A,B)  =  S*A - B
          IF(N .LE. 0)  RETURN
#include "dxj.inc"
#include "dyj.inc"
#include "dzj.inc"
#include "vadd.inc"

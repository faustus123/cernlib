*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:51  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
          SUBROUTINE          RVSCA(N,S,X,X2,Y,Y2,Z,Z2)
          REAL                S, X(*), X2(*), Y(*), Y2(*), Z(*), Z2(*)
          REAL                ADD, A, B
          ADD(A,B)  =  S*A + B
          IF(N .LE. 0)  RETURN
#include "rxj.inc"
#include "ryj.inc"
#include "rzj.inc"
#include "vadd.inc"

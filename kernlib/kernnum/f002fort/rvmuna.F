*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:51  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
          SUBROUTINE RVMUNA(N,X,X2,Y,Y2,Z,Z2)
          REAL                X(*), X2(*), Y(*), Y2(*), Z(*), Z2(*)
          REAL                MULA, A, B, C
          MULA(A,B,C)  =  -A*B + C
          IF(N .LE. 0)  RETURN
#include "rxj.inc"
#include "ryj.inc"
#include "rzj.inc"
#include "vmula.inc"

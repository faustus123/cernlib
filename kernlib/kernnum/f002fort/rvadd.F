*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:50  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
          SUBROUTINE RVADD(N,X,X2,Y,Y2,Z,Z2)
          REAL                X(*), X2(*), Y(*), Y2(*), Z(*), Z2(*)
          REAL                ADD, A, B
          ADD(A,B)  =  A+B
          IF(N .LE. 0)  RETURN
#include "rxj.inc"
#include "ryj.inc"
#include "rzj.inc"
#include "vadd.inc"

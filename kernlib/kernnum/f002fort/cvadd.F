*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:50  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
          SUBROUTINE          CVADD(N,X,X2,Y,Y2,Z,Z2)
          COMPLEX             X(*), X2(*), Y(*), Y2(*), Z(*), Z2(*)
          COMPLEX             ADD, A, B
          ADD(A,B)  =  A+B
          IF(N .LE. 0)  RETURN
#include "cxj.inc"
#include "cyj.inc"
#include "czj.inc"
#include "vadd.inc"

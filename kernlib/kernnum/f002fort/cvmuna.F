*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:51  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
          SUBROUTINE          CVMUNA(N,X,X2,Y,Y2,Z,Z2)
          COMPLEX             X(*), X2(*), Y(*), Y2(*), Z(*), Z2(*)
          COMPLEX             MULA, A, B, C
          MULA(A,B,C)  =  -A*B + C
          IF(N .LE. 0)  RETURN
#include "cxj.inc"
#include "cyj.inc"
#include "czj.inc"
#include "vmula.inc"

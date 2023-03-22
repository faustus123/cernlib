*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:50  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
          SUBROUTINE          CVDIV(N,X,X2,Y,Y2,Z,Z2,IFAIL)
          COMPLEX             X(*), X2(*), Y(*), Y2(*), Z(*), Z2(*), T
          REALF(T)  =  AMAX1(ABS(REAL(T)),ABS(AIMAG(T)))
          IFAIL     =  0
          IF(N .LE. 0)  RETURN
#include "cxj.inc"
#include "cyj.inc"
#include "czj.inc"
#include "vdiv.inc"

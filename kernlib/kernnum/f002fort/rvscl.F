*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:51  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
          SUBROUTINE          RVSCL(N,S,X,X2,Z,Z2)
          REAL                S, X(*), X2(*), Z(*), Z2(*), FUNCT, A
          FUNCT(A)  =  S*A
          IF(N .LE. 0)  RETURN
#include "rxj.inc"
#include "rzj.inc"
#include "vcpy.inc"

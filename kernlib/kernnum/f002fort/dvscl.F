*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:51  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
          SUBROUTINE          DVSCL(N,S,X,X2,Z,Z2)
          DOUBLE PRECISION    S, X(*), X2(*), Z(*), Z2(*), FUNCT, A
          FUNCT(A)  =  S*A
          IF(N .LE. 0)  RETURN
#include "dxj.inc"
#include "dzj.inc"
#include "vcpy.inc"

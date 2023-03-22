*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:50  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
          SUBROUTINE          CVCPY(N,X,X2,Z,Z2)
          COMPLEX             X(*), X2(*), Z(*), Z2(*), FUNCT, A
          FUNCT(A)  =  A
          IF(N .LE. 0)  RETURN
#include "cxj.inc"
#include "czj.inc"
#include "vcpy.inc"

*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:52  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
          SUBROUTINE          CVXCH(N,X,X2,Y,Y2)
          COMPLEX             X(*), X2(*), Y(*), Y2(*), T
          IF(N .LE. 0)  RETURN
#include "cxj.inc"
#include "cyj.inc"
#include "vxch.inc"

*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:52  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
          SUBROUTINE          DVXCH(N,X,X2,Y,Y2)
          DOUBLE PRECISION    X(*), X2(*), Y(*), Y2(*), T
          IF(N .LE. 0)  RETURN
#include "dxj.inc"
#include "dyj.inc"
#include "vxch.inc"

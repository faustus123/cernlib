*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:52  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
          SUBROUTINE          RVXCH(N,X,X2,Y,Y2)
          REAL                X(*), X2(*), Y(*), Y2(*), T
          IF(N .LE. 0)  RETURN
#include "rxj.inc"
#include "ryj.inc"
#include "vxch.inc"

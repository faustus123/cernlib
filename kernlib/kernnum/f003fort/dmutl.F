*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:58  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
          SUBROUTINE          DMUTL(N,X,X12,X21)
          DOUBLE PRECISION    X(*), X12(*), X21(*)
          IF(N .LE. 1)  RETURN
#include "dxij.inc"
#include "mutl.inc"

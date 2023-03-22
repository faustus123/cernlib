*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:58  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
          SUBROUTINE          RMUTL(N,X,X12,X21)
          REAL                X(*), X12(*), X21(*)
          IF(N .LE. 1)  RETURN
#include "rxij.inc"
#include "mutl.inc"

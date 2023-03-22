*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:57  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
          SUBROUTINE          CMSET(M,N,S,Z,Z12,Z21)
          COMPLEX             S, Z(*), Z12(*), Z21(*)
          IF(M .LE. 0  .OR. N .LE. 0)  RETURN
#include "czij.inc"
#include "mset.inc"

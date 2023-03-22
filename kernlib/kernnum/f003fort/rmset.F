*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:57  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
          SUBROUTINE          RMSET(M,N,S,Z,Z12,Z21)
          REAL                S, Z(*), Z12(*), Z21(*)
          IF(M .LE. 0  .OR. N .LE. 0)  RETURN
#include "rzij.inc"
#include "mset.inc"

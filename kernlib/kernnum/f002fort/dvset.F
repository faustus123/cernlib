*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:52  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
          SUBROUTINE          DVSET(N,S,Z,Z2)
          DOUBLE PRECISION    S, Z(*), Z2(*)
          IF(N .LE. 0)  RETURN
#include "dzj.inc"
#include "vset.inc"

*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:42  mclareni
* Initial revision
*
*
#include "kernnumt/pilot.h"
          SUBROUTINE          RAADD(IDIM,X,Y,Z)
          REAL                X(*), Y(*), Z(*)
#include "aadd.inc"
          SUBROUTINE          DAADD(IDIM,X,Y,Z)
          DOUBLE PRECISION    X(*), Y(*), Z(*)
#include "aadd.inc"
          SUBROUTINE          CAADD(IDIM,X,Y,Z)
          COMPLEX             X(*), Y(*), Z(*)
#include "aadd.inc"

*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:43  mclareni
* Initial revision
*
*
#include "kernnumt/pilot.h"
          SUBROUTINE          RAMUL(IDIM,X,Y,Z)
          REAL                X(*), Y(*), Z(*)
#include "amul.inc"
          SUBROUTINE          DAMUL(IDIM,X,Y,Z)
          DOUBLE PRECISION    X(*), Y(*), Z(*)
#include "amul.inc"
          SUBROUTINE          CAMUL(IDIM,X,Y,Z)
          COMPLEX             X(*), Y(*), Z(*)
#include "amul.inc"

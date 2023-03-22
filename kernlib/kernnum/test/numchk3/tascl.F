*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:43  mclareni
* Initial revision
*
*
#include "kernnumt/pilot.h"
          SUBROUTINE          RASCL(IDIM,S,X,Z)
          REAL                S, X(*), Z(*)
#include "ascl.inc"
          SUBROUTINE          DASCL(IDIM,S,X,Z)
          DOUBLE PRECISION    S, X(*), Z(*)
#include "ascl.inc"
          SUBROUTINE          CASCL(IDIM,S,X,Z)
          COMPLEX             S, X(*), Z(*)
#include "ascl.inc"

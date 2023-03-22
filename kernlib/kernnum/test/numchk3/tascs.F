*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:43  mclareni
* Initial revision
*
*
#include "kernnumt/pilot.h"
          SUBROUTINE          RASCS(IDIM,S,X,Y,Z)
          REAL                S, X(*), Y(*), Z(*)
#include "ascs.inc"
          SUBROUTINE          DASCS(IDIM,S,X,Y,Z)
          DOUBLE PRECISION    S, X(*), Y(*), Z(*)
#include "ascs.inc"
          SUBROUTINE          CASCS(IDIM,S,X,Y,Z)
          COMPLEX             S, X(*), Y(*), Z(*)
#include "ascs.inc"

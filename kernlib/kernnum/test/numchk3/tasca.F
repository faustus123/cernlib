*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:43  mclareni
* Initial revision
*
*
#include "kernnumt/pilot.h"
          SUBROUTINE          RASCA(IDIM,S,X,Y,Z)
          REAL                S, X(*), Y(*), Z(*)
#include "asca.inc"
          SUBROUTINE          DASCA(IDIM,S,X,Y,Z)
          DOUBLE PRECISION    S, X(*), Y(*), Z(*)
#include "asca.inc"
          SUBROUTINE          CASCA(IDIM,S,X,Y,Z)
          COMPLEX             S, X(*), Y(*), Z(*)
#include "asca.inc"

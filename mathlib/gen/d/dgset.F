*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:02:14  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
#if defined(CERNLIB_DOUBLE)
      SUBROUTINE DGSET(A,B,N,X,W)
C
#include "gen/imp64.inc"
C
      EXTERNAL DGQUAD
      DIMENSION X(*),W(*)

      CALL D107D1(2,DGQUAD,A,B,N,X,W)
      RETURN
      END
#endif

*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:02:04  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
#if defined(CERNLIB_DOUBLE)
      FUNCTION RGAPNC(A,X)
#include "gen/def64.inc"
     +          DGAPNC,DGAGNC,D

      SROUND(D)=D+(D-SNGL(D))

      RGAPNC=SROUND(DGAPNC(DBLE(A),DBLE(X)))
      RETURN

      ENTRY RGAGNC(A,X)
      RGAGNC=SROUND(DGAGNC(DBLE(A),DBLE(X)))
      RETURN

      ENTRY GAPNC(A,X)
      GAPNC=SROUND(DGAPNC(DBLE(A),DBLE(X)))
      RETURN

      ENTRY GAGNC(A,X)
      GAGNC=SROUND(DGAGNC(DBLE(A),DBLE(X)))
      RETURN

      END
#endif

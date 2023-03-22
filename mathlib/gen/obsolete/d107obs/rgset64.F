*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:03:05  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "_gen/pilot.h"
#if defined(CERNLIB_DOUBLE)
      SUBROUTINE DGSET(A,B,N,X,W)
C
#include "imp64.inc"
C
      EXTERNAL DGQUAD
      DIMENSION X(*),W(*)

      CALL D107S1(2,DGQUAD,A,B,N,X,W)
#endif
#if !defined(CERNLIB_DOUBLE)
      SUBROUTINE RGSET(A,B,N,X,W)
      EXTERNAL RGQUAD
      DIMENSION X(*),W(*)

      CALL D107S1(2,RGQUAD,A,B,N,X,W)
#endif
      RETURN
      END

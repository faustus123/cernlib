*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:01:51  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
#if !defined(CERNLIB_DOUBLE)
      SUBROUTINE DMULLZ(A,N,MAXITR,Z0)
C
#include "gen/imp128.inc"
C
      CHARACTER*(*) NAME
      PARAMETER( NAME='DMULLZ')
      CALL MTLPRT(NAME,'C202.0','Not available on this machine')
      RETURN
      END
#endif

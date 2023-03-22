*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:02:03  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
#if !defined(CERNLIB_DOUBLE)
      SUBROUTINE DASLGF(MODE,X,MS,NL,P)
C
#include "gen/imp128.inc"
C
      CHARACTER*(*) NAME
      PARAMETER( NAME='DASLGF')
      CALL MTLPRT(NAME,'C330.0','Not available on this machine')
      RETURN
      END
#endif

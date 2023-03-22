*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:01:59  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
#if !defined(CERNLIB_DOUBLE)
      FUNCTION DPSIPG(X,K)
C
#include "gen/imp128.inc"
      CHARACTER*(*) NAME
      PARAMETER(NAME='DPSIPG')
C
      DPSIPG=0
      CALL MTLPRT(NAME,'C316.0','Not available on this machine')
      RETURN
      END
#endif

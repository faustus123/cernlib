*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:01:53  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
#if !defined(CERNLIB_DOUBLE)
      FUNCTION DGAMMF(X)
C
#include "gen/imp128.inc"
      CHARACTER*(*) NAME
      PARAMETER(NAME='DGAMMF')
C
      DGAMMF=0
      CALL MTLPRT(NAME,'C303.0','Not available on this machine')
      RETURN
      END
#endif

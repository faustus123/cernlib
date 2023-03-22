*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:02:27  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
#if defined(CERNLIB_DOUBLE)
      SUBROUTINE RCHECF(F,A,B,EPS,C,NC,DELTA)
C
      CHARACTER NAME*(*)
      PARAMETER (NAME = 'RCHECF')
      ENTRY CHECF(F,A,B,EPS,C,NC,DELTA)
      CALL MTLPRT(NAME,'E406.0','Not available on this machine')
      RETURN
      END
#endif

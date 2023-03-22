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
      SUBROUTINE DDILOG(X)
C
#include "gen/imp128.inc"
C
      CHARACTER NAME*(*)
      PARAMETER (NAME = 'DDILOG')
      CALL MTLPRT(NAME,'C304.0','Not available on this machine')
      RETURN
      END
#endif

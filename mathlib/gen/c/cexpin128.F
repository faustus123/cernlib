*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:02:05  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
#if !defined(CERNLIB_DOUBLE)
      FUNCTION WEXPIN(Z)
#include "gen/imp128.inc"
#if (!defined(CERNLIB_F90))&&(!defined(CERNLIB_DOUBLE))
      COMPLEX*16 WEXPIN
#endif
#if (defined(CERNLIB_F90))&&(!defined(CERNLIB_DOUBLE))
      COMPLEX(2) WEXPIN
#endif
#if !defined(CERNLIB_DOUBLE)
C
      CHARACTER*(*) NAME
      PARAMETER( NAME='WEXPIN')
      WEXPIN=0
      CALL MTLPRT(NAME,'C338.0','Not available on this machine')
      RETURN
      END
#endif
#endif

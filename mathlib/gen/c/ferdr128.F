*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:02:01  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
#if !defined(CERNLIB_DOUBLE)
      FUNCTION DFERDR(X,K)
#include "gen/imp128.inc"
      CHARACTER*(*) NAME
      PARAMETER( NAME ='DFERDR')
      DFERDR=0
      CALL MTLPRT(NAME1,'C323.0','Not available on this machine')
      RETURN
      END
#endif

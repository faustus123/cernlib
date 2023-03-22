*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:02:19  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
#if !defined(CERNLIB_DOUBLE)
      SUBROUTINE DMINFC(F,A,B,EPS,DELTA,X,Y,LLM)
#include "gen/imp128.inc"
      CHARACTER*(*) NAME
      PARAMETER( NAME='DMINFC')
      CALL MTLPRT(NAME,'D503.0','Not available on this machine')
      RETURN
      END
#endif

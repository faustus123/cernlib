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
      SUBROUTINE DSNLEQ(N,X,F,FTOL,XTOL,MAXF,IPRT,INFO,SUB,W)
C
#include "gen/imp128.inc"
C
      CHARACTER NAME*(*)
      PARAMETER (NAME = 'DSNLEQ')
      CALL MTLPRT(NAME,'C201.0','Not available on this machine')
      RETURN
      END
#endif

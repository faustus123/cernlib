*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:02:15  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
#if !defined(CERNLIB_DOUBLE)
      FUNCTION WGAUSS(F,A,B,EPS)
#include "gen/imp128.inc"
      COMPLEX*16 WGAUSS
      CHARACTER*(*) NAME
      PARAMETER( NAME='WGAUSS')
      WGAUSS=0
      CALL MTLPRT(NAME,'D113.0','Not available on this machine')
      RETURN
      END
#endif

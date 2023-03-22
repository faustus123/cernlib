*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:02:12  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
#if defined(CERNLIB_DOUBLE)
      FUNCTION DGAUSS(F,A,B,EPS)
#include "gen/imp64.inc"

      CHARACTER NAME*(*)
      PARAMETER (NAME = 'DGAUSS')
#include "gausscod.inc"

   99 DGAUSS=H
      RETURN
      END
#endif

*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:49:59  mclareni
* Initial revision
*
*
#include "kerngen/pilot.h"
#if defined(CERNLIB_QF_F2C)
       FUNCTION ISHFTL(IZW,NZB)
       IF (NZB .GT. 0) THEN
          ISHFTL = LSHIFT(IZW,NZB)
       ELSE IF (NZB .EQ. 0) THEN
          ISHFTL = IZW
       ELSE
          ISHFTL = ISHFT(IZW,NZB)
       END IF
       END
#endif

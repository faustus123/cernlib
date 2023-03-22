*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 12:01:11  mclareni
* Initial revision
*
*
#include "zbook/pilot.h"
#if defined(CERNLIB_IBM)||defined(CERNLIB_VAX)||defined(CERNLIB_NORD)
      SUBROUTINE ZJUMP (NAME,P1,P2,P3,P4)
      DIMENSION P1(*),P2(*),P3(*),P4(*)
      CALL NAME (P1,P2,P3,P4)
      END
#endif

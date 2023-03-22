*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/26 17:16:52  mclareni
* Initial revision
*
*
#include "comis/pilot.h"
#if defined(CERNLIB_APOLLO)
*CMZ :  1.12/05 20/03/92  16.04.19  by  Rene Brun
*-- Author : V.Berezhnoi
      DOUBLE PRECISION FUNCTION CSD01F(NAME,IAP)
      DOUBLE PRECISION NAME
      INTEGER IAP(10)
      INTEGER JARG1
      INTEGER IARG1
      POINTER/JARG1/IARG1
      JARG1=IAP(1)
      CSD01F=NAME(IARG1)
      END
#endif

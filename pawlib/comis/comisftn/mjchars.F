*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/26 17:16:47  mclareni
* Initial revision
*
*
#include "comis/pilot.h"
#if defined(CERNLIB_OLDVSUN)||defined(CERNLIB_WINNT)
*CMZ :          10/11/95  14.29.37  by  Julian Bunn
*-- Author : V.Berezhnoi
      FUNCTION MJCHAR(I)
***--------------------
*   gets byte-address
***--------------------
      MJCHAR=LOC(I)
      END
#endif

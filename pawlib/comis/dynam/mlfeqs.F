*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/26 17:16:57  mclareni
* Initial revision
*
*
#include "comis/pilot.h"
*CMZ :  1.11/01 24/01/91  11.37.02  by  Rene Brun
*-- Author : V.Berezhnoi
      FUNCTION MLFEQS(J1,N1,J2,N2)
      MLFEQS=0
      IF((J1+N1) .LE. MJFGES(J1,N1,J2,N2)) MLFEQS=1
      RETURN
      END

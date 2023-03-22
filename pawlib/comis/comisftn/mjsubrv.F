*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/26 17:16:49  mclareni
* Initial revision
*
*
#include "comis/pilot.h"
#if defined(CERNLIB_VAX)
*CMZ :  1.11/01 24/01/91  11.37.02  by  Rene Brun
*-- Author : V.Berezhnoi
      FUNCTION MJSUBR(I)
      EXTERNAL I
      MJSUBR=JUMPAD(I)
      END
#endif

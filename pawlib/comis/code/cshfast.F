*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/26 17:16:30  mclareni
* Initial revision
*
*
#include "comis/pilot.h"
#if defined(CERNLIB_PAW)
*CMZ :  1.18/00 08/02/94  17.48.37  by  Vladimir Berezhnoi
*-- Author :    Vladimir Berezhnoi   08/02/94
      SUBROUTINE CSHFAST(LINE,EXT)
#include "comis/cshfill.inc"
      JMPHFI(LINE)=JUMPAD(EXT)
      END
#endif

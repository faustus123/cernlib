*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/14 13:11:02  mclareni
* Initial revision
*
*
#if defined(CERNLIB_MSDOS)
#include "higz/pilot.h"
*CMZ :  1.14/11 29/06/92  13.49.21  by  Unknown
*-- Author : V.Fine
      SUBROUTINE CIRCI(IX,IY,IRAD)
#include "higz/grex.inc"
      IER = OPEN_ELLIPSE(IX,IY,IRAD,IRAD)
      END
#endif

*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/14 13:10:47  mclareni
* Initial revision
*
*
#if defined(CERNLIB_MSDOS)
#include "higz/pilot.h"
*CMZ :  1.14/11 29/06/92  13.58.00  by  Unknown
*-- Author : V.Fine
      SUBROUTINE MFOTRB(VAL)
#include "higz/golden.inc"
      CHARACTER*4 CWORK
      EQUIVALENCE (CWORK, WORK)
*
      WORK = VAL
      CALL MPUTBF(CWORK,4)
      END
#endif

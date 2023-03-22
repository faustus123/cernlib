*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/14 13:11:09  mclareni
* Initial revision
*
*
#include "higz/pilot.h"
#if defined(CERNLIB_ZEBRA)
*CMZ :  1.11/00 27/09/90  15.56.02  by  O.Couet
*-- Author :
      SUBROUTINE IZINCF(INC)
*.===========>
*.
*.   Increments the (F) bank pointer .
*.
*. _Input parameters:
*.
*.  INTEGER INC : Increment .
*.
*..==========> (O.Couet)
#include "higz/hipaw.inc"
*.______________________________________
*
      IFLPTR=IFLPTR+INC
      IQ(LPICT+3)=IFLPTR
*
      END
#endif

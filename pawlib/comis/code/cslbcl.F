*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/26 17:16:24  mclareni
* Initial revision
*
*
#include "comis/pilot.h"
*CMZ :  1.13/00 27/03/92  15.51.08  by  Rene Brun
*-- Author : V.Berezhnoi
      SUBROUTINE CSLBCL
************************
*                      *
*   CLOSE THE LIBRARY  *
*                      *
************************
#include "comis/cslun.inc"
      COMMON /CSLBRW/ LIBIND,LIBST,LEOF,LIBRD,LIBTXT
*
#if defined(CERNLIB_VAX)
      CALL LBR$CLOSE(LIBIND)
      ISTLIB=0
#endif
      END

*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/26 17:16:24  mclareni
* Initial revision
*
*
#include "comis/pilot.h"
*CMZ :  1.11/01 24/01/91  11.37.00  by  Rene Brun
*-- Author : V.Berezhnoi
      INTEGER FUNCTION CSLPAR(N)
***---------------------
#include "comis/cswpar.inc"
      CALL CSXPAR(N)
      CSLPAR=NCHP
      END

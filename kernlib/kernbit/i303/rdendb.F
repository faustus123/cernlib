*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:47:45  mclareni
* Initial revision
*
*
#include "kernbit/pilot.h"
      LOGICAL FUNCTION RDENDB()
#include "i303cd.inc"
      RDENDB=.FALSE.
      IF (IBPTR .GT. 80) RDENDB=.TRUE.
      RETURN
      END

*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:51:16  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "pilot.h"
      LOGICAL FUNCTION XRDIN (LUN)
 
C CERN PROGLIB# Z200    XRDIN           .VERSION KERNCDC  0.1   750926
 
      XRDIN=.FALSE.
      IF (IOCHEC(LUN)) 15,25
   15 XRDIN=.TRUE.
   25 RETURN
      END

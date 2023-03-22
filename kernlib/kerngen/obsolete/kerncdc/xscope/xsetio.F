*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:51:17  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "pilot.h"
      SUBROUTINE XSETIO
 
C CERN PROGLIB# Z200    XSETIO          .VERSION KERNCDC  0.1   750926
 
      EXTERNAL ER89
 
      CALL SETERR (89,ER89)
      RETURN
      END

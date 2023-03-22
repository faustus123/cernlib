*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:44:18  mclareni
* Initial revision
*
*
#include "cspack/pilot.h"
      SUBROUTINE RCLOSE
*
*           To stop a communication with a remote computer
*
#include "cspack/czsock.inc"
*
*=========================================================
      IF(ISKIN.GE.0)THEN
         CALL CZCLOS(ISTAT)
         ISKIN=-1
      ENDIF
*
  99  END
 

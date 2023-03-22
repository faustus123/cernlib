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
      LOGICAL FUNCTION XILLEG (LUN)
 
C CERN PROGLIB# Z200    XILLEG          .VERSION KERNCDC  0.1   750926
 
      COMMON/ERFLG/IF78
      LOGICAL IF78
 
      XILLEG=IF78
      IF78=.FALSE.
      RETURN
      END

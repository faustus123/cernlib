*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:52:13  mclareni
* Initial revision
*
*
*     CFIO not ready for -p8
#include "sys/CERNLIB_machine.h"
#include "pilot.h"
      SUBROUTINE CFCLOS
           ENTRY CFGET
           ENTRY CFOPEI
           ENTRY CFPUT
           ENTRY CFREW
           ENTRY CFSEEK
           ENTRY CFSIZE
           ENTRY CFTELL

      PRINT 9009
 9009 FORMAT(/' ********  CFIO is not ready for -p8  **********'/)

      CALL ABEND
      END

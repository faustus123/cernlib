*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:47:43  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "_kernbit/pilot.h"
#if defined(CERNLIB_IBMMVS)
      SUBROUTINE GETENVF(CHENV,CHVAL)
*     Dummy version for systems without environmental variables
      COMMON/SLATE/IS(40)
      CHARACTER*(*)  CHENV,CHVAL
      CHVAL = ' '
      IS(1) = 0
      END
#endif

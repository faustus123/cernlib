*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:50:25  mclareni
* Initial revision
*
*
#include "kerngen/pilot.h"
      LOGICAL FUNCTION IFBATCH(DUMMY)
C
C CERN PROGLIB# Z044    IFBATCH         .VERSION KERNVAX  2.44  931108
C ORIG. 30/06/93  Jamie Shiers
C
      INTEGER STATUS
      INCLUDE '($JPIDEF)'

      STATUS = LIB$GETJPI(JPI$_MODE,,,MODE,,%REF(LMODE))
      IF(.NOT.STATUS) CALL LIB$SIGNAL(%VAL(STATUS))

      IFBATCH=MODE.EQ.2
      END

*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:47:45  mclareni
* Initial revision
*
*
#include "kernbit/pilot.h"
      LOGICAL FUNCTION RALPH()
#include "i303cd.inc"
      CHARACTER LWCASE*26, UPCASE*26
C*NS  CHARACTER*1 CHAR
      DATA LWCASE/'abcdefghijklmnopqrstuvwxyz'/
      DATA UPCASE/'ABCDEFGHIJKLMNOPQRSTUVWXYZ'/
      RALPH=.FALSE.
      IF((INDEX(LWCASE,CURNT).GT.0).OR.(INDEX(UPCASE,CURNT).GT.0))THEN
         RALPH=.TRUE.
      ENDIF
      RETURN
      END

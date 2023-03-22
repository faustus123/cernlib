*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:47:48  mclareni
* Initial revision
*
*
#include "kernbit/pilot.h"
      FUNCTION INDEXN(STRING)
C
C CERN PROGLIB# M433    INDEXN          .VERSION KERNFOR  4.14  860211
C ORIG. 26/03/86 M.GOOSSENS/DD
C
C-    Find the first numeric character in a string
C
      CHARACTER*(*) STRING
C
      CHARACTER*(*) CNUM
      PARAMETER (CNUM='0123456789')
C
      DO 10 I=1,LEN(STRING)
         IF (INDEX(CNUM,STRING(I:I)).NE.0) THEN
              INDEXN = I
              GO TO 999
          ENDIF
10    CONTINUE
      INDEXN = 0
  999 END

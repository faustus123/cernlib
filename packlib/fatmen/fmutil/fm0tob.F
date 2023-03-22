*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/07 15:18:19  mclareni
* Initial revision
*
*
#include "fatmen/pilot.h"
      SUBROUTINE FM0TOB(STRING)
*
*     Convert zero bytes in a character string to character blanks
*
*
      CHARACTER*(*) STRING
 
      DO 10 J=1,LEN(STRING)
         IF ( ICHAR(STRING(J:J)) .EQ. 0 ) STRING(J:J)=' '
   10 CONTINUE
      END

*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:47:45  mclareni
* Initial revision
*
*
#include "kernbit/pilot.h"
      CHARACTER*1 FUNCTION RDUPCH(CHAR)
C** TO CONVERT A CHARACTER TO UPPER CASE
C*******************************************************************
      CHARACTER*1 CHAR
      CHARACTER LWCASE*26, UPCASE*26
      DATA LWCASE/'abcdefghijklmnopqrstuvwxyz'/
      DATA UPCASE/'ABCDEFGHIJKLMNOPQRSTUVWXYZ'/
      I=INDEX(LWCASE,CHAR)
      RDUPCH=CHAR
      IF (I .GT. 0) RDUPCH=UPCASE(I:I)
      RETURN
      END

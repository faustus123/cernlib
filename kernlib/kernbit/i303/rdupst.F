*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:47:45  mclareni
* Initial revision
*
*
#include "kernbit/pilot.h"
      SUBROUTINE RDUPST(STRING)
C** TO CONVERT A STRING TO UPPER CASE
C*******************************************************************
      CHARACTER*(*) STRING
      CHARACTER*1 RDUPCH
      L=LEN(STRING)
      DO 1 I=1,L
         STRING(I:I)=RDUPCH(STRING(I:I))
    1 CONTINUE
      RETURN
      END

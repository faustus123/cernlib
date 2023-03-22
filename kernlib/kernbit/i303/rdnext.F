*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:47:45  mclareni
* Initial revision
*
*
#include "kernbit/pilot.h"
      SUBROUTINE RDNEXT
C READ NEXT CHARACTER INTO CURNT AND ADJUST THE POINTER IBPTR
C********************************************************************
#include "i303cd.inc"

      IBPTR=IBPTR+1
      IF (IBPTR .LE.80) THEN
         CURNT=BUFFER(IBPTR:IBPTR)
      ELSE
         CURNT=' '
      ENDIF
      RETURN
      END

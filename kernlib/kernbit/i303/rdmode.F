*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:47:45  mclareni
* Initial revision
*
*
#include "kernbit/pilot.h"
      SUBROUTINE RDMODE(I)
C  TO CHANGE MODE OF WORK OF RDNAME.
C  CALL TO RDMODE(2) WILL FORCE RDNAME READ AS WHOLE NAMES SETS OF
C  ALPHANUMERIC CHARACTERS, SUCH AS ALPHA99.
C  THE USUAL MODE (PURELY ALPHABETIC NAMES) WILL BE RESTORED BY A
C  CALL RDMODE(1)
C********************************************************************
#include "i303cd.inc"
      MODE=I
      END

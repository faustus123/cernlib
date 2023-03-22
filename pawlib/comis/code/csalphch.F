*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/26 17:16:30  mclareni
* Initial revision
*
*
#include "comis/pilot.h"
*CMZ :          14/04/95  15.18.52  by  Vladimir Berezhnoi
*-- Author :    Vladimir Berezhnoi   09/12/93
      LOGICAL FUNCTION CSALPHCH(CH)
      CHARACTER *1 CH
#include "comis/csichv.inc"
      ICH=ICHAR(CH)
      CSALPHCH=.FALSE.
      IF( ICH .GE. ICHLA .AND. ICH .LE. ICHLZ
     + .OR.
     +    CH .GE. 'a' .AND. CH .LE. 'z'
     + .OR.
     +   ICH .EQ. ICHSUSC                 ) CSALPHCH=.TRUE.
      END

*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/26 17:16:30  mclareni
* Initial revision
*
*
#include "comis/pilot.h"
*CMZ :  1.18/00 10/02/94  16.21.44  by  Vladimir Berezhnoi
*-- Author :    Vladimir Berezhnoi   09/12/93
      LOGICAL FUNCTION ANUMCH(CH)
      CHARACTER *1 CH
      ANUMCH=.FALSE.
      IF( CH .GE. 'A' .AND. CH .LE. 'Z'
     + .OR.
     +    CH .GE. 'a' .AND. CH .LE. 'z'
     + .OR.
     +    CH .EQ. '_'
     + .OR.
     +    CH .GE. '0' .AND. CH .LE. '9'
     +                                 ) ANUMCH=.TRUE.
      END

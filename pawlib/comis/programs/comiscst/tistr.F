*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/26 17:16:39  mclareni
* Initial revision
*
*
#include "comis/pilot.h"
*CMZ :  1.11/01 24/01/91  11.37.05  by  Rene Brun
*-- Author : V.Berezhnoi
      SUBROUTINE TISTR(STR)
*   OUTPUT THE STRING TO TERMINAL
      CHARACTER*(*) STR
      CALL LIB$PUT_OUTPUT(STR)
      RETURN
      END

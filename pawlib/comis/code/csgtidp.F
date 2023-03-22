*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/26 17:16:28  mclareni
* Initial revision
*
*
#include "comis/pilot.h"
*CMZU:  1.16/16 30/09/93  17.24.52  by  Vladimir Berezhnoi
*-- Author : V.Berezhnoi
      SUBROUTINE CSGTIDP(IND,NAME,NC)
***--------------------------------------
      CHARACTER *(*)NAME
#include "comis/cstabps.inc"
      CALL CSGTID(IND,KSIDP,NAME,NC)
      END

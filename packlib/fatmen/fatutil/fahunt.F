*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/07 15:18:06  mclareni
* Initial revision
*
*
#include "fatmen/pilot.h"
      SUBROUTINE FAHUNT(GENAM,KEYS,IRC)
*CMZ :          12/11/91  08.58.44  by  Jamie Shiers
*-- Author :    Jamie Shiers   12/11/91
      CHARACTER*(*) GENAM
#include "fatmen/fahucm.inc"
      DIMENSION     KEYS(LKEYFA)
 
      LGN = LENOCC(GENAM)
      CHFILE = GENAM(1:LGN)
      CALL UCOPY(KEYS,KEYH,LKEYFA)
 
      IRC = 1
 
      END

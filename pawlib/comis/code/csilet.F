*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/26 17:16:17  mclareni
* Initial revision
*
*
#include "comis/pilot.h"
*CMZ :  1.18/00 16/02/94  15.17.31  by  Vladimir Berezhnoi
*-- Author : V.Berezhnoi
      INTEGER FUNCTION CSILET(MLETTE)
***--------------------------
*     ? MLETTE is letter ?
***--------------------------
#include "comis/csichv.inc"
      CHARACTER LCH*1
      LCH=CHAR(MLETTE)
      CSILET=INDEX('ABCDEFGHIJKLMNOPQRSTUVWXYZ_',LCH)
      END

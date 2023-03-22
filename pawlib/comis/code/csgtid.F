*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/26 17:16:28  mclareni
* Initial revision
*
*
#include "comis/pilot.h"
*CMZU:  1.16/16 30/09/93  17.11.45  by  Vladimir Berezhnoi
*-- Author : V.Berezhnoi
      SUBROUTINE CSGTID(IND,KOFFS,NAME,NC)
***--------------------------------------
      CHARACTER *(*)NAME
#include "comis/cspar.inc"
#include "comis/mdpool.inc"
      NN=IQ(IND+1)
      N=LEN(NAME)
      NAME=' '
      NC=MIN(NN,N)
      CALL UHTOC(IQ(IND+KOFFS),4,NAME,NC)
      END

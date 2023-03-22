*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/26 17:16:30  mclareni
* Initial revision
*
*
#include "comis/pilot.h"
*CMZ :  1.18/00 18/01/94  08.54.47  by  Vladimir Berezhnoi
*-- Author :    Vladimir Berezhnoi   15/12/93
      SUBROUTINE CSLFRE(IND)
      COMMON/MDPOOL/IQ(1000)
 1    IF(IND.EQ.0)RETURN
      I=IQ(IND)
      CALL MHFREE(IND)
      IND=I
      GO TO 1
      END

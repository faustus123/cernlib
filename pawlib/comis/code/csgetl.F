*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/26 17:16:29  mclareni
* Initial revision
*
*
#include "comis/pilot.h"
*CMZ :  1.17/07 15/12/93  18.00.06  by  Vladimir Berezhnoi
*-- Author :    Vladimir Berezhnoi   15/12/93
      SUBROUTINE CSGETL(IND,LINE,NCH,MARK)
      CHARACTER *(*)LINE
      COMMON/MDPOOL/IQ(1000)
      LINE=' '
      IF(IND.LE.0)RETURN
      MARK=IQ(IND+1)
      NCH=IQ(IND+2)
      CALL UHTOC(IQ(IND+3),4,LINE,NCH)
      IND=IQ(IND)
      END

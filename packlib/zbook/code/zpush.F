*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 12:01:12  mclareni
* Initial revision
*
*
#include "zbook/pilot.h"
      SUBROUTINE ZPUSH(IZ,ID,NDP)
C
C     ******************************************************************
C     *                                                                *
C     *       PUSH DATA BANK ID BY NDP WORDS                           *
C     *                                                                *
C     ******************************************************************
C
      DIMENSION IZ(1),ID(1)
C
C     ------------------------------------------------------------------
C
      JZ     = IZ(1)
      IZ(JZ + 17) = 1
      CALL ZPUSHS(IZ,ID,NDP,0)
      RETURN
      END

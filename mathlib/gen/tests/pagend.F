*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:01:11  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
      SUBROUTINE PAGEND(CODE)
C     This subroutine prints a page end message
      CHARACTER*(*) CODE
#include "iorc.inc"
                    WRITE(LOUT,1001) CODE
      RETURN
1001  FORMAT(/26X,30('*')/26X,'**   End of Test of  ',A,3X,'**'/
     +       26X,30('*'))
      END

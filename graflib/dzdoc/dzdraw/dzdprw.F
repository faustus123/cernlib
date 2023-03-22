*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/04 16:13:16  mclareni
* Initial revision
*
*
#include "dzdoc/pilot.h"
 
       SUBROUTINE DZDPRW(LUC,NW)
       WRITE(LUC,'(A)')
     & ' WARNING: # of docd words doesnt match # of data,'
       IF(ABS(NW).NE.1000000)THEN
          WRITE(LUC,'(A,I5)')
     &    ' Assume length of rep section is:',ABS(NW)
       ELSE
          WRITE(LUC,'(A)')' cant resolve it'
      ENDIF
      END
*********************************************************************

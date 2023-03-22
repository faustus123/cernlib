*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/04 16:13:05  mclareni
* Initial revision
*
*
#include "dzdoc/pilot.h"
      SUBROUTINE DZDCDI
*      IMPLICIT NONE
*     change cwd
      INTEGER NCH
      CHARACTER*128 CWDINT
      CALL KUGETS(CWDINT,NCH)
      IF(NCH.EQ.0)THEN
         CALL RZCDIR(CWDINT, 'R')
         WRITE(*,*)'Cwd: ',CWDINT
      ELSE
         IF     (CWDINT(1:8).EQ.'//RzDir/')THEN
            CALL RZCDIR('//'//CWDINT(9:), ' ')
         ELSE IF(CWDINT(1:2).EQ.'//')THEN
            CALL RZCDIR(CWDINT, ' ')
         ELSE IF(CWDINT(1:1).EQ.'/')THEN
            CALL RZCDIR('/'//CWDINT, ' ')
         ELSE
            CALL RZCDIR('//'//CWDINT, ' ')
         ENDIF
      ENDIF
      RETURN
      END
***********************************************************************

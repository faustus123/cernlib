*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/07 15:17:46  mclareni
* Initial revision
*
*
#include "fatmen/pilot.h"
      PROGRAM FMSTAT
* lee en oracle en nonmbre de todos los experimento y les aplica growth.
      INTEGER   A
      INTEGER   B
      INTEGER   C
      CHARACTER*20 UID
      CHARACTER*20 PWD
      EXEC SQL BEGIN DECLARE SECTION
      CHARACTER*8 VECTOR
      EXEC SQL END DECLARE SECTION
      EXEC SQL INCLUDE SQLCA
      EXEC SQL WHENEVER SQLERROR GOTO 200
      A = 0
      B = 0
      C = 0
      CALL FMLOGI(IRC)
      EXEC SQL DECLARE C1 CURSOR FOR SELECT EXPERIMENT FROM FATMEN
      EXEC SQL OPEN C1
      EXEC SQL WHENEVER NOT FOUND GOTO 150
100   CONTINUE
      EXEC SQL FETCH C1 INTO :VECTOR
      CALL FMSIZE(VECTOR, A, B, C)
      EXEC SQL WHENEVER SQLERROR GOTO 200
*     CALL VMCMS('CP SLEEP 3 SEC', IRC)
      GO TO 100
150   CONTINUE
      EXEC SQL CLOSE C1
      EXEC SQL COMMIT WORK RELEASE
200   CONTINUE
      WRITE(6,210) (SQLEMC(I),I=1,70)
210   FORMAT(/,1X,70A1,/)
      EXEC SQL WHENEVER SQLERROR CONTINUE
      EXEC SQL ROLLBACK WORK RELEASE
      STOP
      END

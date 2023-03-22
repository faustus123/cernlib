*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/04 16:13:01  mclareni
* Initial revision
*
*
#include "dzdoc/pilot.h"
      SUBROUTINE  DZDUDD(CHFILE)
      CHARACTER*(*) CHFILE
      INTEGER IRET
#include "dzdzbrinc.inc"
      CALL DZDOR1('U',IRET)
      IF(IRET.NE.0)GOTO 999
      CALL DZDURZ(LPDOCS,LPDOCB,CHFILE,' ',' ',IRET)
      CALL RZCDIR(CTDDOC,' ')
      CALL RZSAVE
      CALL DZDOR1('R',IRET)
999   END
*********************************************************************

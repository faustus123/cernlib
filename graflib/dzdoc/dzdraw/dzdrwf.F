*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/04 16:13:04  mclareni
* Initial revision
*
*
#include "dzdoc/pilot.h"
      SUBROUTINE DZDRWF
*      IMPLICIT NONE
      INTEGER NCH, LUN
      CHARACTER*4 CHLUN
 
      CALL KUGETC(CHLUN,NCH)
      IF(NCH.LE.0)GOTO 999
      CALL DZDCTI(CHLUN,LUN)
      CALL FZENDI(LUN,'I')
999   END
***********************************************************************

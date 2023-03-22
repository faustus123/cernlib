*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/04 16:13:22  mclareni
* Initial revision
*
*
#include "dzdoc/pilot.h"
      SUBROUTINE DZECHF
#include "dzeditkeep.inc"
      LUNCOM=LUPCOM
      CALL KUOPEN(LUNCOM,CHCOMP,'OLD',ISTAT)
      IF(ISTAT.NE.0)THEN
         WRITE(LUNOUT,*)' Error opening ',CHCOMP
      ELSE
         CALL DZECHK
      ENDIF
      END
***********************************************************************

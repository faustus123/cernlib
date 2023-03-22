*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/04 16:13:20  mclareni
* Initial revision
*
*
#include "dzdoc/pilot.h"
      SUBROUTINE DZEDRZ
 
*     list directory of RZ-file
#include "dzeditkeep.inc"
 
      IF(LUNRZ.EQ.0)THEN
         WRITE(LUNOUT,*)' No RZ-file open'
      ELSE
         CALL RZLDIR(' ',' ')
      ENDIF
      CONTINUE
      END
 
***********************************************************************
 

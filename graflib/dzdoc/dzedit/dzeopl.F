*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/04 16:13:20  mclareni
* Initial revision
*
*
#include "dzdoc/pilot.h"
      SUBROUTINE DZEOPL
*     open RZ file
#include "dzeditkeep.inc"
      CHARACTER*4 CHOOPT
      CALL KUGETS(CHRZF,NCHA)
      CALL KUGETC(CHOOPT,NCHA)
      CALL DZEOP1(CHOOPT,ISTAT)
      END
 
**********************************************************************
 

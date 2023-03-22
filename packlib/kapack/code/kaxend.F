*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 11:40:51  mclareni
* Initial revision
*
*
#include "kapack/pilot.h"
      SUBROUTINE KAXEND
*
*.....ABANDON PROCESSING
*
#include "kapack/kax000.inc"
#include "kapack/kax020.inc"
*
*-----------------------------------------------------------------------
*
      CALL KAXMSG(LUNERR,'CRNKA999 KAXEND: PROCESSING TERMINATED OWING
     +                    TO THE ABOVE CONDITION')
*
      CALL KASTOP
*
      STOP 999
*
      END

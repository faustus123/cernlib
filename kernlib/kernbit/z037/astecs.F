*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:47:51  mclareni
* Initial revision
*
*
#include "kernbit/pilot.h"
       SUBROUTINE ASTECS
*-----------------------------------------------------------------------
*   ASTECS - Ends critical section in which no stack unwind may occur
*   AUTHOR : Carlo Mekenkamp /Leiden (MEKENKAM@HLERUL5)
*   SIDE EFFECTS: ASTCS = .FALSE.,
*                  IF ASTIP THEN SIGNAL SS$_CONTROLC
*   CREATION DATE:   10-MAR-1988
*-----------------------------------------------------------------------
#include "astcom.inc"
       INCLUDE '($LIBDEF)/NOLIST'
       INCLUDE '($SSDEF)/NOLIST'
       INCLUDE '($STSDEF)/NOLIST'
       ASTCS = .FALSE.
       IF(ASTIP)THEN
            ASTIP=.FALSE.
            CALL LIB$SIGNAL(%VAL(IOR(IAND(-(STS$M_SEVERITY+1),
     -           SS$_CONTROLC),STS$K_ERROR)))
       ENDIF
       END

*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:47:51  mclareni
* Initial revision
*
*
#include "kernbit/pilot.h"
       SUBROUTINE ASTSCS
*-----------------------------------------------------------------------
*   ASTSCS - Starts critical section in which no stack unwind may occur
*   AUTHOR : Carlo Mekenkamp /Leiden (MEKENKAM@HLERUL5)
*   SIDE EFFECTS: ASTCS = .TRUE.
*   CREATION DATE: 10-MAR-1988
*-----------------------------------------------------------------------
#include "astcom.inc"
       ASTCS = .TRUE.
       END

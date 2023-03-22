*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:47:51  mclareni
* Initial revision
*
*
#include "kernbit/pilot.h"
       SUBROUTINE ASTINT
*-----------------------------------------------------------------------
*   ASTINT - Initialisation Control C AST Routines
*   AUTHOR : Carlo Mekenkamp /Leiden (MEKENKAM@HLERUL5)
*   SIDE EFFECTS: Initialize ASTCS and ASTIP to .FALSE.,
*                  Assign a channel to the terminal,
*                  Enable control-C AST.
*   CREATION DATE: 10-MAR-1988
*-----------------------------------------------------------------------
#include "astcom.inc"
       INCLUDE '($SYSSRVNAM)/NOLIST'
       ASTCS = .FALSE.
       ASTIP = .FALSE.
       CALL SYS$ASSIGN('TT',CHAN,,)
       CALL ASTECC
       END

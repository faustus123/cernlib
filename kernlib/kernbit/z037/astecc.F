*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:47:51  mclareni
* Initial revision
*
*
#include "kernbit/pilot.h"
       SUBROUTINE ASTECC
*-----------------------------------------------------------------------
*   ASTECC - Enables Control C AST
*   AUTHOR : Carlo Mekenkamp /Leiden (MEKENKAM@HLERUL5)
*   SIDE EFFECTS: Queues a control-C-AST to CHAN.
*   CREATION DATE: 10-MAR-1988
*-----------------------------------------------------------------------
#include "astcom.inc"
       EXTERNAL ASTCCA
       INCLUDE '($SYSSRVNAM)/NOLIST'
       INCLUDE '($IODEF)/NOLIST'
       CALL SYS$QIOW(,%VAL(CHAN),%VAL(IOR(IO$_SETMODE,IO$M_CTRLCAST)),
     -      ,,,ASTCCA,,,,,)
       END

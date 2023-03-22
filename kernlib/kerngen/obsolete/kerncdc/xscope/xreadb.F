*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:51:16  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "pilot.h"
      SUBROUTINE XREADB (LUN,MV,N)
 
C CERN PROGLIB# Z200    XREADB          .VERSION KERNCDC  1.05  780503
 
C-    ROUTINE TO READ 1 BINARY RECORD,  29/04/78  JZ
 
      DIMENSION    MV(N)
 
 
      READ (LUN) MV
      RETURN
      END

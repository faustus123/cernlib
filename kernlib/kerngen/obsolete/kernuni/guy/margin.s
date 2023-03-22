*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:53:59  mclareni
* Initial revision
*
*
. **************************************
.
.     SUBROUTINE MARGIN( TEXT, LTEXT )
.     TRANSMITS A  PRINT  CONTROL  IMAGE TO  EXEC
.
. **************************************
 
          AXR$
          FORT$
$(1)
MARGIN*
#include "ftnors1.inc"
#include "spyuse.inc"
* Ignoring t=pass
          DL        A0,0,XARG
          LXI       A0,0,A1            . LTEXT, LOC(TEXT)
 DO FOR , ER        PRTCN$
 DO FTN , ER        APRTCN$
          J         RETUR2
          END

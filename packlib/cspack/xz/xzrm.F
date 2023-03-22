*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:44:31  mclareni
* Initial revision
*
*
#include "cspack/pilot.h"
      SUBROUTINE XZRM(FILE,IRC)
#include "cspack/czsock.inc"
#include "cspack/hcmail.inc"
#include "cspack/quest.inc"
      CHARACTER*80  CHMESS
      CHARACTER*(*) FILE
*
#include "cspack/czopen.inc"
      LF     = LENOCC(FILE)
*
      CHMAIL = 'XZIO :RM  '//FILE(1:LF)
      CALL CZPUTA(CHMAIL,ISTAT)
#include "cspack/czmess.inc"
  99  END
 

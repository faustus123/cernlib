*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:44:28  mclareni
* Initial revision
*
*
#include "cspack/pilot.h"
      SUBROUTINE XZCD(PATH,IRC)
#include "cspack/czsock.inc"
#include "cspack/hcmail.inc"
#include "cspack/quest.inc"
      CHARACTER*(*) PATH
*
      IRC    = 0
      LPATH  = LENOCC(PATH)
*
      CHMAIL = 'XZIO :CD  '//PATH(1:LPATH)
      CALL CZPUTA(CHMAIL,ISTAT)
#include "cspack/czmess.inc"
  99  END
 

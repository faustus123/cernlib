*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:44:18  mclareni
* Initial revision
*
*
#include "cspack/pilot.h"
      SUBROUTINE ZFTPRM
#include "cspack/czsock.inc"
#include "cspack/hcmail.inc"
#include "cspack/quest.inc"
      CHARACTER*80 CHMESS
      CHARACTER*80 PATH
*
#include "cspack/czopen.inc"
      CALL KUGETC(PATH,LPATH)
*
      CHMAIL = 'XZIO :RM  '//PATH(1:LPATH)
      CALL CZPUTA(CHMAIL,ISTAT)
#include "cspack/czmess.inc"
  99  END
 

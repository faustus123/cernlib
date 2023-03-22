*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:44:31  mclareni
* Initial revision
*
*
#include "cspack/pilot.h"
      SUBROUTINE XZRSYS
*-- Author :    Jamie Shiers   17/07/91
*     Print remote O/S
#include "cspack/czsock.inc"
#include "cspack/hcmail.inc"
#include "cspack/quest.inc"
#include "cspack/czopen.inc"
      CHMAIL = 'XZIO :RSYS'
      PRINT *,'Remote operating system:'
      CALL CZPUTA(CHMAIL,ISTAT)
#include "cspack/czmess.inc"
99    END

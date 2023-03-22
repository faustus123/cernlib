*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/26 17:16:31  mclareni
* Initial revision
*
*
#include "comis/pilot.h"
*CMZ :  1.18/14 29/09/94  16.48.44  by  Vladimir Berezhnoi
*-- Author : V.Berezhnoi
      SUBROUTINE CSRMCL(IPADDR)
***------------------------------------
*    Try add var to list of used
***------------------------------------
#include "comis/cspar.inc"
#include "comis/mdpool.inc"
#include "comis/cstab.inc"
#include "comis/cscbwl.inc"
*
      I=LISTCL
*
*-  element=( next, listcl, address )
*
   10 IF(I.EQ.0)RETURN
      IF(IQ(I+2).EQ.IPADDR)THEN
        CALL CSRMCLL(IQ(I+1))
      ELSE
        I=IQ(I)
        GO TO 10
      ENDIF
      END

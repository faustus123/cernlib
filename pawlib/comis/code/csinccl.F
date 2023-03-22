*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/26 17:16:31  mclareni
* Initial revision
*
*
#include "comis/pilot.h"
*CMZ :  1.18/14 29/09/94  16.48.11  by  Vladimir Berezhnoi
*-- Author : V.Berezhnoi
      SUBROUTINE CSINCCL(IPADDR,LSTCL)
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
   10 IF(I.EQ.0)THEN
        IND=MHLOC(3)
        IQ(IND)=LISTCL
        IQ(IND+1)=LSTCL
        IQ(IND+2)=IPADDR
        LISTCL=IND
      ELSEIF(IQ(I+2).EQ.IPADDR)THEN
        CALL CSRMCLL(IQ(I+1))
        IQ(I+1)=LSTCL
      ELSE
        I=IQ(I)
        GO TO 10
      ENDIF
      END

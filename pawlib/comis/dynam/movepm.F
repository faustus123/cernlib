*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/26 17:16:58  mclareni
* Initial revision
*
*
#include "comis/pilot.h"
*CMZ :  1.11/01 24/01/91  11.37.02  by  Rene Brun
*-- Author : V.Berezhnoi
      SUBROUTINE MOVEPM(IPAG,IADR,IBUF,N)
      CALL COPYPM(IPAG,IADR,IBUF,N)
      IADR=IADR+N
      RETURN
      END

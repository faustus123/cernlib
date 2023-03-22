*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/14 13:10:40  mclareni
* Initial revision
*
*
#include "higz/pilot.h"
*CMZ :  1.14/09 25/05/92  17.37.57  by  O.Couet
*-- Author :    O.Couet   25/05/92
      SUBROUTINE IPMID(N,X,Y,LEVEL,ID)
*.===========>
*.
*..==========> (O.Couet)
#include "higz/hiflag.inc"
      DIMENSION X(*),Y(*),ID(*)
*.______________________________________
*
      CALL IPM(N,X,Y)
      IF(ZFLAG)CALL IGADID(LEVEL,N,ID)
*
      END

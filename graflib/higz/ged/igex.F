*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/14 13:10:23  mclareni
* Initial revision
*
*
#include "higz/pilot.h"
*CMZ :  1.06/03 16/12/88  14.00.46  by  O.Couet
*-- Author : O.Couet
      SUBROUTINE IGEX(X1,X2)
*.===========>
*.
*.   This routine exchange X1 and X2 in order than X2 > X1 .
*.
*..==========> (O.Couet)
      IF(X2.LT.X1)THEN
         XT=X2
         X2=X1
         X1=XT
      ENDIF
*
      END

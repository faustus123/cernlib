*
* $Id$
*
* $Log$
* Revision 1.1  1996/01/16 17:07:38  mclareni
* Initial revision
*
*
#include "hbook/pilot.h"
*CMZ :  4.10/05 21/02/89  16.14.49  by  Rene Brun
*-- Author :
      SUBROUTINE HIDALL(IDVECT,N)
*.==========>
*.           RETURN IN IDVECT LIST OF ALL IDS
*..=========> ( R.Brun )
#include "hbook/hcbook.inc"
      DIMENSION IDVECT(1)
*.___________________________________________
      N=IQ(LCDIR+KNRH)
      DO 10 I=1,N
         IDVECT(I)=IQ(LTAB+I)
  10  CONTINUE
      END

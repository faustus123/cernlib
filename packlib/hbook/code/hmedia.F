*
* $Id$
*
* $Log$
* Revision 1.1  1996/01/16 17:07:42  mclareni
* Initial revision
*
*
#include "hbook/pilot.h"
*CMZ :  4.10/05 21/02/89  16.14.50  by  Rene Brun
*-- Author :
      FUNCTION HMEDIA(X,N)
*.==========>
*.           RETURN THE MEDIAN ELEMENT OF THE N ELEMENTS OF ARRAY X
*.           EG.  X= 25,1,18,7,3  THEN HMEDIA=7
*..=========> ( R.Brun )
      DIMENSION X(1)
*.___________________________________________
      IN=3
      IMAX=LVMAX(X,N)
      XM=X(IMAX)
  10  IMIN=LVMIN(X,N)
      X(IMIN)=XM
      IN=IN+1
      IF(IN.LT.N)GO TO 10
      IMIN=LVMIN(X,N)
      HMEDIA=X(IMIN)
      END

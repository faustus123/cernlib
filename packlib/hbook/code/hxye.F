*
* $Id$
*
* $Log$
* Revision 1.1  1996/01/16 17:07:48  mclareni
* Initial revision
*
*
#include "hbook/pilot.h"
*CMZ :  4.23/01 20/02/95  10.21.16  by  Julian Bunn
*-- Author :
      FUNCTION HXYE(IDD,X,Y)
*.==========>
*.           RETURNS THE ERROR ON THE CELL DEFINED BY ABSCISSA X
*.           AND ORDINATE Y
*..=========> ( J.Bunn )
#include "hbook/hcbook.inc"
*.___________________________________________
      CALL HFIND(IDD,'HXYE  ')
      DX=FLOAT(IQ(LCID+KNCX))/(Q(LCID+KXMAX)-Q(LCID+KXMIN))
      DY=FLOAT(IQ(LCID+KNCY))/(Q(LCID+KYMAX)-Q(LCID+KYMIN))
      I=(X-Q(LCID+KXMIN))*DX+1.
      J=(Y-Q(LCID+KYMIN))*DY+1.
      IF(X.LT.Q(LCID+KXMIN))I=0
      IF(X.GT.Q(LCID+KXMAX))I=IQ(LCID+KNCX)+1
      IF(Y.LT.Q(LCID+KYMIN))J=0
      IF(Y.GT.Q(LCID+KYMAX))J=IQ(LCID+KNCY)+1
      HXYE=HCXY(I,J,2)
      END

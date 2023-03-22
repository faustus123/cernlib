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
      FUNCTION HIE(IDD,I)
*.==========>
*.           RETURNS SQUARE OF ERROR OF CHANNEL I OF IDD
*..=========> ( R.Brun )
#include "hbook/hcbook.inc"
*.___________________________________________
      CALL HFIND(IDD,'HIE   ')
      IF(JBIT(IQ(LCID+KBITS),9).NE.0)THEN
         HIE=HCX(I,2)
      ELSE
         RES=ABS(HCX(I,1))
         HIE=SQRT(RES)
      ENDIF
      END

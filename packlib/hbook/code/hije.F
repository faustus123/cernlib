*
* $Id$
*
* $Log$
* Revision 1.1  1996/01/16 17:07:39  mclareni
* Initial revision
*
*
#include "hbook/pilot.h"
*CMZ :  4.23/01 20/02/95  10.21.54  by  Julian Bunn
*-- Author :
      FUNCTION HIJE(IDD,I,J)
*.==========>
*.           RETURN THE ERROR ON CELL (I,J) OF IDD
*..=========> ( J.Bunn )
*.___________________________________________
      CALL HFIND(IDD,'HIJE  ')
      HIJE=HCXY(I,J,2)
      END

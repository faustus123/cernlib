*
* $Id$
*
* $Log$
* Revision 1.1  1996/01/16 17:07:30  mclareni
* Initial revision
*
*
#include "hbook/pilot.h"
*CMZ :  4.10/05 21/02/89  16.14.45  by  Rene Brun
*-- Author :
      SUBROUTINE H2PAGE(ID1)
*.==========>
*.           HIST ID2 WILL BE PRINTED OVER 2 PAGES
*..=========> ( R.Brun )
*.___________________________________________
      CALL HIDOPT(ID1,'2PAG')
      CALL HOBSOL('H2PAGE','2PAG','1PAG')
      END

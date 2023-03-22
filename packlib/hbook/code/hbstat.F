*
* $Id$
*
* $Log$
* Revision 1.1  1996/01/16 17:07:31  mclareni
* Initial revision
*
*
#include "hbook/pilot.h"
*CMZ :  4.10/05 21/02/89  16.14.46  by  Rene Brun
*-- Author :
      SUBROUTINE HBSTAT(ID1)
*.==========>
*.           Select option to fill statistics at filling time
*..=========> ( R.Brun )
*.___________________________________________
      CALL HIDOPT(ID1,'STAT')
      CALL HOBSOL('HBSTAT','STAT','    ')
      END

*
* $Id$
*
* $Log$
* Revision 1.1  1996/01/16 17:07:46  mclareni
* Initial revision
*
*
#include "hbook/pilot.h"
*CMZ :  4.10/05 21/02/89  16.14.53  by  Rene Brun
*-- Author :
      SUBROUTINE HROTAT(ID1)
*.==========>
*.           HISTOGRAM WILL BE PRINTED ROTATED BY 90 DEGREES
*..=========> ( R.Brun )
*.___________________________________________
      CALL HIDOPT(ID1,'ROTA')
      CALL HOBSOL('HROTAT','ROTA','NROT')
      END

*
* $Id$
*
* $Log$
* Revision 1.1  1996/01/16 17:07:47  mclareni
* Initial revision
*
*
#include "hbook/pilot.h"
*CMZ :  4.10/05 21/02/89  16.14.53  by  Rene Brun
*-- Author :
      SUBROUTINE HSTAR(ID1)
*.==========>
*.           SELECT STAR OPTION AT PRINTING
*..=========> ( R.Brun )
*.___________________________________________
      CALL HIDOPT(ID1,'STAR')
      CALL HOBSOL('HSTAR ','STAR','CONT')
      END

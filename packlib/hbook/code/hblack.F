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
      SUBROUTINE HBLACK(ID1)
*.==========>
*.           option BLAC selected at printing
*..=========> ( R.Brun )
*.___________________________________________
      CALL HIDOPT(ID1,'BLAC')
      CALL HOBSOL('HBLACK','BLAC','CONT')
      END

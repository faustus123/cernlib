*
* $Id$
*
* $Log$
* Revision 1.1  1996/01/16 17:07:34  mclareni
* Initial revision
*
*
#include "hbook/pilot.h"
*CMZ :  4.10/05 21/02/89  16.14.47  by  Rene Brun
*-- Author :
      SUBROUTINE HERROR(ID1)
*.==========>
*.           STATISTICAL ERRORS WILL BE CALCULATED AT EDITING
*.           IN THIS CASE FILLING MUST BE DONE WITH EQUAL WEIGTHS
*..=========> ( R.Brun )
*.___________________________________________
      CALL HIDOPT(ID1,'ERRO')
      CALL HOBSOL('HERROR','ERRO','NERR')
      END

*
* $Id$
*
* $Log$
* Revision 1.1  1996/01/16 17:07:39  mclareni
* Initial revision
*
*
#include "hbook/pilot.h"
*CMZ :  4.10/05 21/02/89  16.14.49  by  Rene Brun
*-- Author :
      SUBROUTINE HINTEG(ID1)
*.==========>
*.           AT EDITING TIME INTEGRATED CONTENTS WILL BE PRINTED
*..=========> ( R.Brun )
*.___________________________________________
      CALL HIDOPT(ID1,'INTE')
      CALL HOBSOL('HINTEG','INTE','NINT')
      END

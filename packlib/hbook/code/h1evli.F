*
* $Id$
*
* $Log$
* Revision 1.1  1996/01/16 17:07:30  mclareni
* Initial revision
*
*
#include "hbook/pilot.h"
*CMZ :  4.10/05 11/04/90  14.19.18  by  Rene Brun
*-- Author :
      SUBROUTINE H1EVLI(ID1)
*.==========>
*.           AT EDITING 1 LINE WILL CORRESPOND AT MINIMUM
*.           TO 1 ENTRY.
*..=========> ( R.Brun )
*.___________________________________________
      CALL HIDOPT(ID1,'1EVLI')
      CALL HOBSOL('H1EVLI','1EVL','AEVL')
      END

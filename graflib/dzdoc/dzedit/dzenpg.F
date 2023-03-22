*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/04 16:13:23  mclareni
* Initial revision
*
*
#include "dzdoc/pilot.h"
      SUBROUTINE DZENPG(IPAGE)
#include "dzesgpkeep.inc"
      CHARACTER*28 CCINT
      IPAGE = IPAGE + 1
      WRITE(CCINT,'(A,2I5)')'%%Page:',IPAGE,IPAGE
      CALL DZDPLN(LUOUT,'/saveobj save def',-3)
      CALL DZDPLN(LUOUT,CCINT,-3)
      WRITE(CCINT,'(2F8.5,A)')SCALE,SCALE,' scale'
      CALL DZDPLN(LUOUT,CCINT,-3)
      CALL DZDPLN(LUOUT,' [] 0 setdash',-1)
      CALL DZDPLN(LUOUT,' 1 setlinewidth',-1)
      CALL DZDPLN(LUOUT,'H 40 sf',-1)
      WRITE(CCINT,'(2I5,A,I5,A)')IXPAGE/2,MARGB -2*ISPACE,
     &                 ' 0 (-',IPAGE,'-) cs'
      CALL DZDPLN(LUOUT,CCINT,-3)
      WRITE(CCINT,'(A,I5,A)')'C ',ICSIZE,' sf'
      CALL DZDPLN(LUOUT,CCINT,-3)
      END
****************************************************************

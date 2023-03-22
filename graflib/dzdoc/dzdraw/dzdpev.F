*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/04 16:13:01  mclareni
* Initial revision
*
*
#include "dzdoc/pilot.h"
      SUBROUTINE DZDPEV
#include "dzdzbrinc.inc"
 
      IF(LZEBLK(1,0).EQ.0 .AND. NUH .LE.0)THEN
         WRITE(*,*)'Nothing in memory'
      ELSE
         CALL DZDSH1(1,LZEBLK(1,0),'_FOUT')
      ENDIF
      END
*********************************************************************

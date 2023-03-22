*
* $Id$
*
* $Log$
* Revision 1.1  1996/01/16 17:08:11  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "_hbook/pilot.h"
*CMZ :  4.10/05 19/02/90  11.18.30  by  Rene Brun
*-- Author :
      SUBROUTINE HBOOKT ( LUN)
*.==========>
*.      PRINT PAM TITLE ON LUN
*..=========> ( R.Brun )
*.
      WRITE (LUN,1000)
 1000 FORMAT ('0PACKAGE COMPILED FROM PAM FILE= ',
     + 40H CPP_TITLE                 
     +/)
      END
#include "TITLE.hbook"

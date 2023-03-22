*
* $Id$
*
* $Log$
* Revision 1.1  1996/01/19 10:49:57  mclareni
* Initial revision
*
*
#include "hplot/pilot.h"
*CMZ :  5.04/12 16/01/89  12.08.14  by  O.Couet
*-- Author :
      SUBROUTINE HPLDO(IWTYP)
*.==========>
*.            Single routine to plot everything
*.                 - like HISTDO -
*..=========>
      CALL HPLINT(IWTYP)
      CALL HPLOT(0,'    ','    ',0)
*
*----
*       Call optional user routine hplnxt before hplend
*----
      CALL HPLNXT
      CALL HPLEND
      END


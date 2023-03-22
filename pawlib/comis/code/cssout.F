*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/26 17:16:16  mclareni
* Initial revision
*
*
#include "comis/pilot.h"
*CMZ :  1.11/01 24/01/91  11.36.35  by  Rene Brun
*-- Author : V.Berezhnoi
         SUBROUTINE CSSOUT(REC)
***----------------------------
*       outputs line to terminal
***----------------------------
         CHARACTER *(*) REC
      WRITE(*,*)REC
      END

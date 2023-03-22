*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/14 13:10:32  mclareni
* Initial revision
*
*
#include "higz/pilot.h"
*CMZ :  1.06/03 17/10/88  13.48.10  by  Rene Brun
*-- Author :
      SUBROUTINE IGAXI1(X,Y,CFI,SFI,XT,YT,U,V)
*.==========>
*.
*.   Underlaying routine IGAXIS .
*.
*..=========>
      U=CFI*X-SFI*Y+XT
      V=SFI*X+CFI*Y+YT
*
      END



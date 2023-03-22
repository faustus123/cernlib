*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/14 13:10:59  mclareni
* Initial revision
*
*
#if defined(CERNLIB_MACMPW)
#include "higz/pilot.h"
*CMZ :  1.23/06 01/11/95  14.04.54  by  O.Couet
*-- Author : Cees de Laat
      subroutine imclrwi
c+
c       subroutine imclrwi
c
c Clears the window. If the window is not open, it will be opened.
c-
      call imacplo(ima,idm,10)
      call imacplo(ima,0,-2)
      end
#endif

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
*CMZ :  1.14/09 05/06/92  09.51.11  by  O.Couet
*-- Author : Cees de Laat
      subroutine imclswi
c+
c       subroutine imclswi
c
c Closes window.
c-
      call imacplo(0,0,999)
      end
#endif

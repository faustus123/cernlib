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
*CMZ :  1.16/04 02/10/92  13.35.41  by  O.Couet
*-- Author : Cees de Laat
      subroutine imnocli
c+
c       subroutine imnocli
c
c Remove clipping.
c-
      call imacplo(0,0,-8)
      end
#endif

*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/14 13:10:58  mclareni
* Initial revision
*
*
#if defined(CERNLIB_MACMPW)
#include "higz/pilot.h"
*CMZ :  1.16/04 02/10/92  13.34.54  by  O.Couet
*-- Author : Cees de Laat
      subroutine imclip(ix,iy,iw,ih)
c+
c       subroutine imclip(ix,iy,iw,ih)
c
c Set clipping to the rectangle ix,iy,iw,ih
c-
      call imacplo(ix,iy,0)
      call imacplo(ix+iw,iy+ih,8)
      end
#endif

*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 11:40:52  mclareni
* Initial revision
*
*
#include "kapack/pilot.h"
#if !defined(CERNLIB_IBM)
      INTEGER FUNCTION KAXRCL(LUNKAF)
*
*.....OBTAIN THE BLOCKSIZE OF A DIRECT ACCESS FILE FOR USE BY KAPACK.
*     THE BLOCKSIZE IS RETURNED IN THE UNITS REQUIRED BY THE FORTRAN
*     OPEN STATEMENT FOR UNFORMATTED DIRECT ACCESS FILES.
*
#include "kapack/kax000.inc"
*
*-----------------------------------------------------------------------
*
      KAXRCL = LWORD * LBUF
*
      END
#endif

*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/07 15:18:14  mclareni
* Initial revision
*
*
#include "fatmen/pilot.h"
      SUBROUTINE FMUALL(MEDIA,CDENS,COMP,LIBRARY,POOL,LBANK,CHOPT,
     +VSN,VID,IRC)
#include "fatmen/fattyp.inc"
      CHARACTER*(*) MEDIA,LIBRARY,POOL,VSN,VID,CDENS,COMP,CHOPT
      CHARACTER*8   CHROUT
#include "fatmen/fatbug.inc"
*
*     Dummy routine
*
      IRC = 99
      CHROUT = 'FMUALL. '
#include "fatmen/fatdummy.inc"
      END

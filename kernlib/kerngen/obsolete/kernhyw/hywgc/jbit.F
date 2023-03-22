*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:52:49  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "pilot.h"
      FUNCTION JBIT (IW,JPOS)
C
C CERN PROGLIB# M421    JBIT            .VERSION KERNHYW  1.03  841013
C ORIG. 13/10/84 JZ
C
      JBIT = FLD(36-JPOS,1,IW)
      RETURN
      END
#ifdef CERNLIB_TCGEN_JBIT
#undef CERNLIB_TCGEN_JBIT
#endif
*      ==================================================
#include "qcardl.inc"

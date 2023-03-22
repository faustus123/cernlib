*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:52:52  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "pilot.h"
      SUBROUTINE SBYTOR (MASK,IW,JPOS,NBITS)
C
C CERN PROGLIB# M421    SBYTOR          .VERSION KERNHYW  1.03  841013
C ORIG. 13/10/84 JZ
C
      JPH = 37 - JPOS - NBITS
      FLD(JPH,NBITS,IW) = OR (MASK,FLD(JPH,NBITS,IW))
      RETURN
      END
#ifdef CERNLIB_TCGEN_SBYTOR
#undef CERNLIB_TCGEN_SBYTOR
#endif
*      ==================================================
#include "qcardl.inc"

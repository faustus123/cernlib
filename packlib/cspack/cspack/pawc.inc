*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:44:15  mclareni
* Initial revision
*
*
#ifndef CERNLIB_CSPACK_PAWC_INC
#define CERNLIB_CSPACK_PAWC_INC
*
*
* pawc.inc
*
#if defined(CERNLIB_OS9)
      COMMON/PAWC/NWPAW,IXPAWC,IHDIV,IXHIGZ,IXKU,FENC(5),LMAIN,
     +            HCV(9989)
#endif
#if !defined(CERNLIB_OS9)
#include "cspack/lpawc.inc"
      COMMON/PAWC/NWPAW,IXPAWC,IHDIV,IXHIGZ,IXKU,FENC(5),LMAIN,
     +            HCV(NWPAWC)
#endif

#endif

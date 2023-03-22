*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:52:31  mclareni
* Initial revision
*
*
#ifndef CERNLIB_KERNCRY_Q_CBYT_INC
#define CERNLIB_KERNCRY_Q_CBYT_INC
*
*
* q_cbyt.inc
*
#if defined(CERNLIB_P5BOOT)
      MCBYT (MZ,IZQ,IZW,IZP,NZB)=(IZW.AND.SHIFT(MASK(64-NZB),IZP-1))
     +         .OR. SHIFT(SHIFTR(MZ,IZQ-1).AND.MASK(128-NZB),IZP-1)
#endif

#endif

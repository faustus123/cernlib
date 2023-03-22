*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:52:12  mclareni
* Initial revision
*
*
*
* q_jbytet.inc
*
#if defined(CERNLIB_P5BOOT)
      JBYTET (MZ,IZW,IZP,NZB) = MZ .AND. IBITS(IZW,IZP-1,NZB)
      JBYTOR (MZ,IZW,IZP,NZB) = MZ .OR.  IBITS(IZW,IZP-1,NZB)
#ifndef CERNLIB_QDEFAULT
#define CERNLIB_QDEFAULT
#endif
#endif

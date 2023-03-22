*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:50:58  mclareni
* Initial revision
*
*
#ifndef CERNLIB_KERNAPO_Q_SHIFT_INC
#define CERNLIB_KERNAPO_Q_SHIFT_INC
*
*
* q_shift.inc
*
#if defined(CERNLIB_P5BOOT)
      ISHFTL (IZW,NZB) = LSHFT (IZW, NZB)
      ISHFTR (IZW,NZB) = RSHFT (IZW, NZB)
#endif

#endif

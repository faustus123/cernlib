*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:52:07  mclareni
* Initial revision
*
*
*
* q_shift.inc
*
#if defined(CERNLIB_P5BOOT)
      ISHFTL (IZW,NZB) = ISHFT (IZW, NZB)
      ISHFTR (IZW,NZB) = ISHFT (IZW, -NZB)
#endif

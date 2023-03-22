*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:52:10  mclareni
* Initial revision
*
*
*
* q_jbit.inc
*
#if defined(CERNLIB_P5BOOT)
      JBIT (IZW,IZP)     = IBITS (IZW,IZP-1,1)
      JBYT (IZW,IZP,NZB) = IBITS (IZW,IZP-1,NZB)
#endif

*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:51:11  mclareni
* Initial revision
*
*
#ifndef CERNLIB_KERNCDC_Q_JBIT_INC
#define CERNLIB_KERNCDC_Q_JBIT_INC
*
*
* q_jbit.inc
*
#if 0
      JBIT (IZW,IZP)     = SHIFT(IZW,61-IZP) .AND. .NOT.MASK(59)
#endif
#if 0
      JBYT (IZW,IZP,NZB) = SHIFT(IZW,61-IZP) .AND. .NOT.MASK(60-NZB)
#endif

#endif

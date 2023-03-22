*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:54:46  mclareni
* Initial revision
*
*
#ifndef CERNLIB_KERNNOR_Q_JBIT_INC
#define CERNLIB_KERNNOR_Q_JBIT_INC
*
*
* q_jbit.inc
*
      JBIT (IZW,IZP)     = ISHFT (ISHFT(IZW,32-IZP), -31)
      JBYT (IZW,IZP,NZB) = ISHFT (ISHFT(IZW,33-IZP-NZB), -32+NZB)

#endif

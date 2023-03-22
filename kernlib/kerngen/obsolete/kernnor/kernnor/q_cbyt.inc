*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:54:46  mclareni
* Initial revision
*
*
#ifndef CERNLIB_KERNNOR_Q_CBYT_INC
#define CERNLIB_KERNNOR_Q_CBYT_INC
*
*
* q_cbyt.inc
*
      MCBYT (MZ,IZQ,IZW,IZP,NZB) = IOR ( IAND (IZW, NOT(
     +                   ISHFT (ISHFT(NOT(0),-32+NZB), IZP-1)))
     +        , ISHFT (ISHFT(ISHFT(MZ,-IZQ+1),32-NZB), -33+IZP+NZB) )

#endif

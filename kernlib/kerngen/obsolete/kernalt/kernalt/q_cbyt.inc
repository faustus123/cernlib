*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:50:53  mclareni
* Initial revision
*
*
#ifndef CERNLIB_KERNALT_Q_CBYT_INC
#define CERNLIB_KERNALT_Q_CBYT_INC
*
*
* q_cbyt.inc
*
      MCBYT (MZ,IZQ,IZW,IZP,NZB) = IOR ( IAND (IZW, NOT(
     +                   ISHFT (ishft(NOT(0),-32+NZB), IZP-1)))
     +        , ishft (ISHFT(ishft(MZ,-IZQ+1),32-NZB), -33+IZP+NZB) )

#endif

*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:54:46  mclareni
* Initial revision
*
*
#ifndef CERNLIB_KERNNOR_Q_SBIT_INC
#define CERNLIB_KERNNOR_Q_SBIT_INC
*
*
* q_sbit.inc
*
      MSBIT0 (IZW,IZP)   = IAND (IZW, NOT(ISHFT(1,IZP-1)) )
      MSBIT1 (IZW,IZP)   = IOR  (IZW,     ISHFT(1,IZP-1)  )
      MSBIT (MZ,IZW,IZP) = IOR (IAND (IZW, NOT(ISHFT(1,IZP-1)) )
     +                              , ISHFT(IAND(MZ,1),IZP-1))
      MSBYT (MZ,IZW,IZP,NZB) = IOR ( IAND (IZW, NOT(
     +                   ISHFT (ISHFT(NOT(0),-32+NZB), IZP-1)))
     +                     , ISHFT (ISHFT(MZ, 32-NZB), -33+IZP+NZB) )

#endif

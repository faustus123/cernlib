*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:50:58  mclareni
* Initial revision
*
*
#ifndef CERNLIB_KERNAPO_Q_SBIT_INC
#define CERNLIB_KERNAPO_Q_SBIT_INC
*
*
* q_sbit.inc
*
#if defined(CERNLIB_P5BOOT)
      MSBIT0 (IZW,IZP)   = AND (IZW, NOT(LSHFT(1,IZP-1)) )
      MSBIT1 (IZW,IZP)   = OR  (IZW,     LSHFT(1,IZP-1)  )
      MSBIT (MZ,IZW,IZP) = OR (AND (IZW, NOT(LSHFT(1,IZP-1)) )
     +                             , LSHFT(AND(MZ,1),IZP-1) )
#endif

#endif

*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:52:10  mclareni
* Initial revision
*
*
*
* q_sbit.inc
*
#if defined(CERNLIB_P5BOOT)
      MSBIT0 (IZW,IZP)   = IBCLR (IZW,IZP-1)
      MSBIT1 (IZW,IZP)   = IBSET (IZW,IZP-1)
#endif

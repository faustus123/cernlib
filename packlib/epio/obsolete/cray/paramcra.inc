*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:21:54  mclareni
* Initial revision
*
*
*
* paramcra.inc
*
#if defined(CERNLIB_CRAY)
      PARAMETER (LBT8=8,LBT16=16,LBT32=32,NBW=64)
      PARAMETER (NF8 =NBW/LBT8 )
      PARAMETER (NF16=NBW/LBT16)
      PARAMETER (NF32=NBW/LBT32)
#endif

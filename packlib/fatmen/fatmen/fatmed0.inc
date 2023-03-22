*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/07 15:17:56  mclareni
* Initial revision
*
*
#ifndef CERNLIB_FATMEN_FATMED0_INC
#define CERNLIB_FATMEN_FATMED0_INC
*
* Default media attributes
*
* fatmed0.inc
*
      PARAMETER     (NMEDIA=14)
*
*     FATMEN media type
*
      DIMENSION     MFMMED(NMEDIA)
*
*     Generic device type
*
      CHARACTER*8   MFMGEN(NMEDIA)
*
*     Physical device type
*
      CHARACTER*8   MFMTYP(NMEDIA)
*
*     Default density
*
      CHARACTER*8   MFMDEN(NMEDIA)
*
*     Media size in Megabytes
*
      CHARACTER*8   MFMSIZ(NMEDIA)
*
*     Default mount type
*
      CHARACTER*1   MFMMNT(NMEDIA)
*
*     Default label type
*
      CHARACTER*2   MFMLAB(NMEDIA)
 

#endif

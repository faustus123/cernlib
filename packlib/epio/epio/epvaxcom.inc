*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:21:46  mclareni
* Initial revision
*
*
#ifndef CERNLIB_EPIO_EPVAXCOM_INC
#define CERNLIB_EPIO_EPVAXCOM_INC
*
*
* epvaxcom.inc
*
#if defined(CERNLIB_VAX)||defined(CERNLIB_STF77VX)
      COMMON/EPVAXN/EPVXUN(10)
      CHARACTER*255 EPVXUN
#endif

#endif

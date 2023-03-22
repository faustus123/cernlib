*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:21:46  mclareni
* Initial revision
*
*
#ifndef CERNLIB_EPIO_EPAPOCOM_INC
#define CERNLIB_EPIO_EPAPOCOM_INC
*
*
* epapocom.inc
*
#if (!defined(CERNLIB_VAX))&&(!defined(CERNLIB_STF77VX))
      COMMON/EPAPON/EPVXUN(10)
      CHARACTER*256 EPVXUN
#endif

#endif

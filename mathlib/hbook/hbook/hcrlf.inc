*
* $Id$
*
* $Log$
* Revision 1.1  1996/01/16 17:07:50  mclareni
* Initial revision
*
*
#ifndef CERNLIB_HBOOK_HCRLF_INC
#define CERNLIB_HBOOK_HCRLF_INC
*
*
* hcrlf.inc
*
*CMZ :  4.20/13 21/10/93  15.01.47  by  Rene Brun
*-- Author :    Rene Brun   19/04/93
      CHARACTER*1 CRLF
#if (!defined(CERNLIB_MSDOS))&&(!defined(CERNLIB_WINNT))
#include "hbook/hcrlf1.inc"
#endif
#if defined(CERNLIB_MSDOS)||defined(CERNLIB_WINNT)
#include "hbook/hcrlf2.inc"
#endif

#endif

*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:54:12  mclareni
* Initial revision
*
*
*  Siemens compiler
*
* qnatch.inc
*
#if defined(CERNLIB_QF_SIEM)
      COMMON /QNATCH/ NATCH(256)
      INTEGER*2       NATCH
#include "qnatchdata.inc"
#endif
      INTEGER*2       NATCH(256)
#include "qnatchdata.inc"

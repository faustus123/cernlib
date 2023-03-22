*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/28 16:24:03  mclareni
* Initial revision
*
*
#ifndef CERNLIB_HEPDB_CDLUFM_INC
#define CERNLIB_HEPDB_CDLUFM_INC
*
*
* cdlufm.inc
*
      COMMON /CDLUFM/ LUFMCD
*KEEP, CDLUFM, IF=IBMRT, HPUX.
*     PARAMETER       (LUFMCD=87)
*KEEP, CDLUFM, IF=-IBMRT, IF=-HPUX.
*     PARAMETER       (LUFMCD=999)

#endif

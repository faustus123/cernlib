*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/28 16:24:04  mclareni
* Initial revision
*
*
#ifndef CERNLIB_HEPDB_CSAVBK_INC
#define CERNLIB_HEPDB_CSAVBK_INC
*
*
* csavbk.inc
*
      PARAMETER       (NSVMCS=50, NSAVCS=20, MXDMCS=100)
      COMMON /CSAVBK/ NOBJCS, LOBJCS(NSVMCS), KEYSCS(MXDMCS,NSVMCS)
*

#endif

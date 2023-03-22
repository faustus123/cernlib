*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/28 16:24:03  mclareni
* Initial revision
*
*
#ifndef CERNLIB_HEPDB_CDUSCM_INC
#define CERNLIB_HEPDB_CDUSCM_INC
*
*
* cduscm.inc
*
      COMMON /CDUSCM/ IDEBCD, IDISCD, IDIVCD, IHKYCD, IKDRCD
     +              , KOFSCD, KOFUCD
     +              , LTOPCD, LBADCD, LBAFCD, LBDACD,    LBFXCD, LBFYCD
     +              , LBKYCD, LBNOCD, LFIXCD, LREFCD(7), LSAVCD, LBUPCD
     +              , LPRTCD, NTOPCD
      PARAMETER       (NDMXCB=25000)
*

#endif

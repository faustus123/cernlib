*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/26 17:16:34  mclareni
* Initial revision
*
*
#ifndef CERNLIB_COMIS_CSLUN_INC
#define CERNLIB_COMIS_CSLUN_INC
*
*
* cslun.inc
*
      COMMON/CSUNIT/LUNINP,LUNPM,LUNFIL,LUNLOG,LUNMAP,LUNLIB,
     +                     ISTPM,ISTFIL,ISTLOG,ISTMAP,ISTLIB
      INTEGER LUNARR(5),ISTARR(5)
      EQUIVALENCE(LUNARR,LUNPM), (ISTARR,ISTPM)

#endif

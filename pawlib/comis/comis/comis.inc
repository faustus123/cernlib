*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/26 17:16:33  mclareni
* Initial revision
*
*
#ifndef CERNLIB_COMIS_COMIS_INC
#define CERNLIB_COMIS_COMIS_INC
*
*
* comis.inc
*
      COMMON/COMIS/IA(LASTK)
      INTEGER KOD(LASTK)
      REAL RA(LASTK)
      EQUIVALENCE(IA,RA),(IA,KOD)

#endif

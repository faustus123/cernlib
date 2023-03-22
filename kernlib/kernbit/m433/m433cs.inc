*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:47:48  mclareni
* Initial revision
*
*
#ifndef CERNLIB_KERNBIT_M433CS_INC
#define CERNLIB_KERNBIT_M433CS_INC
*
*
* m433cs.inc
*
C
      COMMON/M433CS/ICHSEP,CHSEP
      CHARACTER*1 CHSEP
C
      IF(ICHSEP.NE.1) THEN
        ICHSEP=1
        CHSEP=' '
      ENDIF
C

#endif

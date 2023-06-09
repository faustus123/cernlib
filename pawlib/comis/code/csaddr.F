*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/26 17:16:24  mclareni
* Initial revision
*
*
#include "comis/pilot.h"
*CMZ :  1.18/03 09/06/94  17.55.36  by  Rene Brun
*-- Author : V.Berezhnoi
      INTEGER FUNCTION CSADDR(CHNAME)
***-------------------------------
*    returns address of comis-routine
***---------------------------
      CHARACTER *(*) CHNAME
      INTEGER CSLTGP,CSITGP
      CHARACTER*32 NAME
#include "comis/cstab.inc"
#if defined(CERNLIB_SHL)&&(!defined(CERNLIB_QMLXIA64))
      INTEGER CS_GET_FUNC
#endif
#if defined(CERNLIB_SHL)&&(defined(CERNLIB_QMLXIA64))
#include "comis/cstab64.inc"
      INTEGER CSITGPL
      INTEGER*8 CS_GET_FUNC
#endif
#if defined(CERNLIB_SHL)
      NAME=CHNAME
      NC=LENOCC(NAME)
      CALL CSCHID(NAME(:NC))
      CALL CUTOL(NAME(:NC))
      I=CSLTGP(IPVS)
      IF(I.GT.0)THEN
        IF(IFCS.EQ.0)THEN
#if defined (CERNLIB_QMLXIA64)
          IADGPL=CS_GET_FUNC(NAME(1:NC)//'_')
          IF(IADGPL.NE.0)THEN
            IFCS=-2
            CALL CSRTGPL(I)
#else
          IADGP=CS_GET_FUNC(NAME(1:NC)//'_')
          IF(IADGP.NE.0)THEN
            IFCS=-2
            CALL CSRTGP(I)
#endif
#endif
#if defined(CERNLIB_SHL)
          ELSE
            I=0
          ENDIF
        ENDIF
      ELSE
#if defined (CERNLIB_QMLXIA64)
          IADGPL=CS_GET_FUNC(NAME(1:NC)//'_')
        IF(IADGPL.NE.0)THEN
          IFCS=-2
          ITYPGP=-2
          I=CSITGPL(IPVS)
        ENDIF
#else
        IADGP=CS_GET_FUNC(NAME(1:NC)//'_')
        IF(IADGP.NE.0)THEN
          IFCS=-2
          ITYPGP=-2
          I=CSITGP(IPVS)
        ENDIF
#endif
      END IF
      CSADDR=I
#endif
#if !defined(CERNLIB_SHL)
      NAME=CHNAME
      CALL CSCHID(NAME)
      I=CSLTGP(IPVS)
      IF(I.GT.0)THEN
        IF(IFCS.EQ.0)I=0
      END IF
      CSADDR=I
#endif
      END

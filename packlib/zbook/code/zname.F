*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 12:01:12  mclareni
* Initial revision
*
*
#include "zbook/pilot.h"
      SUBROUTINE ZNAME(IZ,ID,NAME,NR)
C
C     ******************************************************************
C     *                                                                *
C     *       STORE USER BANK NAME AND NUMBER                          *
C     *                                                                *
C     ******************************************************************
C
      DIMENSION IZ(1),ID(1)
      LOGICAL ZIDOK
C
C     ------------------------------------------------------------------
C
      CALL UCTOH(NAME,NAMEC,4,4)
      IF (ZIDOK(IZ,ID))                          GO TO 10
      CALL ZERROR(IZ,300,'ZNAME ',ID)
      RETURN
C
  10  JZ     = IZ(1)
      IDATA=ID(1)
      ND=IZ(IDATA)
      IZ(IDATA+ND-1)=NAMEC
      IZ(IDATA+ND)=NR
      RETURN
      END

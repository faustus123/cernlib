*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/04 16:13:02  mclareni
* Initial revision
*
*
#include "dzdoc/pilot.h"
      SUBROUTINE DZDNDI(CDIR,ICONT,IRET)
*      IMPLICIT NONE
      CHARACTER*(*)  CDIR
      INTEGER MAXDIR
      PARAMETER (MAXDIR=100)
      INTEGER ICONT,JCONT,IRET, IP, NDIR, I
      SAVE JCONT, IP, NDIR
      CHARACTER*16 CDIRS(MAXDIR)
      SAVE CDIRS
      DATA JCONT,NDIR /0, 0/
*
      IF(ICONT.EQ.0)THEN
*        new dir requested
         DO I=1,MAXDIR
            CDIRS(I)= ' '
         ENDDO
         CALL RZRDIR(MAXDIR,CDIRS,NDIR)
         ICONT=0
         IP=0
      ENDIF
      IF(IP.GE.NDIR)THEN
         CDIR=' '
         ICONT=0
         IRET=0
      ELSE
         IP=IP+1
         ICONT=ICONT+1
         CDIR=CDIRS(IP)
         IRET=0
      ENDIF
999   END
***********************************************************************

*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 12:01:12  mclareni
* Initial revision
*
*
#include "zbook/pilot.h"
      SUBROUTINE ZPTFOR(IZ,NAME,NW,IW)
*
* author HG       7/4/84
*
*   STORES A CONVERTED FORMAT FOR A BANK.
*
*   INPUT
*   IZ               STRUCTURE
*   NAME             BANK NAME (UP TO 4 CHARACTERS)
*   NW               NO. OF WORDS IN IW
*   IW               ARRAY CONTAINING FORMAT DESCRIPTION (SEE ZECFOR)
*
      PARAMETER (MLINK=6,MFBANK=4)
      DIMENSION IZ(*),IW(*)
*
      LENGZB(JDUM)=IZ(JDUM)-2
*
*--- CHECK FOR CORRECT ZBOOK VERSION (AT LEAST 6 SYSTEM LINKS)
      IF (IZ(IZ(1)+IZ(IZ(1))+1).LT.MLINK) GOTO 50
      IF(IZ(IZ(1)-MLINK).EQ.0)  THEN
*--- FIRST CALL - INITIALIZE
*
*   BOOK SYSTEM BANK NO. MLINK, AND MFBANK DAUGHTERS.
*
*   CONTENTS:
*   MOTHER           WORD 1 = NO. OF FORMATS BOOKED
*   DAUGTHER 1       BANK NAMES IN H FORMAT (4 MAX.)
*            2       REF. TO FORMAT IN DAUGTHER 4
*            3       LENGTH OF FORMAT
*            4       FORMAT(S)
*
         CALL ZBOOKN(IZ,IZ(IZ(1)-MLINK),1,MFBANK,'*FOR',0)
         IERR=IZ(IZ(1)+6)
         IF (IERR.NE.0) GOTO 50
         DO 10 I=1,3
            CALL ZBOOKN(IZ,IZ(IZ(IZ(1)-MLINK)-I),20,0,'*FOR',I)
   10    CONTINUE
         CALL ZBOOKN(IZ,IZ(IZ(IZ(1)-MLINK)-4),0,0,'*FOR',4)
         IERR=IZ(IZ(1)+6)
         IF (IERR.NE.0) GOTO 50
      ENDIF
*--- LOOK FOR NAME IN LIST (BINARY SEARCH)
      JMOTH=IZ(IZ(1)-MLINK)
      NFORM=IZ(JMOTH+1)
      CALL ZNAMSR(IZ,NAME,IST,LAST)
      IF (IST.LT.0) GOTO 50
      IF(IST.EQ.0)  THEN
*--- FORMAT NOT YET IN TABLE - ADD IT BEHIND LAST
         IF (LENGZB(IZ(JMOTH-1)).EQ.NFORM)  THEN
            DO 20 I=1,3
            JZL=IZ(IZ(IZ(1)-MLINK)-I)
               CALL ZPUSHS(IZ,JZL,20,0)
   20       CONTINUE
            IERR=IZ(IZ(1)+6)
            IF (IERR.NE.0) GOTO 50
            JMOTH=IZ(IZ(1)-MLINK)
         ENDIF
*--- PUSH EXISTING NAMES AND POINTERS UP ONE WORD
         IF (LAST.LT.NFORM)  THEN
            DO 30 I=1,3
               J=IZ(JMOTH-I)+LAST+1
               CALL UCOPY2(IZ(J),IZ(J+1),NFORM-LAST)
   30       CONTINUE
         ENDIF
*--- STORE NEW FORMAT
         IZ(JMOTH+1)=NFORM+1
         LENGTH=LENGZB(IZ(JMOTH-4))
         IZ(IZ(JMOTH-1)+LAST+1)=NAME
         IZ(IZ(JMOTH-2)+LAST+1)=LENGTH
         IZ(IZ(JMOTH-3)+LAST+1)=NW
         JZL=IZ(IZ(IZ(1)-MLINK)-4)
         CALL ZPUSHS(IZ,JZL,NW,0)
         IERR=IZ(IZ(1)+6)
         IF (IERR.NE.0) GOTO 50
         CALL UCOPY(IW,IZ(JZL+LENGTH+1),NW)
      ELSE
*--- FORMAT ALREADY IN TABLE - REPLACE
         LFORM=IZ(IZ(JMOTH-3)+IST)
         KDIFF=NW-LFORM
         KOFF=IZ(IZ(JMOTH-2)+IST)
         IF (KDIFF.GT.0)  THEN
            JZL=IZ(IZ(IZ(1)-MLINK)-4)
            CALL ZPUSHS(IZ,JZL,KDIFF,0)
            JMOTH=IZ(IZ(1)-MLINK)
         ENDIF
         IF (KDIFF.NE.0)  THEN
            K1=IZ(JMOTH-4)+KOFF+LFORM+1
            K2=IZ(JMOTH-4)+KOFF+NW+1
            KTOT=LENGZB(IZ(JMOTH-4))-KOFF-LFORM
            IF(KDIFF.GT.0)  KTOT=KTOT-KDIFF
*--- MOVE ALL FOLLOWING FORMATS UP, MODIFY POINTERS
            IF (KTOT.GT.0) CALL UCOPY2(IZ(K1),IZ(K2),KTOT)
            IZ(IZ(JMOTH-3)+IST)=NW
            DO 40 I=1,NFORM
               IF (IZ(IZ(JMOTH-2)+I).GT.KOFF)  THEN
                  IZ(IZ(JMOTH-2)+I)=IZ(IZ(JMOTH-2)+I)+KDIFF
               ENDIF
   40       CONTINUE
         ENDIF
         CALL UCOPY(IW,IZ(IZ(JMOTH-4)+KOFF+1),NW)
         JZL=IZ(IZ(IZ(1)-MLINK)-4)
         IF (KDIFF.LT.0) CALL ZPUSHS(IZ,JZL,KDIFF,0)
      ENDIF
      GOTO 999
   50 CONTINUE
      LOUT=IZ(IZ(1)+4)
      WRITE (LOUT,10000)
10000 FORMAT(/' +++ZPTFOR - ERROR AT CALL, NO ACTION TAKEN')
  999 END

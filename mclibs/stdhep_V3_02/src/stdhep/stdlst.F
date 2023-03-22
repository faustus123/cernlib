      subroutine stdlst
C
C    list particle ID for stdhep 
C
#include "stdlun.inc"
      INTEGER ID1,ID2,ITMP1,ITMP2
      CHARACTER*20 HNAM1,HNAM2

      INTEGER HEPCMP
      EXTERNAL HEPCMP

C...special cases
      WRITE(lnhout,1001)
      DO 100 I=1,100
        ITMP1=HEPCMP(I)
        IF(ITMP1.GT.0)THEN
          ID1=I
          CALL HEPNAM(ID1,HNAM1)
          ID2=-I
          ITMP2=HEPCMP(ID2)
          IF(ITMP2.EQ.0)THEN
            WRITE(lnhout,1101) ID1,HNAM1,ITMP1
          ELSE
            CALL HEPNAM(ID2,HNAM2)
            WRITE(lnhout,1102) ID1,HNAM1,ITMP1,ID2,HNAM2,ITMP2
          ENDIF
        ENDIF
 100  CONTINUE
      DO 150 J=11,99
        I=J*10
        ITMP1=HEPCMP(I)
        IF(ITMP1.GT.0)THEN
          ID1=I
          CALL HEPNAM(ID1,HNAM1)
          ID2=-I
          ITMP2=HEPCMP(ID2)
          IF(ITMP2.EQ.0)THEN
            WRITE(lnhout,1101) ID1,HNAM1,ITMP1
          ELSE
            CALL HEPNAM(ID2,HNAM2)
            WRITE(lnhout,1102) ID1,HNAM1,ITMP1,ID2,HNAM2,ITMP2
          ENDIF
        ENDIF
 150  CONTINUE
C...diquarks
      WRITE(lnhout,1002)
      DO 200 I=11,99
        DO 190 J=1,10
          ID1=100*I+J-1
          ITMP1=HEPCMP(ID1)
          IF(ITMP1.GT.0)THEN
            ID2=-ID1
            CALL HEPNAM(ID1,HNAM1)
            ITMP2=HEPCMP(ID2)
            IF(ITMP2.EQ.0)THEN
              WRITE(lnhout,1101) ID1,HNAM1,ITMP1
            ELSE
              CALL HEPNAM(ID2,HNAM2)
              WRITE(lnhout,1102) ID1,HNAM1,ITMP1,ID2,HNAM2,ITMP2
            ENDIF
          ENDIF
 190    CONTINUE
 200  CONTINUE
C...mesons
      WRITE(lnhout,1003)
      DO 300 I=1,9
        DO 290 J=1,9
          DO 280 K=1,10
            DO 270 L=1,10
              ID1=10000*(L-1)+100*I+10*J+K-1
              ITMP1=HEPCMP(ID1)
              IF(ITMP1.GT.0)THEN
                ID2=-ID1
                CALL HEPNAM(ID1,HNAM1)
                ITMP2=HEPCMP(ID2)
                IF(ITMP2.EQ.0)THEN
                  WRITE(lnhout,1101) ID1,HNAM1,ITMP1
                ELSE
                  CALL HEPNAM(ID2,HNAM2)
                  WRITE(lnhout,1102) ID1,HNAM1,ITMP1,ID2,HNAM2,ITMP2
                ENDIF
              ENDIF
 270        CONTINUE
 280      CONTINUE
 290    CONTINUE
 300  CONTINUE
C...baryons
      WRITE(lnhout,1004)
      DO 400 I=1,9
        DO 390 J=1,9
          DO 380 K=1,9
            DO 370 L=1,10
              ID1=1000*I+100*J+10*K+L-1
              ITMP1=HEPCMP(ID1)
              IF(ITMP1.GT.0)THEN
                ID2=-ID1
                CALL HEPNAM(ID1,HNAM1)
                ITMP2=HEPCMP(ID2)
                IF(ITMP2.EQ.0)THEN
                  WRITE(lnhout,1101) ID1,HNAM1,ITMP1
                ELSE
                  CALL HEPNAM(ID2,HNAM2)
                  WRITE(lnhout,1102) ID1,HNAM1,ITMP1,ID2,HNAM2,ITMP2
                ENDIF
              ENDIF
 370        CONTINUE
 380      CONTINUE
 390    CONTINUE
 400  CONTINUE
C...ions
      WRITE(lnhout,1005)
      DO 500 J=1,2
        DO 490 I=1,4
          DO 480 K=1,2
            id1 = 1000000000 + I*1000000 + J*1000 + K
            ITMP1=HEPCMP(ID1)
            IF(ITMP1.GT.0)THEN
              ID2=-ID1
              CALL HEPNAM(ID1,HNAM1)
              ITMP2=HEPCMP(ID2)
              IF(ITMP2.EQ.0)THEN
                WRITE(lnhout,1103) ID1,HNAM1,ITMP1
              ELSE
                CALL HEPNAM(ID2,HNAM2)
                WRITE(lnhout,1104) ID1,HNAM1,ITMP1,ID2,HNAM2,ITMP2
              ENDIF
            ENDIF
 480      CONTINUE
 490    CONTINUE
 500  CONTINUE

      RETURN
 1001 FORMAT(//5X,'Special Cases'
     1     /4X,'ISTD  HNAM',14X,'ICOMP',8X,'ISTD  HNAM',14X,'ICOMP')
 1002 FORMAT(//5X,'Diquarks'
     1     /4X,'ISTD  HNAM',14X,'ICOMP',8X,'ISTD  HNAM',14X,'ICOMP')
 1003 FORMAT(//5X,'Mesons'
     1     /4X,'ISTD  HNAM',14X,'ICOMP',8X,'ISTD  HNAM',14X,'ICOMP')
 1004 FORMAT(//5X,'Baryons'
     1     /4X,'ISTD  HNAM',14X,'ICOMP',8X,'ISTD  HNAM',14X,'ICOMP')
 1005 FORMAT(//5X,'Ions'
     1     /4X,'ISTD',5X,'HNAM',14X,'ICOMP',11X,'ISTD  HNAM',
     2     14X,'ICOMP')
 1101 FORMAT(1X,I7,2X,A15,1X,I7)
 1102 FORMAT(1X,I7,2X,A15,1X,I7,5X,I7,2X,A15,1X,I7)
 1103 FORMAT(1X,I10,2X,A15,1X,I7)
 1104 FORMAT(1X,I10,2X,A15,1X,I7,5X,I10,2X,A15,1X,I7)
      END

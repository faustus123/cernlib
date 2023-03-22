      PROGRAM TSTIOM
C
C      read in multiple events to the common block
C
#include "stdlun.inc"
      INTEGER LOK,IFL,I
      CHARACTER*10 FILIN(4),FILRD
      LOGICAL LRDIT(4)

      DATA LRDIT/.TRUE.,.TRUE.,.TRUE.,.TRUE./
      DATA FILIN/'stdtsth.io','stdtstj.io','stdtsti.io','stdtstp.io'/
      SAVE LRDIT

C initialize HEP logical units
      LNHWRT=0
      LNHDCY=0
      LNHOUT=22
      LNHRDM(1)=23
      LNHRDM(2)=24
      LNHRDM(3)=25
      LNHRDM(4)=26
C...open output file
      OPEN(UNIT=LNHOUT,FILE='stdtstiom.lpt',STATUS='NEW')
C...open input files
      DO 110 I = 1,4
        FILRD=FILIN(I)
        LNHRD=LNHRDM(I)
        OPEN(UNIT=LNHRD,FILE=FILRD,STATUS='OLD',ERR=100,
     1       FORM='UNFORMATTED')
        GO TO 110
 100    LRDIT(I)=.FALSE.
        WRITE(LNHOUT,1001) FILRD
 110  CONTINUE
C...book histograms
      CALL TSTBKIOM
C...now read events
      DO WHILE (LRDIT(1).OR.LRDIT(2).OR.LRDIT(3).OR.LRDIT(4))
        CALL STDZERO
        DO I=1,4
          IF(LRDIT(I))THEN
 200        CALL HEPRDM(IFL,LOK,I)
            IF(LOK.NE.0)THEN
              CLOSE(UNIT=LNHRDM(I))
              LRDIT(I)=.FALSE.
            ELSE
C... keep looping if this is not a HEPEVT record
              IF(IFL.NE.1) GO TO 200
C... fill histograms
              CALL TSTFLIOM
            ENDIF
          ENDIF
        ENDDO
      ENDDO
C...print histograms
      CALL HOUTPU(LNHOUT)
      CALL HISTDO
1001  FORMAT(' could not open file ',A10)
      END

      SUBROUTINE TSTFLIOM
C... fill histograms
#include "stdhep.inc"

      INTEGER I

      CALL HFILL(11,FLOAT(NEVHEP),0.,1.)
      CALL HFILL(12,FLOAT(NHEP),0.,1.)
      DO 100 I=1,NHEP
        CALL HFILL(13,FLOAT(IDHEP(I)),0.,1.)
        CALL HFILL(14,FLOAT(ISTHEP(I)),0.,1.)
        CALL HFILL(15,FLOAT(JMOHEP(1,I)),0.,1.)
        CALL HFILL(16,FLOAT(JMOHEP(2,I)),0.,1.)
        CALL HFILL(17,FLOAT(JDAHEP(1,I)),0.,1.)
        CALL HFILL(18,FLOAT(JDAHEP(2,I)),0.,1.)
        CALL HFILL(19,FLOAT(JMULTI(I)),0.,1.)
        CALL HFILL(21,SNGL(PHEP(1,I)),0.,1.)
        CALL HFILL(22,SNGL(PHEP(2,I)),0.,1.)
        CALL HFILL(23,SNGL(PHEP(3,I)),0.,1.)
        CALL HFILL(24,SNGL(PHEP(4,I)),0.,1.)
        CALL HFILL(25,SNGL(PHEP(5,I)),0.,1.)
        CALL HFILL(26,SNGL(VHEP(1,I)),0.,1.)
        CALL HFILL(27,SNGL(VHEP(2,I)),0.,1.)
        CALL HFILL(28,SNGL(VHEP(3,I)),0.,1.)
        CALL HFILL(29,SNGL(VHEP(4,I)),0.,1.)
 100  CONTINUE
      RETURN
      END

      SUBROUTINE TSTBKIOM
C--- book histograms
C
      IMPLICIT NONE
C---   The HBOOK common
      REAL HMEMOR
      COMMON/PAWC/HMEMOR(50000)

C---   Setup the HBOOK memory limit.
      CALL HLIMIT(50000)
C---   Book histograms.

      CALL HBOOK1(11,'NEVHEP',100,0.0,100.0,0.)
      CALL HBOOK1(12,'NHEP',100,0.,1000.,0.)
      CALL HBOOK1(13,'IDHEP',100,0.,100.,0.)
      CALL HBOOK1(14,'ISTHEP',100,0.,200.,0.)
      CALL HBOOK1(15,'JMOHEP(1,)',100,0.,1000.,0.)
      CALL HBOOK1(16,'JMOHEP(2,)',100,0.,1000.,0.)
      CALL HBOOK1(17,'JDAHEP(1,)',100,0.,1000.,0.)
      CALL HBOOK1(18,'JDAHEP(2,)',100,0.,1000.,0.)
      CALL HBOOK1(19,'JMULTI',20,0.,10.,0.)
      CALL HBOOK1(21,'PHEP(1,)',100,-100.,100.,0.)
      CALL HBOOK1(22,'PHEP(2,)',100,-100.,100.,0.)
      CALL HBOOK1(23,'PHEP(3,)',100,-1000.,1000.,0.)
      CALL HBOOK1(24,'PHEP(4,)',100,-1000.,1000.,0.)
      CALL HBOOK1(25,'PHEP(5,)',50,-250.,250.,0.)
      CALL HBOOK1(26,'VHEP(1,)',10,-1.,1.,0.)
      CALL HBOOK1(27,'VHEP(2,)',10,-1.,1.,0.)
      CALL HBOOK1(28,'VHEP(3,)',10,-1.,1.,0.)
      CALL HBOOK1(29,'VHEP(4,)',10,0.,1.,0.)
      RETURN
      END


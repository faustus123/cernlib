CDECK  ID>, IOFILE.
      SUBROUTINE IOFILE (IFLAG,IVECT)

C-    ATTACH FILE, INITIAL REWIND, FINAL REWIND, DETACH

      COMMON /QUNIT/ IQREAD,IQPRNT,IQPR2,IQLOG,IQPNCH,IQTTIN,IQTYPE
     +,              IQDLUN,IQFLUN,IQHLUN,IQCLUN,  NQUSED
      COMMON /ARRCOM/LUNPAM,NCHKD,NWKD,NCARDP,NAREOF,NSKIPR,KDHOLD(20)
     +,              NTRUNC,IPROMU,IPROMI
      COMMON /IOFCOM/IOTALL,IOTOFF,IOTON,IOSPEC,IOPARF(5),IOMODE(12)
      PARAMETER      (IQBDRO=25, IQBMAR=26, IQBCRI=27, IQBSYS=31)
      COMMON /QBITS/ IQDROP,IQMARK,IQCRIT,IQZIM,IQZIP,IQSYS
                         DIMENSION    IQUEST(30)
                         DIMENSION                 LQ(99), IQ(99), Q(99)
                         EQUIVALENCE (QUEST,IQUEST),    (LQUSER,LQ,IQ,Q)
      COMMON //      QUEST(30),LQUSER(7),LQMAIN,LQSYS(24),LQPRIV(7)
     +,              LQ1,LQ2,LQ3,LQ4,LQ5,LQ6,LQ7,LQSV,LQAN,LQDW,LQUP
C--------------    END CDE                             -----------------  ------
      DIMENSION    IFLAG(9), IVECT(9)
      EQUIVALENCE (LUN,IOPARF(1)), (JTYP,IOPARF(5))

C     INTEGER      ACTION(8)                                             A6M
C      DOUBLE PRECISION ACTION(8)                                        -A6M
      character*16 ACTION(8)                                            -A6M
      DIMENSION    IACTIO(16)                                           -A6M
      EQUIVALENCE (IACTIO(1), ACTION(1))                                -A6M



      DATA ACTION/'HOLD  ','RESUME','EOF   ','REWIND','ATTACH','DETACH'
     +,           'EOFREW','CLOSE ' /

C------    CODE BITS IN  IOTALL, IOTOFF, IOTON, IOTYP

C-    VAL   1  BIT 1  ATTACH
C-          2      2  RESUME
C-          4      3  CARDS
C-          8      4  DETACH
C-         16      5  EOF
C-         32      6  HOLD

C-         64      7  OUPUT FILE
C-        128      8  CETA-FORMAT
C-        256      9  INITIAL REWIND
C-        512     10  FINAL REWIND
C-       1024     11  INTERMEDIATE REWIND IN YEDIT


      JTYPAR = IFLAG(1)
      CALL UCOPY (IVECT(1),IOPARF(1),5)
      J     = 8191 - IOTOFF
C     MTYP  = (JTYP .OR. JTYPAR .OR. IOTON .OR. IOTALL) .AND. J          MSKC
      CALL SBYTOR (JTYP,  IOTON,1,12)                                   -MSK
      CALL SBYTOR (JTYPAR,IOTON,1,12)                                   -MSK
      CALL SBYTOR (IOTALL,IOTON,1,12)                                   -MSK
      MTYP = JBYTET (J,IOTON,1,12)                                      -MSK

      CALL UPKBYT (MTYP,1,IOMODE(1),12,0)

      IF (IOMODE(10).EQ.0)   GO TO 24
      IOMODE(9) = 0
      IF (IOMODE(6) .NE.0)  IOMODE(4)=0
      IF (IOMODE(11).EQ.0)   GO TO 24
      IOMODE(4) = 0
      IOMODE(6) = 0

   24 IOTON  = IOMODE(9)
      IOTOFF = 7
      IF (LUN.EQ.IQREAD)     GO TO 31
      IF (IOMODE(9) .NE.0)  IOTOFF=IOMODE(2)
      IF (IOMODE(10).NE.0)  IOTOFF=IOMODE(6)

C- INPUT  IOTON  = IOMODE(9)
C-        IOTOFF =  =0 REWIND / NE.0 NO REWIND

      CALL IOFILX

C- OUTPUT IOTON CHANGED TO :
C-              2  IF EOF WRITTEN
C-              4  IF ATTACH DONE
C-              5  IF DETACH DONE
C-       IOTOFF CHANGED TO :
C-              1  IF REWIND NOT DONE

C- 1 ATT, 2 RES, 3 CAR, 4 DET, 5 EOF, 6 HOLD, 7 OUT, 8 CE, 9 INI, 10 FIN

   31 IF (IOMODE(9) .EQ.0)   GO TO 41
      IVECT(1) = IOPARF(1)
      IVECT(3) = 0
      IF (IOMODE(7)-IOMODE(3).NE.-1)  GO TO 41
      CALL VZERO (NCHKD,4)
      LUNPAM = LUN
      CALL KDNGO
      IF (IOMODE(2) .NE.0)   GO TO 42
      IF (LUN.EQ.IQREAD)     GO TO 42
      CALL KDNREW

   41 IF (IOTOFF.NE.0)       GO TO 42
      IF (IOTON .EQ.2)  IOTON=6
      IOTON = MAX  (IOTON,3)

   42 CALL UBLOW (ACTION(IOTON+1),IQUEST(11),6)
      IOTON = 0
      IOTOFF= 0
      IOSPEC= 0
      RETURN
      END

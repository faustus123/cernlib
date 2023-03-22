CDECK  ID>, FLINK.
      SUBROUTINE FLINK (LUNP)

      COMMON /SLATE/ NDSLAT,NESLAT,NFSLAT,NGSLAT,MMSLAT(36)
      COMMON /QUNIT/ IQREAD,IQPRNT,IQPR2,IQLOG,IQPNCH,IQTTIN,IQTYPE
     +,              IQDLUN,IQFLUN,IQHLUN,IQCLUN,  NQUSED
      COMMON /IOFCOM/IOTALL,IOTOFF,IOTON,IOSPEC,IOPARF(5),IOMODE(12)
                   PARAMETER (NTEXT=128, NLINE=256)
                   CHARACTER  IDPROG*8,  HOMED*48
                   CHARACTER  LINECC*(NLINE), LINEUP*(NLINE)
                   CHARACTER  CHDEF*8,   CHTERM*4,   CHEXT*8
                   CHARACTER  TEXT*(NTEXT), FILEST(13)*(NTEXT)
      COMMON /FLKRAC/IFLDIA, INTACT, KINDPA, IFLBAK, JFAULT, NLCUM
     +,              JLINC,JLINT, NTXT, LUNOP, NHOMED, HOMED, IDPROG
     +,              LINECC,LINEUP, CHDEF,CHTERM, CHEXT,TEXT, FILEST
C--------------    END CDE                             --------------
      EQUIVALENCE (LUN,LUNOP)

      CHARACTER      OST*12, USF*11
      CHARACTER*(*)  UNF, FRM, CSOLD, CSNEW, CSAPP, CSOVR, CSSCR, APX
      PARAMETER   (UNF='UNFORMATTED')
      PARAMETER   (FRM='FORMATTED')
      PARAMETER   (APX='APPEND')
      CHARACTER    UCC*8, CCPRI*(*), CCCAR*(*)
      PARAMETER   (CCPRI='FORTRAN')
      PARAMETER   (CCCAR='LIST')
      PARAMETER   (CSOLD='OLD')
      PARAMETER   (CSNEW='NEW')
      PARAMETER   (CSAPP='UNKNOWN')
      PARAMETER   (CSOVR='NEW')
      PARAMETER   (CSSCR='SCRATCH')
      LOGICAL THERE
C- 1 ATT, 2 RES, 3 CAR, 4 DET, 5 EOF, 6 HOLD, 7 OUT, 8 CE, 9 INI, 10 FIN

      LUN  = LUNP
      IFLBAK = 0
      IF (TEXT(1:4).EQ.'    ')  GO TO 99
      IF (TEXT(1:4).EQ.'-   ')  GO TO 99
      IF (TEXT(1:4).EQ.'&   ')  GO TO 99
      MODEX  = IOMODE(7)

C--                Check : + APPEND, = OVERWRITE, - SCRATCH

      IF (TEXT(1:1).EQ.'=')        GO TO 16
      IF (TEXT(1:1).EQ.'-')        GO TO 17
      IF (TEXT(1:1).NE.'+')        GO TO 19
      MODEX = 2*MODEX
      IOMODE(2) = 1
      GO TO 18

   16 MODEX = 3*MODEX
      GO TO 18

   17 MODEX = 4*MODEX
   18 IF (MODEX.EQ.0)  WRITE (IQTYPE,9018)
      TEXT(1:1) = ' '

   19 CALL CLEFT  (TEXT,1,NTEXT)
      NTXT = NDSLAT

      IF (IOMODE(8).NE.0)  THEN
          IF (MODEX.EQ.2)  WRITE (IQTYPE,9024)
          IF (MODEX.NE.0)  MODEX = 3
        ENDIF

      MODXA = IABS (MODEX)
      CLOSE (LUN)

      JOPFL = 0
      IF (MODXA.EQ.1)  JOPFL = 2
      IF (MODXA.EQ.3)  JOPFL = 1

      IF (JOPFL.NE.0)  THEN
          CALL FLOPER (JOPFL, TEXT(1:NTXT), LUN)
          IF (JOPFL.EQ.2)  IFLBAK = NDSLAT
        ENDIF

      IF (IOMODE(3).EQ.0)  THEN
          USF = UNF
        ELSE
          USF = FRM
        ENDIF

C----              Open next file -- according to MODEX parameter
C---               MODEX =-3  Old Printer File - OVERWRITE mode
C---               MODEX =-2  Old Printer File - APPEND mode
C---               MODEX =-1  New Printer File
C---               MODEX = 0  Input File
C---               MODEX = 1  New Output File
C---               MODEX = 2  Old Output File - APPEND mode
C---               MODEX = 3  Old Output File - OVERWRITE mode
C---               MODEX = 4  Scratch File

      IF (MODXA.EQ.0)  OST = CSOLD
      IF (MODXA.EQ.1)  OST = CSNEW
      IF (MODXA.EQ.2)  OST = CSAPP
      IF (MODXA.EQ.3)  OST = CSOVR
      IF (MODXA.EQ.4)  OST = CSSCR
      IF (IOMODE(8).NE.0)          GO TO 41

      IF (MODXA.EQ.2)  THEN
          OPEN (LUN,FILE=TEXT(1:NTXT),STATUS=OST,ACCESS=APX,FORM=USF)
        ELSEIF (MODXA.EQ.4)  THEN
          OPEN (LUN,STATUS=OST,FORM=USF)
        ELSEIF (MODXA.EQ.0)  THEN
      INQUIRE(FILE=TEXT(1:NTXT),EXIST=THERE)
      IF(.NOT.THERE) THEN
      WRITE(6,9999) TEXT(1:NTXT)
      STOP
      ENDIF
          OPEN (LUN,FILE=TEXT(1:NTXT),STATUS=OST, FORM=USF)
        ELSE
          OPEN (LUN,FILE=TEXT(1:NTXT),STATUS=OST, FORM=USF)
        ENDIF
      GO TO 99

C----              OPEN CETA tape or disk File

   41 CONTINUE
      IF (IOMODE(8).GE.0)  THEN
          IF (MODEX.EQ.0)  THEN
              OPEN (LUN,FILE=TEXT(1:NTXT),STATUS=OST,FORM=UNF)
            ELSE
              OPEN (LUN,FILE=TEXT(1:NTXT),STATUS=OST,FORM=UNF)
            ENDIF
        ELSE
          IF (MODEX.EQ.0)  THEN
              OPEN (LUN,FILE=TEXT(1:NTXT),STATUS=OST,FORM=UNF
     +,             ACCESS='DIRECT',RECL=3600)
            ELSE
              OPEN (LUN,FILE=TEXT(1:NTXT),STATUS=OST,FORM=UNF
     +,             ACCESS='DIRECT',RECL=3600)
            ENDIF
        ENDIF
   99 RETURN

 9018 FORMAT (' !!! No APPEND/OVERWRITE mode for input files !!!')
 9024 FORMAT (' !!! APPEND mode not possible for CETA files !!!')
 9999 FORMAT (' !!! Input file not exist : ',a)
      END

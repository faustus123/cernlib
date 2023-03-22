CDECK  ID>, IOFILX.
      SUBROUTINE IOFILX

C-    EXECUTION FOR IOFILE, VERSION FOR STRAIGHT-FORWARD FORTRAN

      COMMON /IOFCOM/IOTALL,IOTOFF,IOTON,IOSPEC,IOPARF(5),IOMODE(12)
      COMMON IQUEST(30)
C--------------    END CDE                             -----------------  ------
      EQUIVALENCE (LUN,IOPARF(1))
      DATA  JEXPAM / 4HPAM  /
      DATA  JEXCAR / 4HCAR  /

C------            START FILE, INITIAL REWIND
C- 1 ATT, 2 RES, 3 CAR, 4 DET, 5 EOF, 6 HOLD, 7 OUT, 8 CE, 9 INI, 10 FIN

      IF (IOMODE(9).EQ.0)    GO TO 51
      IF (IOPARF(3).EQ.0)    GO TO 31
      IOPARF(1) = IOPARF(3)
      IF (IOMODE(1).EQ.0)       GO TO 31
      JEXTU = JEXCAR
      IF (IOMODE(3).EQ.0)  JEXTU = JEXPAM
      CALL FLKRAK (JEXTU)
      CALL FLINK (LUN)
      IOTON = 4

   31 IF (IOTOFF.NE.0)                  RETURN
      IF (IOMODE(7)-IOMODE(3).EQ.-1)    RETURN
      GO TO 92

C------            INTERMEDIATE FILE

   51 IF (IOMODE(10).NE.0)           GO TO 61
      IF (IOMODE(5)+IOMODE(7).EQ.2)  GO TO 71
      RETURN


C- 1 ATT, 2 RES, 3 CAR, 4 DET, 5 EOF, 6 HOLD, 7 OUT, 8 CE, 9 INI, 10 FIN

C------            END FILE, FINAL REWIND

   61 IF (IOMODE(7).NE.0)    GO TO 71

C--                Terminate CETA input file

      IF (IOMODE(8).EQ.0)    GO TO 65
      IF (IOSPEC.EQ.0)       GO TO 65
      GO TO 98

C--                DETACH input file

   65 IF (IOMODE(6).NE.0)    GO TO 98
      IF (IOMODE(4).EQ.0)    GO TO 67
      CLOSE (UNIT=LUN)
      IOMODE(6) = 0
      IOTON     = 5
      RETURN

C--                REWIND input card file

   67 IF (IOMODE(3).EQ.0)    GO TO 91
      CALL KDNREW
      RETURN

C------            OUTPUT FILE

   71 IF (IOMODE(8).EQ.0)    GO TO 76
      CLOSE (LUN)
      IOTON = 7
      GO TO 98

C--                Write EOF to output file

   76 CONTINUE
      IF (IOMODE(5).EQ.0)    GO TO 91
      ENDFILE LUN
      IOTON = 2

C----              REWIND of input/output file

   91 IF (IOTOFF.NE.0)       RETURN
   92 IF (IOMODE(8).EQ.0)    GO TO 96
      IF (IOSPEC.NE.0)       GO TO 98
   96 REWIND LUN
      RETURN

   98 IOTOFF = 1
      RETURN
      END

CDECK  ID>, JARTPX.
      FUNCTION JARTPX (ITP)

C-    FIND C/C-TYPE, CHECK FOR C/C-CHARACTER SUBSTITUTION
C-    IN CASE OF SUBSTITUTION STORE NEW SYMBOL OVER-WRITING THE OLD ONE

      COMMON /QBCD/  IQNUM2(11),IQLETT(26),IQNUM(10),IQPLUS
     +,              IQMINS,IQSTAR,IQSLAS,IQOPEN,IQCLOS,IQDOLL,IQEQU
     +,              IQBLAN,IQCOMA,IQDOT,IQAPO,  IQCROS
      PARAMETER      (IQBITW=32, IQBITC=8, IQCHAW=4)
      COMMON /QMACH/ NQBITW,NQCHAW,NQLNOR,NQLMAX,NQLPTH,NQRMAX,QLPCT
     +,              NQOCT(3),NQHEX(3),NQOCTD(3)
      COMMON /CCPARU/MCCTOU,JCCLOW,JCCTPX
      COMMON /CCTEXT/NCCVEC,MCCVEC(28),MCCSW(29),NCCDFI,MCCDF(24)
      COMMON /CCHCH/ IFORPL,NOTHCC,MORGCC(6),MREPCC(6)
C--------------    END CDE                             --------------
C     DIMENSION    MM(10), ITP(9)                                        A8M
      DIMENSION    MM(6),  ITP(9)                                       -A8M
      INTEGER  NBLANK
      DATA NBLANK /Z'20202000'/
      
      IT     = ITP(1)
      JARTPX = 0
      JCCTPX = 0
      MM(2) = AND(IT,255)
      IF (MM(2).EQ.43)       GO TO 21
      IF (NOTHCC.EQ.0)       RETURN

C--                CHECK OTHER CONTROL CHAR

      MM(1) = OR (MM(2), NBLANK)
      J = IUCOMP (MM(1),MORGCC(1),NOTHCC)
      IF (J.EQ.0)            RETURN

C--                IF SO, GO TO CHECK LEGAL PATCHY C/C

      NEWCC = MREPCC(J)
      CALL UBLOW (IT,MM,4)
      MM(1) = IQPLUS
      JCCLOW = 0
      CALL CCTOUP (MM(2),3)
      GO TO 23

C----              SEEN CONTROL-CHAR   '+'

   21 NEWCC = IFORPL
      CALL UBLOW (IT,MM,4)
      JCCLOW = 0
      CALL CCTOUP (MM(2),3)
      IF (JCCLOW.EQ.0)       GO TO 24
   23 CALL UBUNCH (MM(1),IT,4)
   24 JCCTPX = IUCOMP (IT,MCCVEC(1),NCCVEC)
      IF (JCCTPX.EQ.0)       RETURN
      IF (NEWCC.NE.0)        GO TO 31
   27 JARTPX = MCCSW(JCCTPX+1)
      RETURN

C----              SUBSTITUTE REPLACEMENT CHAR.

   31 CONTINUE
      MM(1) = NEWCC
      CALL UBUNCH (MM(1),ITP(1),IQCHAW)
      IF (NEWCC.EQ.IQPLUS)   GO TO 27
      RETURN
      END

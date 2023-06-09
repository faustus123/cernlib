CDECK  ID>, UCOPY2.
      SUBROUTINE UCOPY2 (A,B,N)
C
C CERN PROGLIB# V301    UCOPY2          .VERSION KERNFOR  4.26  910313
C ORIG.  01/01/68
C MODIF. 26/02/91 JZ correct for bug in SGI
C
      DIMENSION A(*),B(*)
C
C
      IF (N.LT.2)            GO TO 41
      IA = LOCF (A)
      IB = LOCF (B)
      IF   (IA-IB)           20,99,10
C
C--                End of B may overlap beginning of A
   10 DO 15 I=1,N
   15 B(I) = A(I)
      RETURN
C
C--                End of A may overlap with beginning of B
   20 DO 25 I=N,1,-1
   25 B(I) = A(I)
      RETURN

C--                Case N=1, gives trouble on SGI

   41 IF (N.LE.0)            RETURN
      B(1) = A(1)
   99 RETURN
      END

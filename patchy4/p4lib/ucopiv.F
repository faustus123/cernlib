CDECK  ID>, UCOPIV.
      SUBROUTINE UCOPIV (A,B,N)
C
C CERN PROGLIB# V301    UCOPIV          .VERSION KERNFOR  1.0   710701
C ORIG. 01/07/71
C
      DIMENSION A(*), B(*)
C
      IF (N.EQ.0) RETURN
      I = N
      DO 12 J=1,N
      B(I)= A(J)
   12 I = I - 1
      RETURN
      END

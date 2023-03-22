      SUBROUTINE UZEROD(A, JL, JR)
      DOUBLE PRECISION A(*)
      INTEGER JL, JR
C
      DO J=JL, JR
         A(J)=0.0D0
      ENDDO
      RETURN
      END

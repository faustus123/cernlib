      SUBROUTINE UZEROL(A, JL, JR)
      LOGICAL A(*)
      INTEGER JL, JR
C
      DO J=JL, JR
         A(J)=.FALSE.
      ENDDO
      RETURN
      END

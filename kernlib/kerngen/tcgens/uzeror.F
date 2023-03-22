      SUBROUTINE UZEROR(A, JL, JR)
      REAL A(*)
      INTEGER JL, JR
C
      DO J=JL, JR
         A(J)=0.0
      ENDDO
      RETURN
      END


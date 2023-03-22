      SUBROUTINE UZEROI(A, JL, JR)
      INTEGER A(*)
      INTEGER JL, JR
C
      DO J=JL, JR
         A(J)=0
      ENDDO
      RETURN
      END
C

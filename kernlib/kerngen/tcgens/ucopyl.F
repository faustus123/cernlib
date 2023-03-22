C----------------------
C 04/07/2022 add explicit logical version
C----------------------
      SUBROUTINE UCOPYL (A, B, N)
      IMPLICIT NONE
C
C ORIG. 02/07/22 US
C
      LOGICAL A(*),B(*)
      INTEGER I, N
C
C--                NO OVERLAP  OR  BEGINNING OF A ON END OF B
      IF (N.EQ.0) RETURN
      DO I=1, N
         B(I) = A(I)
      ENDDO
      RETURN
      END


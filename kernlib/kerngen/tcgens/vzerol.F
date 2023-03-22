      SUBROUTINE VZEROL (A, N)
C
C ORIG. 03/07/22 to set logical to false
C
      IMPLICIT NONE
      LOGICAL   A(*)
      INTEGER N, I

      IF (N.LE.0)  RETURN
      DO I= 1,N
         A(I)= .FALSE.
      ENDDO
C
      RETURN
      END

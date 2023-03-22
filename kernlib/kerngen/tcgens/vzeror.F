      SUBROUTINE VZEROR (A, N)
C
C ORIG. 03/07/22 to set real zero
C
      IMPLICIT NONE
      REAL   A(*)
      INTEGER N, I

      IF (N.LE.0)  RETURN
      DO I = 1,N
         A(I)= 0.0
      ENDDO
C
      RETURN
      END

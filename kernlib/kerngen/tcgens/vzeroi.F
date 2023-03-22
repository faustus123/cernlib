      SUBROUTINE VZEROI (A,N)
C
C ORIG. 03/07/22 to set integer zero
C
      IMPLICIT NONE
      INTEGER   A(*)
      INTEGER N, I

      IF (N.LE.0)  RETURN
      DO I= 1,N
         A(I)= 0
      ENDDO
C
      RETURN
      END

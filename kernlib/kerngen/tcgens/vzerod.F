      SUBROUTINE VZEROD (A,N)
C
C ORIG. 03/07/22 to set double precision zero
C
      IMPLICIT NONE
      DOUBLE PRECISION A(*)
      INTEGER N, I

      IF (N.LE.0)  RETURN
      DO I = 1,N
         A(I)= 0.D0
      ENDDO
C
      RETURN
      END

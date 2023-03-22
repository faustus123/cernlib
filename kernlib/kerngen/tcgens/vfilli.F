      SUBROUTINE VFILLI (A, N, STUFF)
C     
      INTEGER A(*), STUFF
      INTEGER N
C     
      IF (N.LE.0)  RETURN
      DO I= 1,N
         A(I)= STUFF
      ENDDO
      RETURN
      END

      SUBROUTINE VFILLR (A, N, STUFF)
C     
      REAL A(*), STUFF
      INTEGER N
C     
      IF (N.LE.0)  RETURN
      DO I= 1,N
         A(I)= STUFF
      ENDDO
      RETURN
      END


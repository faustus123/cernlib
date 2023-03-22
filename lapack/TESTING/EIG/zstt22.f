      SUBROUTINE ZSTT22( N, M, KBAND, AD, AE, SD, SE, U, LDU, WORK,
     $                   LDWORK, RWORK, RESULT )
*
*  -- LAPACK test routine (version 3.0) --
*     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
*     Courant Institute, Argonne National Lab, and Rice University
*     June 30, 1999
*
*     .. Scalar Arguments ..
      INTEGER            KBAND, LDU, LDWORK, M, N
*     ..
*     .. Array Arguments ..
      DOUBLE PRECISION   AD( * ), AE( * ), RESULT( 2 ), RWORK( * ),
     $                   SD( * ), SE( * )
      COMPLEX*16         U( LDU, * ), WORK( LDWORK, * )
*     ..
*
*  Purpose
*  =======
*
*  ZSTT22  checks a set of M eigenvalues and eigenvectors,
*
*      A U = U S
*
*  where A is Hermitian tridiagonal, the columns of U are unitary,
*  and S is diagonal (if KBAND=0) or Hermitian tridiagonal (if KBAND=1).
*  Two tests are performed:
*
*     RESULT(1) = | U* A U - S | / ( |A| m ulp )
*
*     RESULT(2) = | I - U*U | / ( m ulp )
*
*  Arguments
*  =========
*
*  N       (input) INTEGER
*          The size of the matrix.  If it is zero, ZSTT22 does nothing.
*          It must be at least zero.
*
*  M       (input) INTEGER
*          The number of eigenpairs to check.  If it is zero, ZSTT22
*          does nothing.  It must be at least zero.
*
*  KBAND   (input) INTEGER
*          The bandwidth of the matrix S.  It may only be zero or one.
*          If zero, then S is diagonal, and SE is not referenced.  If
*          one, then S is Hermitian tri-diagonal.
*
*  AD      (input) DOUBLE PRECISION array, dimension (N)
*          The diagonal of the original (unfactored) matrix A.  A is
*          assumed to be Hermitian tridiagonal.
*
*  AE      (input) DOUBLE PRECISION array, dimension (N)
*          The off-diagonal of the original (unfactored) matrix A.  A
*          is assumed to be Hermitian tridiagonal.  AE(1) is ignored,
*          AE(2) is the (1,2) and (2,1) element, etc.
*
*  SD      (input) DOUBLE PRECISION array, dimension (N)
*          The diagonal of the (Hermitian tri-) diagonal matrix S.
*
*  SE      (input) DOUBLE PRECISION array, dimension (N)
*          The off-diagonal of the (Hermitian tri-) diagonal matrix S.
*          Not referenced if KBSND=0.  If KBAND=1, then AE(1) is
*          ignored, SE(2) is the (1,2) and (2,1) element, etc.
*
*  U       (input) DOUBLE PRECISION array, dimension (LDU, N)
*          The unitary matrix in the decomposition.
*
*  LDU     (input) INTEGER
*          The leading dimension of U.  LDU must be at least N.
*
*  WORK    (workspace) COMPLEX*16 array, dimension (LDWORK, M+1)
*
*  LDWORK  (input) INTEGER
*          The leading dimension of WORK.  LDWORK must be at least
*          max(1,M).
*
*  RWORK   (workspace) DOUBLE PRECISION array, dimension (N)
*
*  RESULT  (output) DOUBLE PRECISION array, dimension (2)
*          The values computed by the two tests described above.  The
*          values are currently limited to 1/ulp, to avoid overflow.
*
*  =====================================================================
*
*     .. Parameters ..
      DOUBLE PRECISION   ZERO, ONE
      PARAMETER          ( ZERO = 0.0D0, ONE = 1.0D0 )
      COMPLEX*16         CZERO, CONE
      PARAMETER          ( CZERO = ( 0.0D+0, 0.0D+0 ),
     $                   CONE = ( 1.0D+0, 0.0D+0 ) )
*     ..
*     .. Local Scalars ..
      INTEGER            I, J, K
      DOUBLE PRECISION   ANORM, ULP, UNFL, WNORM
      COMPLEX*16         AUKJ
*     ..
*     .. External Functions ..
      DOUBLE PRECISION   DLAMCH, ZLANGE, ZLANSY
      EXTERNAL           DLAMCH, ZLANGE, ZLANSY
*     ..
*     .. External Subroutines ..
      EXTERNAL           ZGEMM
*     ..
*     .. Intrinsic Functions ..
      INTRINSIC          ABS, DBLE, MAX, MIN
*     ..
*     .. Executable Statements ..
*
      RESULT( 1 ) = ZERO
      RESULT( 2 ) = ZERO
      IF( N.LE.0 .OR. M.LE.0 )
     $   RETURN
*
      UNFL = DLAMCH( 'Safe minimum' )
      ULP = DLAMCH( 'Epsilon' )
*
*     Do Test 1
*
*     Compute the 1-norm of A.
*
      IF( N.GT.1 ) THEN
         ANORM = ABS( AD( 1 ) ) + ABS( AE( 1 ) )
         DO 10 J = 2, N - 1
            ANORM = MAX( ANORM, ABS( AD( J ) )+ABS( AE( J ) )+
     $              ABS( AE( J-1 ) ) )
   10    CONTINUE
         ANORM = MAX( ANORM, ABS( AD( N ) )+ABS( AE( N-1 ) ) )
      ELSE
         ANORM = ABS( AD( 1 ) )
      END IF
      ANORM = MAX( ANORM, UNFL )
*
*     Norm of U*AU - S
*
      DO 40 I = 1, M
         DO 30 J = 1, M
            WORK( I, J ) = CZERO
            DO 20 K = 1, N
               AUKJ = AD( K )*U( K, J )
               IF( K.NE.N )
     $            AUKJ = AUKJ + AE( K )*U( K+1, J )
               IF( K.NE.1 )
     $            AUKJ = AUKJ + AE( K-1 )*U( K-1, J )
               WORK( I, J ) = WORK( I, J ) + U( K, I )*AUKJ
   20       CONTINUE
   30    CONTINUE
         WORK( I, I ) = WORK( I, I ) - SD( I )
         IF( KBAND.EQ.1 ) THEN
            IF( I.NE.1 )
     $         WORK( I, I-1 ) = WORK( I, I-1 ) - SE( I-1 )
            IF( I.NE.N )
     $         WORK( I, I+1 ) = WORK( I, I+1 ) - SE( I )
         END IF
   40 CONTINUE
*
      WNORM = ZLANSY( '1', 'L', M, WORK, M, RWORK )
*
      IF( ANORM.GT.WNORM ) THEN
         RESULT( 1 ) = ( WNORM / ANORM ) / ( M*ULP )
      ELSE
         IF( ANORM.LT.ONE ) THEN
            RESULT( 1 ) = ( MIN( WNORM, M*ANORM ) / ANORM ) / ( M*ULP )
         ELSE
            RESULT( 1 ) = MIN( WNORM / ANORM, DBLE( M ) ) / ( M*ULP )
         END IF
      END IF
*
*     Do Test 2
*
*     Compute  U*U - I
*
      CALL ZGEMM( 'T', 'N', M, M, N, CONE, U, LDU, U, LDU, CZERO, WORK,
     $            M )
*
      DO 50 J = 1, M
         WORK( J, J ) = WORK( J, J ) - ONE
   50 CONTINUE
*
      RESULT( 2 ) = MIN( DBLE( M ), ZLANGE( '1', M, M, WORK, M,
     $              RWORK ) ) / ( M*ULP )
*
      RETURN
*
*     End of ZSTT22
*
      END

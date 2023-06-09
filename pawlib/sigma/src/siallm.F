*
* $Id$
*
* $Log$
* Revision 1.2  2006/09/15 09:35:38  mclareni
* Submitted mods for gcc4/gfortran and MacOSX, corrected to work also on slc4 with gcc3.4 and 4.1
*
* Revision 1.1.1.1  1995/12/12 14:36:15  mclareni
* Imported sources
*
*
#include "sigma/pilot.h"
*CMZ :  1.09/02 13/08/93  17.44.45  by  Carlo E. Vandoni
*-- Author :
      SUBROUTINE SIALLM(A,LAMBDA,M,IA,NCAL,IAVOID,H,HL,VECT,MULT,INTH,
     ,INT)
C     CALLED BY EIGEN TO CALCULATE EIGENVALUES AND EIGENVECTORS
C     WORKING AREAS MADE INTO ARGUMENTS , NOT RESERVED IN SUBR. ITSELF
C     OTHERWISE UNCHANGED CERN LIBRARY VERSION OF 13/11/1974
C
C PROG.AUTHORS JOHN RINZEL,R.E.FUNDERLIC,UNION CARBIDE CORP.
C NUCLEAR DIVISION,CENTRAL D A T A  PROCESSING FACILITY,
C OAK RIDGE TENNESSEE
C
      COMPLEX A(IA,*),H(IA,IA),HL(IA,IA),LAMBDA(2),VECT(IA),
     1MULT(IA),SHIFT(3),TEMP,SIN,COS,TEMP1,TEMP2
      LOGICAL INTH(IA),TWICE
      INTEGER INT(IA),R,RP1,RP2
      N=M
      NCAL=N
      IF(N.NE.1)GO TO 1
      LAMBDA(1)=A(1,1)
      A(1,1)=1.
      GO TO 57
    1 ICOUNT=0
      SHIFT(1)=0.
      IF(N.NE.2)GO TO 4
    2 TEMP=(A(1,1)+A(2,2)+CSQRT((A(1,1)+A(2,2))**2-
     14.*(A(2,2)*A(1,1)-A(2,1)*A(1,2))))/2.
      IF(REAL(TEMP).NE.0..OR.AIMAG(TEMP).NE.0.)GO TO 3
      LAMBDA(M)=SHIFT(1)
      LAMBDA(M-1)=A(1,1)+A(2,2)+SHIFT(1)
      GO TO 37
    3 LAMBDA(M)=TEMP+SHIFT(1)
      LAMBDA(M-1)=(A(2,2)*A(1,1)-A(2,1)*A(1,2))/(LAMBDA(M)-SHIFT(1))+
     1SHIFT(1)
      GO TO 37
C
C     REDUCE MATRIX A TO HESSENBERG FORM
C
    4 IF(IAVOID.EQ.1.OR.IAVOID.EQ.3) GOTO 61
      NM2=N-2
      DO 15 R=1,NM2
      RP1=R+1
      RP2=R+2
      ABIG=0.
      INT(R)=RP1
      DO 5 I=RP1,N
      ABSSQ=REAL(A(I,R))**2+AIMAG(A(I,R))**2
      IF(ABSSQ.LE.ABIG)GO TO 5
      INT(R)=I
      ABIG=ABSSQ
    5 CONTINUE
      INTER=INT(R)
      IF(ABIG.EQ.0.)GO TO 15
      IF(INTER.EQ.RP1)GO TO 8
      DO 6 I=R,N
      TEMP=A(RP1,I)
      A(RP1,I)=A(INTER,I)
    6 A(INTER,I)=TEMP
      DO 7 I=1,N
      TEMP=A(I,RP1)
      A(I,RP1)=A(I,INTER)
    7 A(I,INTER)=TEMP
    8 DO 9 I=RP2,N
      MULT(I)=A(I,R)/A(RP1,R)
    9 A(I,R)=MULT(I)
      DO 11 I=1,RP1
      TEMP=0.
      DO 10 J=RP2,N
   10 TEMP=TEMP+A(I,J)*MULT(J)
   11 A(I,RP1)=A(I,RP1)+TEMP
      DO 13 I=RP2,N
      TEMP=0.
      DO 12 J=RP2,N
   12 TEMP=TEMP+A(I,J)*MULT(J)
   13 A(I,RP1)=A(I,RP1)+TEMP-MULT(I)*A(RP1,RP1)
      DO 14 I=RP2,N
      DO 14 J=RP2,N
   14 A(I,J)=A(I,J)-MULT(I)*A(RP1,J)
   15 CONTINUE
C
C     CALCULATE EPSILON
C
   61 EPS=0.
      DO 16 I=1,N
   16 EPS=EPS+CABS(A(1,I))
      DO 18 I=2,N
      SUM=0.
      IM1=I-1
      DO 17 J=IM1,N
   17 SUM=SUM+CABS(A(I,J))
   18 IF(SUM.GT.EPS)EPS=SUM
      EPS=SQRT(FLOAT(N))*EPS*1.E-12
      IF(EPS.EQ.0.)EPS=1.E-12
      DO 19 I=1,N
      DO 19 J=1,N
   19 H(I,J)=A(I,J)
   20 IF(N.NE.1)GO TO 21
      LAMBDA(M)=A(1,1)+SHIFT(1)
      GO TO 37
   21 IF(N.EQ.2)GO TO 2
   22 MN1=M-N+1
#if !defined(CERNLIB_GFORTRAN)
      IF(REAL(A(N,N)).NE.0..OR.AIMAG(A(N,N)).NE.0.)
     1 IF(ABS(REAL(A(N,N-1)/A(N,N)))+ABS(AIMAG(A(N,N-1)/A(N,N)))-1.E-9)
     2 24,24,23
#else
      IF (REAL(A(N,N)).NE.0..OR.AIMAG(A(N,N)).NE.0.) THEN
         IF (ABS(REAL(A(N,N-1)/A(N,N)))+ABS(AIMAG(A(N,N-1)/A(N,N)))
     +        -1.E-9.LE.0.) THEN
            GO TO 24
         ELSE 
            GO TO 23
         ENDIF
      ENDIF
#endif
   23 IF(ABS(REAL(A(N,N-1)))+ABS(AIMAG(A(N,N-1))).GE.EPS)GO TO 25
   24 LAMBDA(MN1)=A(N,N)+SHIFT(1)
      ICOUNT=0
      N=N-1
      GO TO 21
C
C     DETERMINE SHIFT
C
   25 SHIFT(2)=(A(N-1,N-1)+A(N,N)+CSQRT((A(N-1,N-1)+A(N,N))**2
     1 -4.*(A(N,N)*A(N-1,N-1)-A(N,N-1)*A(N-1,N))))/2.
      IF(REAL(SHIFT(2)).NE.0..OR.AIMAG(SHIFT(2)).NE.0.)GO TO 26
      SHIFT(3)=A(N-1,N-1)+A(N,N)
      GO TO 27
   26 SHIFT(3)=(A(N,N)*A(N-1,N-1)-A(N,N-1)*A(N-1,N))/SHIFT(2)
   27 IF(CABS(SHIFT(2)-A(N,N)).LT.CABS(SHIFT(3)-A(N,N)))GO TO 28
      INDEX=3
      GO TO 29
   28 INDEX=2
   29 IF(CABS(A(N-1,N-2)).GE.EPS)GO TO 30
      LAMBDA(MN1)=SHIFT(2)+SHIFT(1)
      LAMBDA(MN1+1)=SHIFT(3)+SHIFT(1)
      ICOUNT=0
      N=N-2
      GO TO 20
   30 SHIFT(1)=SHIFT(1)+SHIFT(INDEX)
      DO 31 I=1,N
   31 A(I,I)=A(I,I)-SHIFT(INDEX)
C
C     PERFORM GIVENS ROTATIONS, QR ITERATES
C
      IF(ICOUNT.LE.10)GO TO 32
      NCAL=M-N
      GO TO 37
   32 NM1=N-1
      TEMP1=A(1,1)
      TEMP2=A(2,1)
      DO 36 R=1,NM1
      RP1=R+1
      RHO=SQRT(REAL(TEMP1)**2+AIMAG(TEMP1)**2+
     1 REAL(TEMP2)**2+AIMAG(TEMP2)**2)
      IF(RHO.EQ.0.)GO TO 36
      COS=TEMP1/RHO
      SIN=TEMP2/RHO
      INDEX=MAX0(R-1,1)
      DO 33 I=INDEX,N
      TEMP=CONJG(COS)*A(R,I)+CONJG(SIN)*A(RP1,I)
      A(RP1,I)=-SIN*A(R,I)+COS*A(RP1,I)
   33 A(R,I)=TEMP
      TEMP1=A(RP1,RP1)
      TEMP2=A(R+2,R+1)
      DO 34 I=1,R
      TEMP=COS*A(I,R)+SIN*A(I,RP1)
      A(I,RP1)=-CONJG(SIN)*A(I,R)+CONJG(COS)*A(I,RP1)
   34 A(I,R)=TEMP
      INDEX=MIN0(R+2,N)
      DO 35 I=RP1,INDEX
      A(I,R)=SIN*A(I,RP1)
   35 A(I,RP1)=CONJG(COS)*A(I,RP1)
   36 CONTINUE
      ICOUNT=ICOUNT+1
      GO TO 22
C
C     CALCULATE VECTORS
C
   37 IF(IAVOID.EQ.2.OR.IAVOID.EQ.3) RETURN
      IF(NCAL.EQ.0)GO TO 57
      N=M
      NM1=N-1
      IF(N.NE.2)GO TO 38
      EPS=AMAX1(CABS(LAMBDA(1)),CABS(LAMBDA(2)))*1.E-8
C          ***M24*** SUBSCRIPT OF ARRAY EXCEEDS DIMENSION
      IF(EPS.EQ.0.)EPS=1.E-12
      H(1,1)=A(1,1)
      H(1,2)=A(1,2)
      H(2,1)=A(2,1)
      H(2,2)=A(2,2)
   38 DO 56 L=1,NCAL
      DO 40 I=1,N
      DO 39 J=1,N
   39 HL(I,J)=H(I,J)
   40 HL(I,I)=HL(I,I)-LAMBDA(L)
      DO 44 I=1,NM1
      MULT(I)=0.
      INTH(I)=.FALSE.
      IP1=I+1
      IF(CABS(HL(I+1,I)).LE.CABS(HL(I,I)))GO TO 42
      INTH(I)=.TRUE.
      DO 41 J=I,N
      TEMP=HL(I+1,J)
      HL(I+1,J)=HL(I,J)
   41 HL(I,J)=TEMP
   42 IF(REAL(HL(I,I)).EQ.0..AND.AIMAG(HL(I,I)).EQ.0.)GO TO 44
      MULT(I)=-HL(I+1,I)/HL(I,I)
      DO 43 J=IP1,N
   43 HL(I+1,J)=HL(I+1,J)+MULT(I)*HL(I,J)
   44 CONTINUE
      DO 45 I=1,N
   45 VECT(I)=1.
      TWICE=.FALSE.
   46 IF(REAL(HL(N,N)).EQ.0..AND.AIMAG(HL(N,N)).EQ.0.)HL(N,N)=EPS
      VECT(N)=VECT(N)/HL(N,N)
      DO 48 I=1,NM1
      K=N-I
      DO 47 J=K,NM1
   47 VECT(K)=VECT(K)-HL(K,J+1)*VECT(J+1)
      IF(REAL(HL(K,K)).EQ.0..AND.AIMAG(HL(K,K)).EQ.0.)HL(K,K)=EPS
   48 VECT(K)=VECT(K)/HL(K,K)
      BIG=0.
      DO 49 I=1,N
      SUM=ABS(REAL(VECT(I)))+ABS(AIMAG(VECT(I)))
   49 IF(SUM.GT.BIG)BIG=SUM
      DO 50 I=1,N
   50 VECT(I)=VECT(I)/BIG
      IF(TWICE)GO TO 52
      DO 51 I=1,NM1
      IF(.NOT.INTH(I))GO TO 51
      TEMP=VECT(I)
      VECT(I)=VECT(I+1)
      VECT(I+1)=TEMP
   51 VECT(I+1)=VECT(I+1)+MULT(I)*VECT(I)
      TWICE=.TRUE.
      GO TO 46
   52 IF(N.EQ.2)GO TO 55
      NM2=N-2
      DO 54 I=1,NM2
      N1I=N-1-I
      NI1=N-I+1
      DO 53 J=NI1,N
   53 VECT(J)=H(J,N1I)*VECT(N1I+1)+VECT(J)
      INDEX=INT(N1I)
      TEMP=VECT(N1I+1)
      VECT(N1I+1)=VECT(INDEX)
   54 VECT(INDEX)=TEMP
   55 DO 56 I=1,N
   56 A(I,L)=VECT(I)
   57 RETURN
      END

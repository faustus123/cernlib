*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:01:26  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
      SUBROUTINE F500M
C     Routine to test MATHLIB routines  LIHOIN and DLHOIN (F500)

#include "imp64r.inc"
      DIMENSION A(10,5),V(10,200),W(200,9),IW(10,5),VEX(5,12)
      DIMENSION RA(10,5),RV(10,200),RW(200,9),       RVEX(5,12)
      CHARACTER*6 TFUNC(2)
C
C     Set numerical tolerance for testing the S/D versions
      DIMENSION TOL(2)
C
      LOGICAL LTEST
#include "iorc.inc"

      DATA TFUNC/'LIHOIN','DLHOIN'/
      DATA TOL / 2.5E-4,5D-14 /
      DATA ((A(M,N),N=1,5),M=1,8)
     1/0.799217D0, 0.864099D0, 0.160325D0, 0.632229D0, 0.052457D0,
     2 0.466098D0, 0.375965D0, 0.596879D0, 0.271234D0, 0.072917D0,
     3 0.796017D0, 0.887416D0, 0.650871D0, 0.039460D0, 0.048344D0,
     4 0.367939D0, 0.400156D0, 0.476228D0, 0.457051D0, 0.462931D0,
     5 0.845622D0, 0.513245D0, 0.942230D0, 0.099140D0, 0.553517D0,
     6 0.341419D0, 0.891279D0, 0.227223D0, 0.340023D0, 0.059538D0,
     7 0.800058D0, 0.926708D0, 0.638934D0, 0.819688D0, 0.514403D0,
     8 0.464460D0, 0.330900D0, 0.811808D0, 0.546348D0, 0.262904D0/

C    EXPECTED BASIS VECTORS FOR THE SOLUTION CONE
      DATA ((VEX(J,I2),I2=1,5),J=1,5)

     1/-0.732290871847036298D0, -0.154490269566318200D0,
     + -0.248447009410866809D0,  0.603094116303552258D-01,
     + -0.676429284103394493D0,
     2  0.535581612163871346D0, -0.180491575844838492D0,
     + -0.210781762391387129D0, -0.242767482388277327D-01,
     +  0.684953103756224022D0,
     3  0.129390501061007232D0,  0.600373662682449918D0,
     +  0.601145677483211682D0, -0.108069617055684991D0,
     +  0.132250293830252885D0,
     4  0.129470286575879057D0,  0.346207409819890718D0,
     +  0.494252918736763788D0, -0.975633811030188203D-01,
     + -0.130917430628470680D0,
     5  0.378679229494564881D0, -0.680622834028829282D0,
     + -0.536826842586525341D0,  0.987206036702031942D0,
     +  0.196604057439148341D0/

      DATA ((VEX(J,I2),I2=6,10),J=1,5)
     1/-0.594082455642258978D0,  0.684220921741165333D0,
     +  0.769376015413755734D0,  0.722702075073820269D0,
     +  0.719048970141879351D0,
     2  0.690988384516715806D0, -0.205362932956947006D0,
     + -0.274742879649470098D0, -0.272359708519578095D0,
     + -0.260191716186908159D0,
     3  0.280984500838489942D0, -0.585114665380818008D0,
     + -0.463981615366753003D0, -0.533017910350517043D0,
     + -0.552518579171327837D0,
     4 -0.250852799957625633D0,  0.376671040883367961D0,
     +  0.289681547873183579D0,  0.345509268642835973D0,
     +  0.307485624105918898D0,
     5 -0.166498262462426147D0,  0.736719168688070997D-01,
     + -0.182708944530430906D0, -0.609527575959959485D-02,
     +  0.124276546477221417D0/

      DATA ((VEX(J,I2),I2=11,12),J=1,5)
     1/ 0.543935549074644184D0  , 0.282577951934201557D0  ,
     2  0.478104193435539837D-01, 0.456540211213636001D-01,
     3  0.161601990099711323D0  ,-0.145844342725903978D0  ,
     4 -0.806937572581633192D0  ,-0.451687199603527226D0  ,
     5  0.156795513350776114D0  , 0.832330170572528699D0/

      CALL HEADER('F500',0)
      LTEST=.TRUE.
C
C     Set intermediate stage printing on/off
      IF (LOUT .EQ. 6) THEN
         IOUT=1
      ELSE
         IOUT=0
      ENDIF
C---  Number of functions to test
#if !defined(CERNLIB_DOUBLE)
      NF=1
#endif
#if defined(CERNLIB_DOUBLE)
      NF=2
#endif
C
      DO 200 JF=1,NF

      WRITE(LOUT,'(/7X,''TESTING SUBROUTINE'',5X,A6/)')TFUNC(JF)
      ERMAX=0D0
      RERMAX=0E0
      MA=10
      NV=10
      M=8
      N=5
      MAXV=200
      EPS=1D-13
      REPS=1E-5
C     IOUT=1
      WRITE(LOUT,100)
      WRITE(LOUT,'(1X,I9,5F15.6)') (MM,(A(MM,NN),NN=1,N),MM=1,M)
      WRITE(LOUT,'(1X)')
      DO 111 J1=1,8
      DO 111 J2=1,5
  111 RA(J1,J2)=A(J1,J2)
#if !defined(CERNLIB_DOUBLE)
      CALL LIHOIN(RA,MA,M,N,MAXV,RV,NV,NVEC,EPS,IOUT,RW,IW)
#endif
#if defined(CERNLIB_DOUBLE)
         IF(JF.EQ.1)
     +CALL LIHOIN(RA,MA,M,N,MAXV,RV,NV,NVEC,REPS,IOUT,RW,IW)
         IF(JF.EQ.2)
     +CALL DLHOIN(A,MA,M,N,MAXV,V,NV,NVEC,EPS,IOUT,W,IW)
#endif
      WRITE(LOUT,101)
      DO 1 I = 1,NVEC,5
      DO 2 J = 1,N
      DO 222 II = I,MIN(NVEC,I+4)
      RVEX(J,II)=VEX(J,II)
#if !defined(CERNLIB_DOUBLE)
      RERMAX=MAX( ERMAX,(RV(J,II)-RVEX(J,II))/RVEX(J,II))
#endif
#if defined(CERNLIB_DOUBLE)
         IF(JF.EQ.1)THEN
      RERMAX=MAX(RERMAX,(RV(J,II)-RVEX(J,II))/RVEX(J,II))
      ERMAX=RERMAX
         ELSE
      ERMAX=MAX(ERMAX,(V(J,II)-VEX(J,II))/VEX(J,II))
         ENDIF
#endif
  222 CONTINUE
#if !defined(CERNLIB_DOUBLE)
      WRITE(LOUT,'(1X,I9,5F15.6)') J,(RV(J,I2),I2=I,MIN(NVEC,I+4))
#endif
#if defined(CERNLIB_DOUBLE)
         IF(JF.EQ.1)
     +WRITE(LOUT,'(1X,I9,5F15.6)') J,(RV(J,I2),I2=I,MIN(NVEC,I+4))
         IF(JF.EQ.2)
     +WRITE(LOUT,'(1X,I9,5F15.6)') J,(V(J,I2),I2=I,MIN(NVEC,I+4))
#endif
    2 CONTINUE
    1 WRITE(LOUT,'(1X)')
      WRITE(LOUT,102)
      WRITE(LOUT,'(1X,9X,8I8)') (IW(MM,1),MM=1,M)
#if !defined(CERNLIB_DOUBLE)
         ETOL=TOL(JF+1)
#endif
#if defined(CERNLIB_DOUBLE)
         ETOL=TOL(JF  )
#endif
      WRITE(LOUT,'(1X)')
        LTEST=LTEST.AND.(ERMAX.LE.ETOL)
#if defined(CERNLIB_DOUBLE)
         IF(JF.EQ.2)THEN
      WRITE(LOUT,'(/7X,''Largest DLHOIN Error was'',1P,D10.1)')ERMAX
         ELSE
      WRITE(LOUT,'(/7X,''Largest LIHOIN Error was'',1P,D10.1)')RERMAX
         ENDIF
#endif
#if !defined(CERNLIB_DOUBLE)
      WRITE(LOUT,'(/7X,''Largest LIHOIN Error was'',1P,D10.1)') ERMAX
#endif
200   CONTINUE
      WRITE(LOUT,'(/7X,''TESTING ERROR MESSAGES:''/)')
#if !defined(CERNLIB_VAX)
      CALL LIHOIN(A,MA,M,N,0,V,NV,NVEC,EPS,IOUT,W,IW)
#endif
#if (defined(CERNLIB_DOUBLE))&&(!defined(CERNLIB_VAX))
      CALL DLHOIN(A,MA,M,N,0,V,NV,NVEC,EPS,IOUT,W,IW)
#endif
      DO 3 NN = 1,N
      RA(1,NN)=0
    3 A(1,NN)=0
      CALL LIHOIN(RA,MA,M,N,MAXV,RV,NV,NVEC,REPS,IOUT,RW,IW)
#if defined(CERNLIB_DOUBLE)
      CALL DLHOIN(A,MA,M,N,MAXV,V,NV,NVEC,EPS,IOUT,W,IW)
#endif
  100 FORMAT(1X,10X,'THE MATRIX OF COEFFICIENTS'/)
  101 FORMAT(1X,10X,'THE BASIS VECTORS FOR THE SOLUTION CONE'/)
  102 FORMAT(/1X,10X,'THE VECTOR SHOWING REDUNDANT INEQUALITIES'/)

      WRITE(LOUT,'(1X)')
      IRC=ITEST('F500',LTEST)
      CALL PAGEND('F500')
      RETURN
      END

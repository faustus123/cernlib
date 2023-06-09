*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:02:14  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
#if !defined(CERNLIB_DOUBLE)
      FUNCTION RGMLT1(FSUB1,A,B,NI,NG,X)
#endif
#if defined(CERNLIB_DOUBLE)
      FUNCTION DGMLT1(FSUB1,A,B,NI,NG,X)
#include "gen/imp64.inc"
#endif

      CHARACTER NAME*(*)
      CHARACTER*80 ERRTXT
#if !defined(CERNLIB_DOUBLE)
      PARAMETER (NAME = 'RGMLT1')
#endif
#if defined(CERNLIB_DOUBLE)
      PARAMETER (NAME = 'DGMLT1')
#endif
      PARAMETER (Z1 = 1, HALF = Z1/2)

      DIMENSION X(6),W(14),T(14),V(64),U(64),F(64)

      DATA (T(I),W(I),I=1,14)
     1/-0.93246 95142 03152 028D0, 0.17132 44923 79170 345D0,
     2 -0.66120 93864 66264 514D0, 0.36076 15730 48138 608D0,
     3 -0.23861 91860 83196 909D0, 0.46791 39345 72691 047D0,
     4  0.23861 91860 83196 909D0, 0.46791 39345 72691 047D0,
     5  0.66120 93864 66264 514D0, 0.36076 15730 48138 608D0,
     6  0.93246 95142 03152 028D0, 0.17132 44923 79170 345D0,
     7 -0.96028 98564 97536 232D0, 0.10122 85362 90376 259D0,
     8 -0.79666 64774 13626 740D0, 0.22238 10344 53374 471D0,
     9 -0.52553 24099 16328 986D0, 0.31370 66458 77887 287D0,
     A -0.18343 46424 95649 805D0, 0.36268 37833 78361 983D0,
     B  0.18343 46424 95649 805D0, 0.36268 37833 78361 983D0,
     C  0.52553 24099 16328 986D0, 0.31370 66458 77887 287D0,
     D  0.79666 64774 13626 740D0, 0.22238 10344 53374 471D0,
     E  0.96028 98564 97536 232D0, 0.10122 85362 90376 259D0/

      IF(NI .LE. 0) THEN
       WRITE(ERRTXT,101) NI
       CALL MTLPRT(NAME,'D110.1',ERRTXT)
       STOP
      END IF
      M0=NG
      IF(M0 .NE. 8) M0=6
      I0=0
      IF(M0 .EQ. 8) I0=6
      D=(B-A)/NI
      R=HALF*D
      RA=R+A
      MV=MOD(M0*NI-1,64)+1
      S=0
      J=0
      DO 1 I = 1+I0,M0+I0
      RTA=R*T(I)+RA
      DO 2 K = 1,NI
      J=J+1
      V(J)=W(I)
      U(J)=RTA+(K-1)*D
      IF(J .EQ. MV) THEN
       CALL FSUB1(MV,U,F,X)
       DO 3 J = 1,MV
    3  S=S+V(J)*F(J)
       MV=64
       J=0
      END IF
    2 CONTINUE
    1 CONTINUE
#if !defined(CERNLIB_DOUBLE)
      RGMLT1=R*S
#endif
#if defined(CERNLIB_DOUBLE)
      DGMLT1=R*S
#endif
      RETURN
  101 FORMAT('N1 = ',I4,' <= 0')
      END
#if !defined(CERNLIB_DOUBLE)
      FUNCTION RGMLT2(FSUB2,A,B,NI,NG,X)
#endif
#if defined(CERNLIB_DOUBLE)
      FUNCTION DGMLT2(FSUB2,A,B,NI,NG,X)
#include "gen/imp64.inc"
#endif

      CHARACTER NAME*(*)
      CHARACTER*80 ERRTXT
#if !defined(CERNLIB_DOUBLE)
      PARAMETER (NAME = 'RGMLT2')
#endif
#if defined(CERNLIB_DOUBLE)
      PARAMETER (NAME = 'DGMLT2')
#endif
      PARAMETER (Z1 = 1, HALF = Z1/2)

       DIMENSION X(6),W(14),T(14),V(64),U(64),F(64)

      DATA (T(I),W(I),I=1,14)
     1/-0.93246 95142 03152 028D0, 0.17132 44923 79170 345D0,
     2 -0.66120 93864 66264 514D0, 0.36076 15730 48138 608D0,
     3 -0.23861 91860 83196 909D0, 0.46791 39345 72691 047D0,
     4  0.23861 91860 83196 909D0, 0.46791 39345 72691 047D0,
     5  0.66120 93864 66264 514D0, 0.36076 15730 48138 608D0,
     6  0.93246 95142 03152 028D0, 0.17132 44923 79170 345D0,
     7 -0.96028 98564 97536 232D0, 0.10122 85362 90376 259D0,
     8 -0.79666 64774 13626 740D0, 0.22238 10344 53374 471D0,
     9 -0.52553 24099 16328 986D0, 0.31370 66458 77887 287D0,
     A -0.18343 46424 95649 805D0, 0.36268 37833 78361 983D0,
     B  0.18343 46424 95649 805D0, 0.36268 37833 78361 983D0,
     C  0.52553 24099 16328 986D0, 0.31370 66458 77887 287D0,
     D  0.79666 64774 13626 740D0, 0.22238 10344 53374 471D0,
     E  0.96028 98564 97536 232D0, 0.10122 85362 90376 259D0/

      IF(NI .LE. 0) THEN
       WRITE(ERRTXT,101) NI
       CALL MTLPRT(NAME,'D110.1',ERRTXT)
      END IF
      M0=NG
      IF(M0 .NE. 8) M0=6
      I0=0
      IF(M0 .EQ. 8) I0=6
      D=(B-A)/NI
      R=HALF*D
      RA=R+A
      MV=MOD(M0*NI-1,64)+1
      S=0
      J=0
      DO 1 I = 1+I0,M0+I0
      RTA=R*T(I)+RA
      DO 2 K = 1,NI
      J=J+1
      V(J)=W(I)
      U(J)=RTA+(K-1)*D
      IF(J .EQ. MV) THEN
       CALL FSUB2(MV,U,F,X)
       DO 3 J = 1,MV
    3  S=S+V(J)*F(J)
       MV=64
       J=0
      END IF
    2 CONTINUE
    1 CONTINUE
#if !defined(CERNLIB_DOUBLE)
      RGMLT2=R*S
#endif
#if defined(CERNLIB_DOUBLE)
      DGMLT2=R*S
#endif
      RETURN
  101 FORMAT('N2 = ',I4,' <= 0')
      END
#if !defined(CERNLIB_DOUBLE)
      FUNCTION RGMLT3(FSUB3,A,B,NI,NG,X)
#endif
#if defined(CERNLIB_DOUBLE)
      FUNCTION DGMLT3(FSUB3,A,B,NI,NG,X)
#include "gen/imp64.inc"
#endif
      CHARACTER NAME*(*)
      CHARACTER*80 ERRTXT
#if !defined(CERNLIB_DOUBLE)
      PARAMETER (NAME = 'RGMLT3')
#endif
#if defined(CERNLIB_DOUBLE)
      PARAMETER (NAME = 'DGMLT3')
#endif
      PARAMETER (Z1 = 1, HALF = Z1/2)

      DIMENSION X(6),W(14),T(14),V(64),U(64),F(64)

      DATA (T(I),W(I),I=1,14)
     1/-0.93246 95142 03152 028D0, 0.17132 44923 79170 345D0,
     2 -0.66120 93864 66264 514D0, 0.36076 15730 48138 608D0,
     3 -0.23861 91860 83196 909D0, 0.46791 39345 72691 047D0,
     4  0.23861 91860 83196 909D0, 0.46791 39345 72691 047D0,
     5  0.66120 93864 66264 514D0, 0.36076 15730 48138 608D0,
     6  0.93246 95142 03152 028D0, 0.17132 44923 79170 345D0,
     7 -0.96028 98564 97536 232D0, 0.10122 85362 90376 259D0,
     8 -0.79666 64774 13626 740D0, 0.22238 10344 53374 471D0,
     9 -0.52553 24099 16328 986D0, 0.31370 66458 77887 287D0,
     A -0.18343 46424 95649 805D0, 0.36268 37833 78361 983D0,
     B  0.18343 46424 95649 805D0, 0.36268 37833 78361 983D0,
     C  0.52553 24099 16328 986D0, 0.31370 66458 77887 287D0,
     D  0.79666 64774 13626 740D0, 0.22238 10344 53374 471D0,
     E  0.96028 98564 97536 232D0, 0.10122 85362 90376 259D0/

      IF(NI .LE. 0) THEN
       WRITE(ERRTXT,101) NI
       CALL MTLPRT(NAME,'D110.1',ERRTXT)
       STOP
      END IF
      M0=NG
      IF(M0 .NE. 8) M0=6
      I0=0
      IF(M0 .EQ. 8) I0=6
      D=(B-A)/NI
      R=HALF*D
      RA=R+A
      MV=MOD(M0*NI-1,64)+1
      S=0
      J=0
      DO 1 I = 1+I0,M0+I0
      RTA=R*T(I)+RA
      DO 2 K = 1,NI
      J=J+1
      V(J)=W(I)
      U(J)=RTA+(K-1)*D
      IF(J .EQ. MV) THEN
       CALL FSUB3(MV,U,F,X)
       DO 3 J = 1,MV
    3  S=S+V(J)*F(J)
       MV=64
       J=0
      END IF
    2 CONTINUE
    1 CONTINUE
#if !defined(CERNLIB_DOUBLE)
      RGMLT3=R*S
#endif
#if defined(CERNLIB_DOUBLE)
      DGMLT3=R*S
#endif
      RETURN
  101 FORMAT('N3 = ',I4,' <= 0')
      END
#if !defined(CERNLIB_DOUBLE)
      FUNCTION RGMLT4(FSUB4,A,B,NI,NG,X)
#endif
#if defined(CERNLIB_DOUBLE)
      FUNCTION DGMLT4(FSUB4,A,B,NI,NG,X)
#include "gen/imp64.inc"
#endif
      CHARACTER NAME*(*)
      CHARACTER*80 ERRTXT
#if !defined(CERNLIB_DOUBLE)
      PARAMETER (NAME = 'RGMLT4')
#endif
#if defined(CERNLIB_DOUBLE)
      PARAMETER (NAME = 'DGMLT4')
#endif
      PARAMETER (Z1 = 1, HALF = Z1/2)

      DIMENSION X(6),W(14),T(14),V(64),U(64),F(64)

      DATA (T(I),W(I),I=1,14)
     1/-0.93246 95142 03152 028D0, 0.17132 44923 79170 345D0,
     2 -0.66120 93864 66264 514D0, 0.36076 15730 48138 608D0,
     3 -0.23861 91860 83196 909D0, 0.46791 39345 72691 047D0,
     4  0.23861 91860 83196 909D0, 0.46791 39345 72691 047D0,
     5  0.66120 93864 66264 514D0, 0.36076 15730 48138 608D0,
     6  0.93246 95142 03152 028D0, 0.17132 44923 79170 345D0,
     7 -0.96028 98564 97536 232D0, 0.10122 85362 90376 259D0,
     8 -0.79666 64774 13626 740D0, 0.22238 10344 53374 471D0,
     9 -0.52553 24099 16328 986D0, 0.31370 66458 77887 287D0,
     A -0.18343 46424 95649 805D0, 0.36268 37833 78361 983D0,
     B  0.18343 46424 95649 805D0, 0.36268 37833 78361 983D0,
     C  0.52553 24099 16328 986D0, 0.31370 66458 77887 287D0,
     D  0.79666 64774 13626 740D0, 0.22238 10344 53374 471D0,
     E  0.96028 98564 97536 232D0, 0.10122 85362 90376 259D0/

      IF(NI .LE. 0) THEN
       WRITE(ERRTXT,101) NI
       CALL MTLPRT(NAME,'D110.1',ERRTXT)
       STOP
      END IF
      M0=NG
      IF(M0 .NE. 8) M0=6
      I0=0
      IF(M0 .EQ. 8) I0=6
      D=(B-A)/NI
      R=HALF*D
      RA=R+A
      MV=MOD(M0*NI-1,64)+1
      S=0
      J=0
      DO 1 I = 1+I0,M0+I0
      RTA=R*T(I)+RA
      DO 2 K = 1,NI
      J=J+1
      V(J)=W(I)
      U(J)=RTA+(K-1)*D
      IF(J .EQ. MV) THEN
       CALL FSUB4(MV,U,F,X)
       DO 3 J = 1,MV
    3  S=S+V(J)*F(J)
       MV=64
       J=0
      END IF
    2 CONTINUE
    1 CONTINUE
#if !defined(CERNLIB_DOUBLE)
      RGMLT4=R*S
#endif
#if defined(CERNLIB_DOUBLE)
      DGMLT4=R*S
#endif
      RETURN
  101 FORMAT('N4 = ',I4,' <= 0')
      END
#if !defined(CERNLIB_DOUBLE)
      FUNCTION RGMLT5(FSUB5,A,B,NI,NG,X)
#endif
#if defined(CERNLIB_DOUBLE)
      FUNCTION DGMLT5(FSUB5,A,B,NI,NG,X)
#include "gen/imp64.inc"
#endif
      CHARACTER NAME*(*)
      CHARACTER*80 ERRTXT
#if !defined(CERNLIB_DOUBLE)
      PARAMETER (NAME = 'RGMLT5')
#endif
#if defined(CERNLIB_DOUBLE)
      PARAMETER (NAME = 'DGMLT5')
#endif
      PARAMETER (Z1 = 1, HALF = Z1/2)

      DIMENSION X(6),W(14),T(14),V(64),U(64),F(64)

      DATA (T(I),W(I),I=1,14)
     1/-0.93246 95142 03152 028D0, 0.17132 44923 79170 345D0,
     2 -0.66120 93864 66264 514D0, 0.36076 15730 48138 608D0,
     3 -0.23861 91860 83196 909D0, 0.46791 39345 72691 047D0,
     4  0.23861 91860 83196 909D0, 0.46791 39345 72691 047D0,
     5  0.66120 93864 66264 514D0, 0.36076 15730 48138 608D0,
     6  0.93246 95142 03152 028D0, 0.17132 44923 79170 345D0,
     7 -0.96028 98564 97536 232D0, 0.10122 85362 90376 259D0,
     8 -0.79666 64774 13626 740D0, 0.22238 10344 53374 471D0,
     9 -0.52553 24099 16328 986D0, 0.31370 66458 77887 287D0,
     A -0.18343 46424 95649 805D0, 0.36268 37833 78361 983D0,
     B  0.18343 46424 95649 805D0, 0.36268 37833 78361 983D0,
     C  0.52553 24099 16328 986D0, 0.31370 66458 77887 287D0,
     D  0.79666 64774 13626 740D0, 0.22238 10344 53374 471D0,
     E  0.96028 98564 97536 232D0, 0.10122 85362 90376 259D0/

      IF(NI .LE. 0) THEN
       WRITE(ERRTXT,101) NI
       CALL MTLPRT(NAME,'D110.1',ERRTXT)
       STOP
      END IF
      M0=NG
      IF(M0 .NE. 8) M0=6
      I0=0
      IF(M0 .EQ. 8) I0=6
      D=(B-A)/NI
      R=HALF*D
      RA=R+A
      MV=MOD(M0*NI-1,64)+1
      S=0
      J=0
      DO 1 I = 1+I0,M0+I0
      RTA=R*T(I)+RA
      DO 2 K = 1,NI
      J=J+1
      V(J)=W(I)
      U(J)=RTA+(K-1)*D
      IF(J .EQ. MV) THEN
       CALL FSUB5(MV,U,F,X)
       DO 3 J = 1,MV
    3  S=S+V(J)*F(J)
       MV=64
       J=0
      END IF
    2 CONTINUE
    1 CONTINUE
#if !defined(CERNLIB_DOUBLE)
      RGMLT5=R*S
#endif
#if defined(CERNLIB_DOUBLE)
      DGMLT5=R*S
#endif
      RETURN
  101 FORMAT('N5 = ',I4,' <= 0')
      END
#if !defined(CERNLIB_DOUBLE)
      FUNCTION RGMLT6(FSUB6,A,B,NI,NG,X)
#endif
#if defined(CERNLIB_DOUBLE)
      FUNCTION DGMLT6(FSUB6,A,B,NI,NG,X)
#include "gen/imp64.inc"
#endif
      CHARACTER NAME*(*)
      CHARACTER*80 ERRTXT
#if !defined(CERNLIB_DOUBLE)
      PARAMETER (NAME = 'RGMLT6')
#endif
#if defined(CERNLIB_DOUBLE)
      PARAMETER (NAME = 'DGMLT6')
#endif
      PARAMETER (Z1 = 1, HALF = Z1/2)

      DIMENSION X(6),W(14),T(14),V(64),U(64),F(64)

      DATA (T(I),W(I),I=1,14)
     1/-0.93246 95142 03152 028D0, 0.17132 44923 79170 345D0,
     2 -0.66120 93864 66264 514D0, 0.36076 15730 48138 608D0,
     3 -0.23861 91860 83196 909D0, 0.46791 39345 72691 047D0,
     4  0.23861 91860 83196 909D0, 0.46791 39345 72691 047D0,
     5  0.66120 93864 66264 514D0, 0.36076 15730 48138 608D0,
     6  0.93246 95142 03152 028D0, 0.17132 44923 79170 345D0,
     7 -0.96028 98564 97536 232D0, 0.10122 85362 90376 259D0,
     8 -0.79666 64774 13626 740D0, 0.22238 10344 53374 471D0,
     9 -0.52553 24099 16328 986D0, 0.31370 66458 77887 287D0,
     A -0.18343 46424 95649 805D0, 0.36268 37833 78361 983D0,
     B  0.18343 46424 95649 805D0, 0.36268 37833 78361 983D0,
     C  0.52553 24099 16328 986D0, 0.31370 66458 77887 287D0,
     D  0.79666 64774 13626 740D0, 0.22238 10344 53374 471D0,
     E  0.96028 98564 97536 232D0, 0.10122 85362 90376 259D0/

      IF(NI .LE. 0) THEN
       WRITE(ERRTXT,101) NI
       CALL MTLPRT(NAME,'D110.1',ERRTXT)
       STOP
      END IF
      M0=NG
      IF(M0 .NE. 8) M0=6
      I0=0
      IF(M0 .EQ. 8) I0=6
      D=(B-A)/NI
      R=HALF*D
      RA=R+A
      MV=MOD(M0*NI-1,64)+1
      S=0
      J=0
      DO 1 I = 1+I0,M0+I0
      RTA=R*T(I)+RA
      DO 2 K = 1,NI
      J=J+1
      V(J)=W(I)
      U(J)=RTA+(K-1)*D
      IF(J .EQ. MV) THEN
       CALL FSUB6(MV,U,F,X)
       DO 3 J = 1,MV
    3  S=S+V(J)*F(J)
       MV=64
       J=0
      END IF
    2 CONTINUE
    1 CONTINUE
#if !defined(CERNLIB_DOUBLE)
      RGMLT6=R*S
#endif
#if defined(CERNLIB_DOUBLE)
      DGMLT6=R*S
#endif
      RETURN
  101 FORMAT('N6 = ',I4,' <= 0')
      END

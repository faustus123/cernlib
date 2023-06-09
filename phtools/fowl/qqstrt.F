*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/22 16:42:46  mclareni
* Initial revision
*
*
      SUBROUTINE QQSTRT(JEVT)
C--       SUBROUTINE USED TO INITIALIZE FUNCTION QQRNDM
#if defined(CERNLIB_CDC)
      COMMON / /  NDIMEN, NRAN, SHUFF(100)
     +/TAPES / NTPNCH   ,NTPBIN   ,KONSOL
     +/SHUFFL/ RNO(50)   ,NTNM4    ,NTM2     ,NTM1     ,QQCONS(50) ,TIR
      DATA QQCONS/2.0, 3.0, 5.0, 7.0, 11.0, 13.0, 17.0, 19.0,23.0,
     + 29.0, 31.0, 37.0, 41.0, 43.0, 47.0, 53.0, 59.0, 61.0, 67.0,
     + 71.0, 73.0, 79.0, 83.0, 89.0, 97.0, 101.0, 103.0, 137.0,
     + 109.0, 113.0, 127.0, 131.0, 137.0, 139.0, 149.0, 151.0,
     + 157.0, 163.0, 167.0, 173.0, 179.0, 181.0, 191.0, 193.0, 197.0,
     +  199.0, 211.0, 223.0, 227.0, 229.0/
      DATA INIT/ 0/
      DO 30 I= 1, NRAN
      TIR = JEVT
      IF(INIT.EQ.0) QQCONS(I) = SQRT(QQCONS(I))
      NDEX = 20*(I-1)
      DO 20 K= 1, 20
      X = TIR * QQCONS(I)
      INDEX = NDEX + K
      TIR = TIR + 1
   20 SHUFF(INDEX) = MOD(X,1.0)
   30 CONTINUE
      INIT=1
      WRITE(6,5000)JEVT
      RETURN
 5000 FORMAT('0   RANDOM NUMBER GENERATOR QQRNDM INITIALIZED TO',I9)
#endif
#if !defined(CERNLIB_CDC)
      COMMON
     +/TAPES / NTPIN     ,NTPOUT   ,NTPNCH   ,NTPBIN   ,KONSOL
      IF(JEVT.LE.0) RETURN
#if 0
C     Comment this section out; "which" is obsolete
C     -- Kevin McCarty, for Debian, 26 April 2004
      CALL WHICH(ISIT,VAL)
      WRITE(6,700)JEVT,VAL
  700 FORMAT('0RANDOM NUMBER GENERATOR INITIATED TO',I12,
     +       ' ON MACHINE OF TYPE',A4)
      IF(ISIT.GT.4) GOTO 100
C--     CDC   60-BIT WORD
CDC                             )B10000000000000007171 .RO.  TVEJ( = POL
      GOTO 200
#endif
  100 CONTINUE
C         FOR -CDC JUST MAKE SURE IT IS ODD
      IGLOP = JEVT
      IF(MOD(JEVT,2).EQ.0) IGLOP=IGLOP+1
  200 CONTINUE
      CALL NRANIN(IGLOP)
      RETURN
#endif
      END

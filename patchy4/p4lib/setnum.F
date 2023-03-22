CDECK  ID>, SETNUM.
      SUBROUTINE SETNUM (JNEW,NUMDIG,NUMBCD)

C-    CONVERT INTEGER TO 5-CHAR. BCD

      COMMON /QBCD/  IQNUM2(11),IQLETT(26),IQNUM(10),IQPLUS
     +,              IQMINS,IQSTAR,IQSLAS,IQOPEN,IQCLOS,IQDOLL,IQEQU
     +,              IQBLAN,IQCOMA,IQDOT,IQAPO,  IQCROS
C--------------    END CDE                             -----------------  ------
      DIMENSION    JNEW(9),NUMDIG(9),NUMBCD(9)
      DIMENSION    NUMVAL(9)
      EQUIVALENCE (NUMVAL(1),IQNUM(2))


      N = JNEW(1)
      L = 5
   21 IF (N.LT.10)           GO TO 24
      NN = N/10
      NP = N - 10*NN
      NUMDIG(L)= NP
      NUMBCD(L)= NUMVAL(NP)
      N  = NN
      L  = L-1
      IF (L.NE.1)            GO TO 21                                   -A8
C     IF (L.NE.2)            GO TO 21                                    A8

   24 NUMDIG(L)= N
      NUMBCD(L)= NUMVAL(N)
   27 L  = L-1
      IF (L.EQ.0)            RETURN
      NUMDIG(L)= 0
      NUMBCD(L)= IQBLAN
      GO TO 27
      END

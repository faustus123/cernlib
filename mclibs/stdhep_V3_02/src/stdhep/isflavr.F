
      subroutine ISFLAVR(ID,ifL1,ifL2,ifL3,JSPIN,INDEX)
C
C          THIS subroutine UNPACKS THE IDENT CODE ID=+/-IJKL
C
C          MESONS--
C          I=0, J<=K, +/- IS SIGN FOR J
C          ID=110 FOR PI0, ID=220 FOR ETA, ETC.
C
C          BARYONS--
C          I<=J<=K IN GENERAL
C          J<I<K FOR SECOND STATE ANTISYMMETRIC IN (I,J), EG. L = 2130
C
C          OTHER--
C          ID=1,...,6 FOR QUARKS
C          ID=9 FOR GLUON
C          ID=10 FOR PHOTON
C          ID=11,...,16 FOR LEPTONS
C          ID=20 FOR KS, ID=-20 FOR KL
C
C          I=21...26 FOR SCALAR QUARKS
C          I=29 FOR GLUINO
C          I=30 FOR PHOTINO
C          I=31...36 FOR SCALAR LEPTONS
C          I=39 FOR WINO
C          I=40 FOR ZINO
C
C          ID=80 FOR W+
C          ID=81,...,89 FOR HIGGS MESONS
C          ID=90 FOR Z0
C
C          DIQUARKS--
C          ID=+/-IJ00, I<J FOR DIQUARK COMPOSED OF I,J.
C
C          INDEX IS A SEQUENCE NUMBER USED INTERNALLY
C
C  5/11/92  LAG  Modified ISAJET original function 
C                return INDEX=0 for illegal particles
C  2/23/94  LAG  OBSOLETE - use ISAJET FLAVOR subroutine
C
#include "itapes.inc"
#include "qlmass.inc"
#include "stdlun.inc"
C
C  issue warning and exit - 2/23/94
C
      write(lnhout,1001)
1001  format(' ISFLAVR is obsolete - use FLAVOR from ISAJET')
      GO TO 400
      IDABS=IABS(ID)
      I=IDABS/1000
      J=MOD(IDABS/100,10)
      K=MOD(IDABS/10,10)
      JSPIN=MOD(IDABS,10)
      if(ID.NE.0.AND.MOD(ID,100).EQ.0) GO TO 300
      if(J.EQ.0) GO TO 200
      if(I.EQ.0) GO TO 100
C          BARYONS
C          ONLY X,Y BARYONS ARE QQX, QQY, Q=U,D,S.
      if(J.EQ.9 .OR. K.EQ.9 .OR. I.EQ.9 .OR. K.EQ.0) GO TO 400
      if(JSPIN.GT.1) GO TO 400
      if(J.GT.K .OR. I.GT.K) GO TO 400
      if(I.EQ.K .AND. J.NE.K) GO TO 400
      ifL1=isign(I,ID)
      ifL2=isign(J,ID)
      ifL3=isign(K,ID)
      if(K.LE.6) then
        INDEX=MAX0(I-1,J-1)**2+I+MAX0(I-J,0)+(K-1)*K*(2*K-1)/6
     1  +109*JSPIN+36*NMES+NQLEP+11
      else
        if(I.GT.3 .OR. J.GT.3) GO TO 400
        INDEX=MAX0(I-1,J-1)**2+I+MAX0(I-J,0)+9*(K-7)+91
     1  +109*JSPIN+36*NMES+NQLEP+11
      endif
      return
C          MESONS
100   CONTINUE
      if(J.EQ.9 .OR. K.EQ.9 .OR. K.EQ.0) GO TO 400
      if(JSPIN.GT.1) GO TO 400
      if(J.GT.K) GO TO 400
      if(J.EQ.K .AND. ID.LT.0) GO TO 400
      ifL1=0
      ifL2=isign(J,ID)
      ifL3=isign(K,-ID)
      INDEX=J+K*(K-1)/2+36*JSPIN+NQLEP
      INDEX=INDEX+11
      return
C          QUARKS, LEPTONS, ETC
200   CONTINUE
      ifL1=0
      ifL2=0
      ifL3=0
      JSPIN=0
      INDEX=IDABS
      if(IDABS.LT.20) return
C          DEFINE INDEX=20 FOR KS, INDEX=21 FOR KL
      INDEX=IDABS+1
      if(ID.EQ.20) INDEX=20
C          INDEX=NQLEP+1,...,NQLEP+11 FOR W+, HIGGS, Z0
      if(IDABS.LT.80 .AND. IDABS.GT.60) INDEX=0
      if(IDABS.LT.80) return
      INDEX=NQLEP+IDABS-79
      if(IDABS.GT.90) INDEX=0
      return
C          DIQUARKS
300   ifL1=isign(I,ID)
      ifL2=isign(J,ID)
      ifL3=0
      JSPIN=0
      if(I.EQ.0 .OR. J.EQ.0 .OR. I.GT.6 .OR. J.GT.6) GO TO 400
      if(I.GT.J) GO TO 400
      INDEX=109*NBARY+36*NMES+NQLEP+11+I+J*(J-1)/2
      return
C          UNDEFINED
400   ifL1=0
      ifL2=0
      ifL3=0
      JSPIN=0
      INDEX=0
      return
      end

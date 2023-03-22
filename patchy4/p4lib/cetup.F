CDECK  ID>, CETUP.
      SUBROUTINE CETUP

C-    SET UP CETA CONVERSION TABLES

      COMMON /QUNIT/ IQREAD,IQPRNT,IQPR2,IQLOG,IQPNCH,IQTTIN,IQTYPE
     +,              IQDLUN,IQFLUN,IQHLUN,IQCLUN,  NQUSED
      COMMON /COMCET/INILEV,NWCEIN,NCHCEU,NWCEU
     +,              NWCEBA,IPAKCE(5),IPAKKD(5),JPOSA1,MXINHO
     +,              LCESAV(4)
      PARAMETER      (IQBDRO=25, IQBMAR=26, IQBCRI=27, IQBSYS=31)
      COMMON /QBITS/ IQDROP,IQMARK,IQCRIT,IQZIM,IQZIP,IQSYS
                         DIMENSION    IQUEST(30)
                         DIMENSION                 LQ(99), IQ(99), Q(99)
                         EQUIVALENCE (QUEST,IQUEST),    (LQUSER,LQ,IQ,Q)
      COMMON //      QUEST(30),LQUSER(7),LQMAIN,LQSYS(24),LQPRIV(7)
     +,              LQ1,LQ2,LQ3,LQ4,LQ5,LQ6,LQ7,LQSV,LQAN,LQDW,LQUP
      EQUIVALENCE (LORGH,LQPRIV(1)), (LORGI,LQPRIV(2))
     +,           (LXREF,LQPRIV(3)), (LTOCE,LQPRIV(4))
     +,           (LCETA,LQPRIV(7))
C--------------    END CDE                             --------------

      DIMENSION    MMORGH(4),MMORGI(4),MMTOCE(4),MMXREF(4),MMCETA(4)
      DIMENSION    INICET(13)

      DATA  MMORGH / 4HORGH, 0, 0, 260 /
      DATA  MMORGI / 4HORGI, 0, 0, 260 /
      DATA  MMXREF / 4HXREF, 0, 0, 772 /
      DATA  MMTOCE / 4HTOCE, 0, 0, 516 /
      DATA  MMCETA / 4HCETA, 0, 0,3800 /

      DATA  INICET /180,  8,4,0,0,0,       8,4,0,0,0,   1,255/

C-               NWCEBA   IPAKCE           IPAKKD  JPOSA1 MXINHO

C----              INITIALIZE /COMCET/

      CALL VZERO (INILEV,17)
      CALL UCOPY (INICET,NWCEBA,13)
      NCHCEU = 3600
      NWCEU  = 5*NWCEBA

C--                LIFT CETA BUFFER

      CALL LIFTBK (LCETA,0,0,MMCETA(1),0)
      CALL VZERO  (IQ(LCETA+1),MMCETA(4))
      LCETA = LCETA + 1

C----              LIFT TABLE BANKS

      CALL LIFTBK (LORGH,0,0,MMORGH,7)
      LORGH = LORGH + 2

      CALL LIFTBK (LORGI,0,0,MMORGI,7)
      CALL VFILL  (IQ(LORGI+1),MMORGI(4),-1)
      LORGI = LORGI + 2

      CALL LIFTBK (LXREF,0,0,MMXREF,7)
      CALL VZERO  (IQ(LXREF+1),MMXREF(4))
      LXREF = LXREF + 2

      CALL LIFTBK (LTOCE,0,0,MMTOCE,7)
      CALL VZERO  (IQ(LTOCE+1),MMTOCE(4))
      LTOCE = LTOCE + 2

C--------------    READY ORGH + ORGI TABLES    ----------------------

C----              SET BASIC CHARACTERS AS INTEGERS IN CETA ORDER

      CALL UCTOH1 (
     +'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+-*/()$= ,.#''!:"_]&@?[>< ^;'
     +,                      IQ(LORGH+1),63)

      CALL HOLLCV (IQ(LORGH+1),IQ(LORGI+1),63,1)

C--                IMMEDIATE CORRECTIONS


C----              SMALL LETTERS

      DO 24 J=1,26
   24 IQ(LORGI+J+64) = IQ(LORGI+J) + 32


C----              MISSING ASCII CHARACTERS

      IQ(LORGI+61) =  92
      IQ(LORGI+64) =  37
      IQ(LORGI+91) = 123
      IQ(LORGI+92) = 124
      IQ(LORGI+93) = 125
      IQ(LORGI+94) = 126
      IQ(LORGI+95) =  96


C----              CONTROL-CODES

      DO 28 J=1,31
   28 IQ(LORGI+J+192) = J
      IQ(LORGI+224)   = 127



C---------------   READY  TOCE + XREF  TABLES   ---------------------

C--       TOCE TABLE
C--       XREF PART 1 : CETA VALUES THEMSELVES

      DO 43 JJ=1,255
      J     = 256 - JJ
      JINHO = IQ(LORGI+J)
      IF (JINHO.EQ.-1)       GO TO 43
      IQ(LXREF+J)     = J
      IQ(LTOCE+JINHO) = J
   43 CONTINUE

C--       XREF PART 2 : ASSOCIATED   UP UP N  SYMBOL

      LX2 = LXREF + 256

      IQ(LX2+64) = 61
      IQ(LX2+91) = 60
      IQ(LX2+92) = 55
      IQ(LX2+93) = 59
      IQ(LX2+94) = 56
      IQ(LX2+95) = 63

      DO 47 J=1,36
   47 IQ(LX2+J+192) = J

C--       XREF PART 3 : INVERSE CETA POINTERS

      LX3 = LXREF + 512

      DO 49 JJ=64,255
      J = IQ(LX2+JJ)
   49 IQ(LX3+J) = JJ
      IQ(LX3)   = 0

C--       MARK THE ESCAPE CHARACTER  UP UP

      IQ(LXREF+62) = 1062

      RETURN
      END

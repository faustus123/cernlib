CDECK  ID>, KDNEXTVX.
      SUBROUTINE KDNEXT (MV)

C-    READ NEXT CARD FROM LUNPAM AND PACK IT STARTING AT MV(1)
C-    RETURN  NCHKD= NO. OF CHARACTERS,  NWKD= NO. OF WORDS
C-    OR  NCHKD= -3 EOI
C-    NCARDP  COUNTS THE NUMBER OF CARDS IN THE FILE

      COMMON /QUNIT/ IQREAD,IQPRNT,IQPR2,IQLOG,IQPNCH,IQTTIN,IQTYPE
     +,              IQDLUN,IQFLUN,IQHLUN,IQCLUN,  NQUSED
      COMMON /ARRCOM/LUNPAM,NCHKD,NWKD,NCARDP,NAREOF,NSKIPR,KDHOLD(20)
     +,              NTRUNC,IPROMU,IPROMI
C--------------    END CDE                             --------------
      DIMENSION    MV(20), KKK(21)
      CHARACTER    KCH*84
      EQUIVALENCE (KCH,KKK)


      IF (IPROMU.NE.0)  WRITE (IQTYPE,9001)
 9001 FORMAT (' y> ',$)

      IF (NTRUNC.EQ.72)  THEN
          NX = 72
        ELSE
          NX = 80
        ENDIF

      READ (LUNPAM,8000,END=41)  KCH(1:NX)
 8000 FORMAT (A)
      NCH = 80
      NCH    = MIN(NCH,NX)
      NCARDP = NCARDP + 1
      IF (NCH.EQ.0)                GO TO 29

C--                Construct terminator

      NCH = LNBLNK (KCH(1:NCH))
      IF (NCH.EQ.80)               GO TO 28
      KCH(NCH+1:NCH+4) = '    '

      NW = NCH/4 + 1
      IF (NW.EQ.20)                GO TO 28

      NCH = 4*NW
      KCH(NCH:NCH) = CHAR(0)

      DO  27  JL=1,NW
   27 MV(JL) = KKK(JL)
      NCHKD = NCH - 1
      NWKD  = NW
      RETURN

   28 NWKD  = 20
      NCHKD = 80
      CALL UCOPY (KKK,MV,20)
      RETURN

   29 KCH(1:4) = '   ' // CHAR(0)
      NWKD  = 1
      NCHKD = 3
      MV(1) = KKK(1)
      RETURN

C------            EOF

   41 NCHKD = -3
      RETURN
      END

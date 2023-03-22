CDECK  ID>, QSORV.
      SUBROUTINE QSORV (JWORD,NWORDS,KGOP)

C-    SORT BANKS AT KGO SUCH THAT THE 'NWORDS' LONG KEY STRINGS
C-    STARTING AT Q(L+JWORD) ARE IN INCREASING ORDER

      PARAMETER      (IQBDRO=25, IQBMAR=26, IQBCRI=27, IQBSYS=31)
      COMMON /QBITS/ IQDROP,IQMARK,IQCRIT,IQZIM,IQZIP,IQSYS
                         DIMENSION    IQUEST(30)
                         DIMENSION                 LQ(99), IQ(99), Q(99)
                         EQUIVALENCE (QUEST,IQUEST),    (LQUSER,LQ,IQ,Q)
      COMMON /SQK/   KQMAIN,KQT,KQR,KQJ,KQF,KQZ,KQH(4),KQS(8)
      COMMON //      QUEST(30),LQUSER(7),LQMAIN,LQT,LQR,LQJ,LQF,LQZ
     +,              LQH(4),LQS(6),   LQWM,LQWF,LQWZ,LQWSYS(6),LQPRIV(7)
     +,              LQ1,LQ2,LQ3,LQ4,LQ5,LQ6,LQ7,LQSV,LQAN,LQDW,LQUP
C--------------    END CDE                             -----------------  ------
      DIMENSION    JWORD(9), NWORDS(9), KGOP(9)

      REAL         KEYN, KEYPL, KEYNG, KN, KC


      JW    = JWORD(1)
      JWN   = JW-1 + NWORDS(1)
      KGOPL = KGOP(1) + 1
      LN    = KGOPL
      KEYN  = -1.
      KEYNG = 0 .
      KGONG = LQLOCF(LQWM) + 1
      LLNG  = KGONG
      GO TO 23

C--------          +VE IN-SEQUENCE LOOP FOR BANKS WITH +VE KEY
C--                          KEEP GOING FOR INCREASING KEYS

   21 LQ(LLPL-1) = LN
      GO TO 24

   23 KEYPL = KEYN
      LLPL  = LN
      LN    = LQ(LN-1)
      IF (LN.EQ.0)           GO TO 81
      KEYN  =  Q(LN+JW)
      IF (KEYN.LT.0.)        GO TO 61
   24 IF (KEYN-KEYPL)        28,25,23

   25 JSW = 7
      LC  = LLPL
      GO TO 71
   28 LS = KGOPL

C--------          OUT-SEQUENCE LOOP, FIND PLACE FOR BANK IN THE CHAIN
C--                          OF BANKS ALREADY SORTED, +VE OR -VE CHAIN

   41 LNX = LQ(LN-1)
   43 KS  = LS
      LS  = LQ(LS-1)
      IF (KEYN- Q(LS+JW))    48,45,43

   45 JSW = 0
      LC  = LS
      GO TO 71
   48 LQ(LN-1) = LS
      LQ(KS-1) = LN

      IF (LNX.EQ.0)          GO TO 81
      LN   = LNX
      KEYN =  Q(LN+JW)
      IF (KEYN.GE.0.)        GO TO 21

C--------          -VE IN-SEQUENCE LOOP FOR BANKS WITH -VE KEY
C--                          KEEP GOING FOR INCREASING KEYS

   61 LS = KGONG
      LQ(LLNG-1) = LN
      IF (KEYNG.NE.0.)       GO TO 64

   63 KEYNG = KEYN
      LLNG  = LN
      LN    = LQ(LN-1)
      IF (LN.EQ.0)           GO TO 81
      KEYN  =  Q(LN+JW)
      IF (KEYN.GE.0.)        GO TO 21
   64 IF (KEYN-KEYNG)        41,65,63

   65 JSW = -7
      LC  = LLNG
      GO TO 71

C--------          COMPARE 2 STRINGS STARTING WITH THE SAME WORD

   71 J   = JW
   72 J   = J+1
      KC  =  Q(LC+J)
      KN  =  Q(LN+J)

C--                  KN < KC
      IF (KN.GE.0.)          GO TO 74
      IF (KC.GE.0.)          GO TO 79
      GO TO 75

C--                  KN > KC
   74 IF (KC.LT.0.)          GO TO 78

   75 IF   (KN-KC)           79, 76, 78
   76 IF (J.LT.JWN)          GO TO 72

C--                KEYS/N .GE. KEYS/C

   78 IF   (JSW)             63, 43, 23

C--                KEYS/N .LT. KEYS/C

   79 IF   (JSW)             41, 48, 28

C----              FINISHED, LINK +VE AND -VE STREAMS

   81 LQ(LLPL-1) = 0
      LQ(LLNG-1) = LQ(KGOPL-1)
      LQ(KGOPL-1)= LQ(KGONG-1)
      RETURN
      END

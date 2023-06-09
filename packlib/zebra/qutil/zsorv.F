*
* $Id$
*
* $Log$
* Revision 1.3  1999/06/18 13:31:25  couet
* - qcardl.inc was empty: It is now removed and not used.
*   Comment END CDE removed.
*
* Revision 1.2  1996/04/18 16:13:46  mclareni
* Incorporate changes from J.Zoll for version 3.77
*
* Revision 1.1.1.1  1996/03/06 10:47:15  mclareni
* Zebra
*
*
#include "zebra/pilot.h"
      SUBROUTINE ZSORV (IXSTOR,LGOP,JWORD,NWORDS)

C-    SORT BANKS AT LGO SUCH THAT THE 'NWORDS' LONG KEY STRINGS
C-    STARTING AT  Q(L+JWORD) ARE IN INCREASING ORDER

#include "zebra/mqsys.inc"
*
      DIMENSION    JWORD(9), NWORDS(9), LGOP(9)
      REAL         KEYN, KEYPL, KEYNG, KYN, KYC
#if (defined(CERNLIB_QTRHOLL))&&(!defined(CERNLIB_A6M))
      DIMENSION    NAMESR(2)
      DATA  NAMESR / 4HZSOR, 4HV    /
#endif
#if (defined(CERNLIB_QTRHOLL))&&(defined(CERNLIB_A6M))
      DATA  NAMESR / 6HZSORV  /
#endif
#if !defined(CERNLIB_QTRHOLL)
      CHARACTER    NAMESR*8
      PARAMETER   (NAMESR = 'ZSORV   ')
#endif

#include "zebra/q_jbyt.inc"

      LGO = LGOP(1)
      IF (LGO.EQ.0)          RETURN

#include "zebra/qtraceq.inc"
#include "zebra/qstore.inc"

      JW    = JWORD(1)
      JWN   = JW-1 + NWORDS(1)
      IF (JWN.LE.JW)               GO TO 88
      KGONG = LQSTA(KQT+2) - 1
      LLNG  = KGONG
      KGOPL = KGONG - 1
      LLPL  = KGOPL
      KEYPL = -1.
      KEYNG =  0.
      IFL   =  0

      LN    = LGO
      KEYN  =  Q(KQS+LN+JW)
      IF (KEYN.LT.0.)              GO TO 62

C--------          +VE IN-SEQUENCE LOOP FOR BANKS WITH +VE KEY
C--                          KEEP GOING FOR INCREASING KEYS

   21 LQ(KQS+LLPL) = LN
      GO TO 24

   23 KEYPL = KEYN
      LLPL  = LN
      LN    = LQ(KQS+LN)
      IF (LN.EQ.0)                 GO TO 81
      KEYN  =  Q(KQS+LN+JW)
      IF (KEYN.LT.0.)              GO TO 61
   24 IF (KEYN-KEYPL)        28, 25, 23

   25 JSW = 7
      LC  = LLPL
      GO TO 71

   28 LS = KGOPL

C--------          OUT-SEQUENCE LOOP, FIND PLACE FOR BANK IN THE CHAIN
C--                          OF BANKS ALREADY SORTED, +VE OR -VE CHAIN

   41 LNX = LQ(KQS+LN)
      IFL = 7
   43 KS  = LS
      LS  = LQ(KQS+LS)
      IF (KEYN- Q(KQS+LS+JW))   48, 45, 43

   45 JSW = 0
      LC  = LS
      GO TO 71

   48 LQ(KQS+LN) = LS
      LQ(KQS+KS) = LN
      IF (LNX.EQ.0)                GO TO 81
      LN   = LNX
      KEYN =  Q(KQS+LN+JW)
      IF (KEYN.GE.0.)              GO TO 21

C--------          -VE IN-SEQUENCE LOOP FOR BANKS WITH -VE KEY
C--                          KEEP GOING FOR INCREASING KEYS

   61 IFL = 7
   62 LS = KGONG
      LQ(KQS+LLNG) = LN
      IF (KEYNG.NE.0.)             GO TO 64

   63 KEYNG = KEYN
      LLNG  = LN
      LN    = LQ(KQS+LN)
      IF (LN.EQ.0)                 GO TO 81
      KEYN  =  Q(KQS+LN+JW)
      IF (KEYN.GE.0.)              GO TO 21
   64 IF (KEYN-KEYNG)        41, 65, 63

   65 JSW = -7
      LC  = LLNG

C--------          COMPARE 2 STRINGS STARTING WITH THE SAME WORD

   71 J   = JW
   72 J   = J+1
      KYC =  Q(KQS+LC+J)
      KYN =  Q(KQS+LN+J)

C--                  KYN < KYC
      IF (KYN.GE.0.)               GO TO 74
      IF (KYC.GE.0.)               GO TO 79
      GO TO 75

C--                  KYN > KYC
   74 IF (KYC.LT.0.)               GO TO 78

   75 IF   (KYN-KYC)         79, 76, 78
   76 IF (J.LT.JWN)                GO TO 72

C--                KEYS/N .GE. KEYS/C

   78 IF   (JSW)             63, 43, 23

C--                KEYS/N .LT. KEYS/C

   79 IF   (JSW)             41, 48, 28

C----              FINISHED, LINK +VE AND -VE STREAMS, CHAIN K-LINKS

   81 IF (IFL.EQ.0)                GO TO 999
      LQ(KQS+LLPL) = 0
      LQ(KQS+LLNG) = LQ(KQS+KGOPL)

      K = LQ(KQS+LGO+2)
      L = LQ(KQS+KGONG)
      LQ(KQS+L+2) = K
      IF (K.NE.0)  LQ(KQS+K)=L
      LGOP(1) = L

   84 K = L
      L = LQ(KQS+K)
      IF (L.EQ.0)                  GO TO 999
      LQ(KQS+L+2) = K
      GO TO 84

C----              SPECIAL CASE NWORDS=1

   88 CALL ZSORT (IXSTOR,LGOP,JW)

#include "zebra/qtrace99.inc"
      RETURN
      END

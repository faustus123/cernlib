CDECK  ID>, MQEND.
      SUBROUTINE MQEND

      COMMON /MQCMOV/NQSYSS
      COMMON /MQCM/         NQSYSR,NQSYSL,NQLINK,LQWORG,LQWORK,LQTOL
     +,              LQSTA,LQEND,LQFIX,NQMAX, NQRESV,NQMEM,LQADR,LQADR2
      COMMON /QSTATE/QVERSN,NQINIT,NQSTAG(2),NQPHAS,NQERR,QDEBUG,NQDCUT
     +,              NQNEWB,NQAFTB,NQM99,NQLOWB,NQWCUT,NQLOCK,QSTDUM
     +,              NQAUGM(2),NQZIP(8),AQMEM(12)
                         INTEGER QDEBUG
      COMMON /QUNIT/ IQREAD,IQPRNT,IQPR2,IQLOG,IQPNCH,IQTTIN,IQTYPE
     +,              IQDLUN,IQFLUN,IQHLUN,IQCLUN,  NQUSED
      PARAMETER      (IQBDRO=25, IQBMAR=26, IQBCRI=27, IQBSYS=31)
      COMMON /QBITS/ IQDROP,IQMARK,IQCRIT,IQZIM,IQZIP,IQSYS
                         DIMENSION    IQUEST(30)
                         DIMENSION                 LQ(99), IQ(99), Q(99)
                         EQUIVALENCE (QUEST,IQUEST),    (LQUSER,LQ,IQ,Q)
      COMMON //      QUEST(30),LQUSER(7),LQMAIN,LQSYS(24),LQPRIV(7)
     +,              LQ1,LQ2,LQ3,LQ4,LQ5,LQ6,LQ7,LQSV,LQAN,LQDW,LQUP
C--------------    END CDE                             -----------------  ------
      DIMENSION    PRV(12), MEND(3)
      EQUIVALENCE (PRV(1),QUEST(11)), (MEND(1),LQEND)

      CALL UCOPY (AQMEM,PRV,12)

      DO 17 J=1,11,3
      IF (PRV(J).GE.2.)  PRV(J+1)=PRV(J+1)/PRV(J)
   17 CONTINUE

      NQUSED = NQUSED + 7
      WRITE (IQLOG,9017) MEND,PRV
 9017 FORMAT (39H0MQEND.   GARBAGE COLLECTION STATISTICS,9X,18HLQEND,LQF
     FIX,NQMAX=,3I7/25X,28HTIMES     MEAN      MAX GAIN/15X,6HMQWIPE,
     F3F9.0/10X,11HMUST MQGARB,3F9.0/10X,11HFREE MQGARB,3F9.0/
     F10X,11HMEM AUGMENT,3F9.0)


      RETURN
      END

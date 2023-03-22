#!/bin/tcsh -x
exit 0
# Boot-strap Job 2
#
# Before running this script  rceta.sh  one is supposed
# to have done by hand this
#
# *******************************************************************
# *                                                                 *
# *   Job BOOT 1 :  copy the export tape to disk                    *
# *                                                                 *
# *******************************************************************
#
# select density 1600 on the magnetic tape unit
# load tape
# type    ansir
# reply   rceta.sh   for 'file name'         doing file 1
#         ASCII      for 'character code'
#         F          for 'record format'
#         3600       for 'block length'
#         80         for 'record length'
#
# reply   p4inceta   for 'file name'         doing file 2
#         BINARY     for 'character code'
#         U          for 'record format'
#         3600       for 'block length'
#
# *******************************************************************
# *                                                                 *
# *   Job BOOT 2 :  run RCETA                                       *
# *                 to read P4BOOT, P4CRAD, FCASPLIT, P4COMP        *
# *                                                                 *
# *******************************************************************
#
 set clobber
 if (-f rceta.f) rm rceta.f
 tee  <<\\  >rceta.f
      PROGRAM RCETA
C-    PROGRAM RCETA FOR VAX / MIPS
C-                                RCETA FOR PATCHY 4 BOOT-STRAP
      LOGICAL *1     MCHAR
      COMMON /DATARD/MCHAR(3600)
      COMMON /CHARS/ INTERN(255)                                           CHARS
      COMMON /KARD/  KARD(80),KARDEX(80),NCH,NSECT,NRECD,NCARD              KARD
      COMMON /UNITS/ LUNIN,LUNOUT,ISYSIN,ISYSOT                            UNITS
C--------------    END CDE                             --------------
      DIMENSION    INTNOR(47), INTSPE(17), INTSMA(26)
      EQUIVALENCE (INTNOR(1),INTERN(1)), (INTSPE(1),INTERN(48))
      EQUIVALENCE (INTSMA(1),INTERN(65))
C
      DIMENSION    MREC(900)
      EQUIVALENCE (MREC(1),MCHAR(1))
      DATA         IBLANK/4H    /, LETTC/4HC   /, LETTO/4HO   /
      DATA         IQUEST/4H?   /
C
C
C-    SET MAXIMUM NUMBER OF SECTIONS TO BE READ
      NSKIP  = 0
      MAXSEC = 999
      MAXSEC = 4
C
C-    DEFINE I/O UNITS   LUN... DATA, ISYS.. READER/PRINTER
      LUNIN  = 11
      LUNOUT = 20
      ISYSIN = 5
      ISYSOT = 6
C
      OPEN(UNIT=11,FILE='p4inceta',RECL=3600,FORM='UNFORMATTED',
     +     ACCESS='DIRECT')
      OPEN(UNIT=20,FILE='p4boot.sh')
      OPEN(UNIT=21,FILE='p4crad.cra')
      OPEN(UNIT=22,FILE='fcasplit.f')
      OPEN(UNIT=23,FILE='p4comp.fca')
C
C-----     SET UP INTERNAL CHARACTER CODE IN CETA ORDER
C
      DO 12 J=1,255
   12 INTERN(J) = IQUEST
C
   14 READ  (ISYSIN,8000) INTNOR
      IF ((INTERN(1).EQ.LETTC).AND.(INTERN(2).EQ.LETTO))  GO TO 14
      READ  (ISYSIN,8000) INTSMA
      READ  (ISYSIN,8001) INTSPE
C
      INTERN(91) = 123
      INTERN(92) = 124
      INTERN(93) = 125
      INTERN(94) = 126
      INTERN(95) =  96
C
      WRITE (ISYSOT,9001) MAXSEC
      WRITE (ISYSOT,9002) (INTERN(J),J=1,64)
C
      JRECTF = 0
C
C-----             SKIP FILE 1 FOR PATCHY BOOT-STRAP
C
C-    FILE-SKIP ON VMI DONE BY JCL
C
C-----             START NEXT SECTION
C
      NSECT = 0
   31 NSECT = NSECT + 1
      NRECD = 0
      NCARD = 0
      NERRC = 0
      WRITE (ISYSOT,9037) NSECT
 9037 FORMAT (/' Start Section',I5)
C
C
C-----             NEXT RECORD
C
   41 JRECTF = JRECTF + 1
      READ (LUNIN,REC=JRECTF,ERR=61) MREC
   44 NRECD = NRECD + 1
      NERRC = 0
      IF (MREC(1).EQ.0)      GO TO 71
      IF (NSKIP.GT.0)        GO TO 41
C
C--                BLOW UP INTO INDIVIDUAL CHARACTERS
C
C-    NOT ON VMI
C
C--                PICK CARD BY CARD AND TRANSLATE
C
   51 JANEXT = 1
   52 JA     = JANEXT
      CALL TRANSL (JA)
      IF (NCH.EQ.0)          GO TO 41
      JANEXT = JA + NCH + 1
      IF (JANEXT.GT.3600)    GO TO 57
C
      WRITE (LUNOUT,9055) (KARD(J),J=1,NCH)
      IF (NCARD.EQ.0)  THEN
          N = MIN (NCH, 60)
          WRITE (ISYSOT,9056) (KARD(J),J=1,N)
        ENDIF
      NCARD  = NCARD + 1
      GO TO 52
C
C--                Record overshoot
C
   57 WRITE (ISYSOT,9057) JRECTF,JA,NCH
 9057 FORMAT (/'Record',I6,' ends badly with line starting' /
     F '    at MCHAR(JA) of NCH characters,  JA=',I4, '   NCH=',I4/
     F/' Dump the end of the MCHAR vector :')
C
      JA = MAX (JA-120, 0) / 20
      JE = 20*JA
   59 JA = JE + 1
      JE = JE + 20
      WRITE (ISYSOT,9059) JA,(MCHAR(J),J=JA,JE)
 9059 FORMAT (I6,3X,10I4,3X,10I4)
C
      IF (JE.LT.3600)              GO TO 59
      GO TO 81
C
C--                READ ERROR
   61 NERRC = NERRC + 1
      NRECD = NRECD + 1
      WRITE (ISYSOT,9061) NRECD
 9061 FORMAT (/' ******* READ ERROR, skip record',I5)
      IF (NERRC.LT.8)        GO TO 41
      GO TO 68
C
C--                EOF
   65 WRITE (ISYSOT,9065)
 9065 FORMAT (/' ******* UNEXPECTED EOF.')
   68 MAXSEC = -7
C
C------            END OF SECTION
C
   71 IF (NRECD.LT.2)        GO TO 81
      WRITE (ISYSOT,9071) NSECT,NCARD,NRECD
      NSKIP = NSKIP - 1
      IF (NSKIP.GE.0)        GO TO 31
      CLOSE (UNIT=LUNOUT)
      LUNOUT = LUNOUT + 1
      IF (NSECT.LT.MAXSEC)   GO TO 31
C
   81 WRITE (ISYSOT,9081)
      STOP
C
 8000 FORMAT (80A1)
 8001 FORMAT (5X,Z8,5X,Z8,5X,Z8,5X,Z8,5X,Z8)
 9001 FORMAT ('1READ-CETA  version  .',
     + 36HRCETA PAM    5.09  910816 11.36                                   HOLD
     F//' Ready to read',I5,' sections at most.')
 9002 FORMAT (/' Character set used ',64A1/20X,7(10H----.----+)/
     F43X,41H                        NAECQUCAAQOGLRCSP /
     F43X,41H names of               UPXOUNLNTUPREEIEE /
     F43X,41H special characters     MOCLODOD EEESVRMR /
     F43X,41H in vertical            BSLOTES  SNASECIC  )
 9055 FORMAT (80A1)
 9056 FORMAT (22X,60A1)
 9071 FORMAT (/' End of Section',I4,I10,' cards in',I6,' records.')
 9081 FORMAT (/1X,20(1H-),'  STOP.')
      END
      SUBROUTINE TRANSL (JGO)
C
C-    TRANSLATE CETA-CODE STRING STARTING WITH CHARACTER JGO
C
      LOGICAL *1     MCHAR
      COMMON /DATARD/MCHAR(3600)
      COMMON /CHARS/ INTERN(255)                                           CHARS
      COMMON /KARD/  KARD(80),KARDEX(80),NCH,NSECT,NRECD,NCARD              KARD
C--------------    END CDE                             --------------
C
      INTEGER *4   JCETAV
      LOGICAL *1   LHOLD(4),LCETAV
      EQUIVALENCE (JCETAV,LHOLD(1)), (LCETAV,LHOLD(1))
C
      DATA  JCETAV / 0 /
C
      JCH    = JGO - 1
      NCH    = 0
   11 JCH    = JCH + 1
      LCETAV = MCHAR(JCH)
      IF (JCETAV.EQ.0)       GO TO 21

      NCH = NCH + 1
      KARD(NCH) = INTERN(JCETAV)
      IF (NCH.LT.141)        GO TO 11
C
   21 CONTINUE
      RETURN
      END
\\
 gfortran -fno-automatic -o rceta rceta.f
 rceta    <<\\
CODE  INTERNAL A1 REPRESENTATION OF THE CETA SET / LNX
CODE  CARD    1  IN HOLLERITH FOR CETA VALUES  1 - 47
CODE  CARD    2  IN HOLLERITH FOR CETA VALUES 65 - 90
CODE  CARDS 3-6  IN HEX       FOR CETA VALUES 48 - 64
ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+-*/()$= ,.
abcdefghijklmnopqrstuvwxyz
 #48 20202023 '49 20202027 !50 20202021 :51 2020203A "52 20202022
 _53 2020205F ]54 2020205D &55 20202026 @56 20202040 ?57 2020203F
 [58 2020205B >59 2020203E <60 2020203C \61 2020205C ^62 2020205E
 ;63 2020203B  64 20202025
\\
 chmod u+x p4boot.sh
#
#    Please look at the file  p4boot.sh  and continue the Patchy
#    boot-strap by giving the command :
#           csh  -e -v  p4boot.sh  0   >&p4boot.log

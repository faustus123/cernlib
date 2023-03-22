CDECK  ID>, FLPARA.
      SUBROUTINE FLPARA (NFILEP,NAMEIP,CHTXOP)

      COMMON /SLATE/ NDSLAT,NESLAT,NFSLAT,NGSLAT,MMSLAT(36)
      COMMON /QBCD/  IQNUM2(11),IQLETT(26),IQNUM(10),IQPLUS
     +,              IQMINS,IQSTAR,IQSLAS,IQOPEN,IQCLOS,IQDOLL,IQEQU
     +,              IQBLAN,IQCOMA,IQDOT,IQAPO,  IQCROS
      COMMON /QUNIT/ IQREAD,IQPRNT,IQPR2,IQLOG,IQPNCH,IQTTIN,IQTYPE
     +,              IQDLUN,IQFLUN,IQHLUN,IQCLUN,  NQUSED
      COMMON /ARRCOM/LUNPAM,NCHKD,NWKD,NCARDP,NAREOF,NSKIPR,KDHOLD(20)
     +,              NTRUNC,IPROMU,IPROMI
      COMMON /CCPARA/NCHCCD,NCHCCT,KARDCC(84),   JCCTYP,JCCPRE,JCCEND
     +,              MCCPAR(120),NCCPAR,MXCCIF,JCCIFV,JCCBAD,JCCWK(4)
     +,              JCCPP,JCCPD,JCCPZ,JCCPT,JCCPIF,JCCPC,JCCPN
     +,              NCCPP,NCCPD,NCCPZ,NCCPT,NCCPIF,NCCPC,NCCPN
      COMMON /LUNSLN/NSTRM,NBUFCI,LUNVL(3),LUNVN(9),NOPTVL(4),NCHCH(6)
      COMMON /IOFCOM/IOTALL,IOTOFF,IOTON,IOSPEC,IOPARF(5),IOMODE(12)

      PARAMETER   (NCNAME=48)
          CHARACTER    NAMEIN(13)*(NCNAME), EXTSTO(20)*4
          CHARACTER    COMD*256, CHSTRM*6,  CHWK2*2
      PARAMETER      (IQBDRO=25, IQBMAR=26, IQBCRI=27, IQBSYS=31)
      COMMON /QBITS/ IQDROP,IQMARK,IQCRIT,IQZIM,IQZIP,IQSYS
                         DIMENSION    IQUEST(30)
                         DIMENSION                 LQ(99), IQ(99), Q(99)
                         EQUIVALENCE (QUEST,IQUEST),    (LQUSER,LQ,IQ,Q)
      COMMON //      QUEST(30),LQUSER(7),LQMAIN,LQSYS(24),LQPRIV(7)
     +,              LQ1,LQ2,LQ3,LQ4,LQ5,LQ6,LQ7,LQSV,LQAN,LQDW,LQUP
     +,    LUNORG,LUNMOD, LSTRM,  NOPTPR(8)
     +,    LUNUSE,LUNDES,LUNBAK,LUNFLG,  MUSE(200)
     +,    NAMEIN, EXTSTO, COMD, CHSTRM, CHWK2, MSPACE(2000)
                   PARAMETER (NTEXT=128, NLINE=256)
                   CHARACTER  IDPROG*8,  HOMED*48
                   CHARACTER  LINECC*(NLINE), LINEUP*(NLINE)
                   CHARACTER  CHDEF*8,   CHTERM*4,   CHEXT*8
                   CHARACTER  TEXT*(NTEXT), FILEST(13)*(NTEXT)
      COMMON /FLKRAC/IFLDIA, INTACT, KINDPA, IFLBAK, JFAULT, NLCUM
     +,              JLINC,JLINT, NTXT, LUNOP, NHOMED, HOMED, IDPROG
     +,              LINECC,LINEUP, CHDEF,CHTERM, CHEXT,TEXT, FILEST
C--------------    END CDE                             --------------
      CHARACTER    CHTXOP*(*), NAMEIP(NFILEP)*(NCNAME)
      PARAMETER   (NWSTOR=4)

      LOGICAL      INTRAC


      CALL MQINIT (MSPACE(2000))
      IFLDIA = 7

      NFILE = NFILEP
      DO 12  J=1,NFILE
      NAMEIN(J) = NAMEIP(J)
   12 FILEST(J) = ' '

      LTXOP  = LEN (CHTXOP) - 1
      IDPROG = CHTXOP(1:8)

      COMD = IDPROG // CHAR(39)
      NCMD = 9
      CALL CUTOL (COMD(1:9))

      CALL VZERO  (NSTRM,24)
      CALL VBLANK (KARDCC,84)
      CALL VBLANK (NOPTPR,8)
      NOPTVL(4) = 131072
      IPROMI = 0
      IFLGOS = 0
      INIPRO = 0

C--                Get the home directory

      NHOMED = 0
      HOMED  = ' '
      CALL GETENVF ('HOME ', HOMED)
      N = LNBLNK (HOMED)
      IF (N.GT.0)  THEN
          IF (HOMED(N:N).NE.'/') THEN
              N = N + 1
              HOMED(N:N) = '/'
            ENDIF
          NHOMED = N
        ENDIF

C--                Is the user on-line ?

      INTACT = 0
      IF (INTRAC())  INTACT=7
      INTPRI = INTACT

C--                No dialogue printing if .GO on program statement

      NARGS = IARGC()
      IF (NARGS.EQ.0)              GO TO 17
      IF (NARGS.GT.NFILE)          GO TO 16

      LINECC = ' '
      JARG = NARGS
      CALL GETARG (JARG,LINECC)
      JLINT = LNBLNK (LINECC)
      IF (JLINT.LT.3)              GO TO 17
      CHEXT = LINECC(JLINT-2:JLINT)
      IF (CHEXT(1:1).EQ.':')  CHEXT(1:1)='.'
      CALL CLTOU (CHEXT(1:4))
      IF (CHEXT(1:4).NE.'.GO ')    GO TO 17

   16 INTPRI = 0
      IFLGOS = 7
   17 IF (INTPRI.NE.0)  THEN
          WRITE (IQTYPE,9001) IDPROG
          IF (LTXOP.GE.9)  WRITE (IQTYPE,9002) CHTXOP(9:LTXOP)
          IF (NFILE.LT.11)  THEN
              WRITE (IQTYPE,9006) (NAMEIN(J)(9:14),J=1,NFILE)
            ELSE
              WRITE (IQTYPE,9007) (NAMEIN(J)(9:14),J=1,NFILE)
            ENDIF

          IF (NARGS.GT.0)  THEN
              IF (NFILE.LT.11)  THEN
                  WRITE (IQTYPE,9008) (NAMEIN(J)(1:6),J=1,NFILE)
                ELSE
                  WRITE (IQTYPE,9009) (NAMEIN(J)(1:6),J=1,9)
                ENDIF
            ENDIF
        ENDIF

C--------          Aquire the program parameters

      CHTERM = ' '
      CHDEF  = '-    ...'
      NLCUM  = 0
      JUPRNT = 0
      NFILEX = 0
      JFILE  = 1
      JUSE   = 1

C----              Take parameters from the command line

      JARG  = 1
   31 IF (NLCUM.GT.0)  THEN
          COMD(NCMD+1:NCMD+NLCUM) = LINECC(1:NLCUM)
          CALL CSQMBL (COMD,1,NCMD+NLCUM)
          NCMD  = NDSLAT + 1
          NLCUM = 0
        ENDIF

      LINECC = ' '
      IF (JARG.GT.NARGS)           GO TO 34
      CALL GETARG (JARG,LINECC)
      JLINT = LNBLNK (LINECC)
      JARG  = JARG + 1
      GO TO 38

C----              Take parameters from next input line

   34 IF (INTPRI.NE.0)  THEN
          IF (NFILE-JFILE.LT.10)  THEN
              WRITE (IQTYPE,9008) (NAMEIN(J)(1:6),J=JFILE,NFILE)
            ELSE
              N = JFILE + 8
              WRITE (IQTYPE,9009) (NAMEIN(J)(1:6),J=JFILE,N)
            ENDIF
          IF (INIPRO.EQ.0)  CALL TMINIT (INIPRO)
          CALL TMPRO (' y> ')
        ENDIF

      CALL TMREAD (NLINE, LINECC, JLINT, ISTAT)
      IF (ISTAT.NE.0)              STOP 7

   38 IF (JLINT.EQ.0)              GO TO 31

      LINEUP = LINECC
      CALL CLTOU (LINEUP(1:JLINT))
      JLINC = 0
      IF (JFILE.GT.NFILE)          GO TO 72

C----              Next parameter

C--             LUNMOD is the IOMODE for this logical unit
C--             negative to flag accept 'EOF' on reader input

   41 CHSTRM =         NAMEIN(JFILE)(1:5)
      CHEXT  =         NAMEIN(JFILE)(9:14)
      LUNORG = ICDECI (NAMEIN(JFILE),17,24)
      LUNMOD = ICDECI (NAMEIN(JFILE),25,32)
      LSTRM  = ICDECI (NAMEIN(JFILE),33,40)
      KINDPA = LUNORG
      LUNUSE = LUNORG
      LUNDES = IABS(LUNMOD)
      LUNBAK = 0
      LUNFLG = 0
      IFLSCR = 0
      IF (CHEXT.EQ.'.scr    ')  IFLSCR = 7

C- 1 ATT  2 RES  3 CAR  4 DET  5 EOF  6 HOLD  7 OUT  8 CE  9 INI  10 FIN

      CALL UPKBYT (LUNDES,1,IOMODE,12,0)

      CALL FLKRAK (0)
      IF (JFAULT.NE.0)  THEN
          WRITE (IQTYPE,9042) JFILE
          GO TO 49
        ENDIF

      IF (TEXT(1:4).EQ.'    ')     GO TO 31
      IF (TEXT(1:8).EQ.'HELP    ')  THEN
          CALL HELPPR
          GO TO 31
        ENDIF

      IF (LUNORG.GE.5)             GO TO 61
      GO TO (43,51,55,57), LUNORG

C--                Reader input

   43 IF (TEXT(1:4).EQ.'&   ')  THEN
                             TEXT = 'TTY '
          IF (INTACT.NE.0)   TEXT = 'TTP '
        ENDIF

      IF     (TEXT(1:4).NE.'TTY ')  THEN
          IF (TEXT(1:4).NE.'TTP ')     GO TO 45
          IPROMI = 7
          IF (INIPRO.EQ.0)  CALL TMINIT (INIPRO)
        ENDIF
      IQREAD = IQTTIN
      LUNUSE = IQTTIN
      GO TO 64

   45 LUNUSE = IQREAD
      IF (TEXT(1:4).EQ.'-   ')  THEN
          TEXT = IDPROG // CHEXT
          CALL CLEFT (TEXT,1,20)
          CALL CUTOL (TEXT(1:20))
          GO TO 64
        ENDIF

      IF (TEXT(1:4).NE.'EOF ')     GO TO 64
      IF (LUNMOD.GE.0)             GO TO 48
      IQREAD = 0
      LUNUSE = 0
      GO TO 64

   48 WRITE (IQTYPE,9048) IDPROG
   49 IF (INTACT.EQ.0)       CALL PABEND
      INTPRI = INTACT
      JARG   = NARGS + 1
      GO TO 31

C--                Printer output

   51 IF (TEXT(1:4).EQ.'&   ')  TEXT = 'TTY '
      IF (TEXT(1:4).EQ.'TTY ')  THEN
          IQPRNT = IQTYPE
          LUNUSE = IQTYPE
          GO TO 64
        ENDIF

      JUPRNT = JUSE
      JUPRFI = JFILE
      LUNUSE = IQPRNT
      IF (TEXT(1:4).NE.'-   ')     GO TO 64
      TEXT = '+y.lis'
      GO TO 64

C--                Option string

   55 LUNUSE = 0
      IF (TEXT(1:4).EQ.'&   ')     GO TO 59
      IF (TEXT(1:4).EQ.'-   ')     GO TO 59
      CALL UCTOH1 (TEXT,NOPTPR,8)
      DO  56  JL=1,8
      J = IUCOMP (NOPTPR(JL),IQLETT,30)
      IF (J.NE.0)  CALL SBIT1 (NOPTVL(4),J)
   56 CONTINUE
      GO TO 64

C--                CCH - string

   57 LUNUSE = 0
      IF (TEXT(1:4).EQ.'&   ')     GO TO 59
      IF (TEXT(1:4).EQ.'-   ')     GO TO 59
      CALL UCTOH (TEXT,NCHCH,99,8)
      GO TO 64

   59 TEXT = '-'
      GO TO 64

C--                Normal files

   61 IF (LSTRM.NE.0)            LUNVL(LSTRM)=LUNUSE
      IF (TEXT(1:4).EQ.'&   ')   TEXT(1:4)='-   '

C- 1 ATT, 2 RES, 3 CAR, 4 DET, 5 EOF, 6 HOLD, 7 OUT, 8 CE, 9 INI, 10 FIN
C--   set default for CETA file
      IF (IOMODE(8).NE.0)  THEN
          IF (TEXT(1:4).EQ.'-   ')  THEN
              TEXT = ' cetatape'
            ENDIF
        ENDIF

C--   set scratch file
      IF (IFLSCR.NE.0)  TEXT = '-temp.scr'

C--                Store usage for final processing

   64 NLCUM = JLINC
      FILEST(JFILE) = TEXT
      EXTSTO(JFILE) = CHEXT(2:5)
      CALL UCOPY (LUNUSE,MUSE(JUSE),NWSTOR)
      JUSE = JUSE + NWSTOR
      IF (INTPRI.EQ.0)             GO TO 68

      NTXT = LNBLNK (TEXT)
      IF (LUNUSE.EQ.0)  THEN
          WRITE (IQTYPE,9085) CHSTRM,TEXT(1:NTXT)
        ELSE
          WRITE (IQTYPE,9087) JFILE,CHSTRM,LUNUSE,TEXT(1:NTXT)
        ENDIF

   68 JFILE = JFILE + 1
      IF (TEXT(5:8).NE.' ...')  NFILEX = JFILE
      IF (JFILE.LE.NFILE)          GO TO 41

      IF (NLCUM.GT.0)  THEN
          COMD(NCMD+1:NCMD+NLCUM) = LINECC(1:NLCUM)
          CALL CSQMBL (COMD,1,NCMD+NLCUM)
          NCMD  = NDSLAT + 1
          NLCUM = 0
        ENDIF

C----              Start execution ?

      IF (IFLGOS.NE.0)             GO TO 83
      IF (CHTERM.NE.'    ')        GO TO 73
      IF (JARG.LE.NARGS)  THEN
          IF (JLINC.GE.JLINT)      GO TO 31
        ENDIF
   72 CALL FLKRAK (-1)

   73 IF (CHTERM(1:1).NE.':')  CHTERM(1:1) = '.'
      COMD(NCMD+1:NCMD+4) = CHTERM(1:1) // 'go' // CHAR(39)
      NCMD = NCMD + 4
      IF (INTACT.NE.0)  WRITE (IQTYPE,9073) COMD(1:NCMD)

      IF (CHTERM(2:3).EQ.'GO')     GO TO 83
      CHTERM = ' '
      IF (INIPRO.EQ.0)  CALL TMINIT (INIPRO)
      CALL TMPRO (' Type  GO  or stop  y> ')
      CALL TMREAD (4, CHTERM, NCH, ISTAT)
      IF (ISTAT.NE.0)              STOP 7
      CALL CLTOU (CHTERM)
      IF (CHTERM.EQ.'.GO ')        GO TO 83
      IF (CHTERM.EQ.':GO ')        GO TO 83
      IF (CHTERM.NE.'GO  ')            STOP

C--------          Final processing, OPEN the files

C- 1 ATT, 2 RES, 3 CAR, 4 DET, 5 EOF, 6 HOLD, 7 OUT, 8 CE, 9 INI, 10 FIN

   83 IF (JUPRNT.NE.0)  THEN
          CALL UCOPY  (MUSE(JUPRNT),LUNUSE,NWSTOR)
          TEXT = FILEST(JUPRFI)
          NTXT = LNBLNK (TEXT)
          CALL UPKBYT (LUNDES,1,IOMODE,12,0)
          IOMODE(7) = -1
          CALL FLINK  (LUNUSE)
          LUNBAK = IFLBAK
          CALL UCOPY (LUNUSE,MUSE(JUPRNT),NWSTOR)
        ENDIF

      NOTPRS = INTPRI
      N = IUCOMP (IQPLUS,NOPTPR,8)
      IF (IQTYPE.EQ.IQPRNT)  THEN
          NOTPRS = 7
          N = 7
        ENDIF

      IF (N.EQ.0)  THEN
          WRITE (IQPRNT,9083) IDPROG
        ELSE
          WRITE (IQPRNT,9084) IDPROG
        ENDIF

      IF (NOTPRS.EQ.0)  WRITE (IQTYPE,9084) IDPROG
      IF (NFILEX.EQ.NFILE)  NFILEX = NFILE + 1

      JUSE  = 1
      JFILE = 1
   84 CALL UCOPY (MUSE(JUSE),LUNUSE,NWSTOR)
      TEXT   = FILEST(JFILE)
      NTXT   = LNBLNK (TEXT)
      CHSTRM = NAMEIN(JFILE)(1:5)

      IF (JFILE.NE.NFILEX)  THEN
          IF (TEXT(5:9).EQ.' ...')  TEXT(5:9) = '    '
        ENDIF

      IF (LUNUSE.EQ.0)  THEN
          WRITE (IQPRNT,9085) CHSTRM,TEXT(1:NTXT)
          IF (NOTPRS.NE.0)         GO TO 89
          WRITE (IQTYPE,9085) CHSTRM,TEXT(1:NTXT)
          GO TO 89
        ENDIF

      WRITE (IQPRNT,9087) JFILE,CHSTRM,LUNUSE,TEXT(1:NTXT)

      IF (NOTPRS.EQ.0)  THEN
      WRITE (IQTYPE,9087) JFILE,CHSTRM,LUNUSE,TEXT(1:NTXT)
      ENDIF

      IF   (JUSE.EQ.JUPRNT)        GO TO 88
      IF (LUNUSE.EQ.IQTTIN)        GO TO 89
      IF (LUNUSE.EQ.IQTYPE)        GO TO 89

      CALL UPKBYT (LUNDES,1,IOMODE,12,0)

C--   check explicite extension .CAR for PAM stream
      IF (IOMODE(11).NE.0)  THEN
          IOMODE(11) = 0
          IF (EXTSTO(JFILE).EQ.'car ')  IOMODE(3)=1
          GO TO 87
        ENDIF

C--   check 'Direct Access' format for CETA
      IF (IOMODE(8).EQ.0)          GO TO 87
      IF (JBIT(NOPTVL(4),13).NE.0)  THEN
          CALL SBIT0 (NOPTVL(4),1)
          IOMODE(8) = 2
          GO TO 87
        ENDIF
      IF (JBIT(NOPTVL(4),19).NE.0)  THEN
          CALL SBIT0 (NOPTVL(4),1)
          GO TO 87
        ENDIF
      IF (JBIT(NOPTVL(4),1) .NE.0)  IOMODE(8) = -1

   87 CALL FLINK (LUNUSE)
      LUNBAK = IFLBAK
   88 IF (LUNBAK.NE.0)  THEN
          WRITE (IQPRNT,9088)
          IF (NOTPRS.EQ.0)  WRITE (IQTYPE,9088)
        ENDIF

   89 IF (JFILE.EQ.NFILEX)  JFILE=NFILE
      JUSE  = JUSE  + NWSTOR
      JFILE = JFILE + 1
      IF (JFILE.LE.NFILE)          GO TO 84
      IF (NOTPRS.EQ.0)  WRITE (IQTYPE,9089)
      INTACT = 0
      IFLDIA = 0
      CHTERM = ' '
      RETURN

 9001 FORMAT (1X,A,' executing')
 9002 FORMAT (' Options  :     ',A)
 9006 FORMAT (' Default ext. : ',10A)
 9007 FORMAT (' Default ext. : ', 9A/(46X,4A,:))
 9008 FORMAT (' Stream names : ',10A)
 9009 FORMAT (' Stream names : ', 9A,'...')
 9042 FORMAT (' Faulty parameter',I3)
 9048 FORMAT (' EOF not allowed with ',A)
 9073 FORMAT (1X/'. ',A/1X)
 9083 FORMAT (1H1,A,' executing with Files / Options'/1X)
 9084 FORMAT (1X/1X,A,' executing with Files / Options'/1X)
 9085 FORMAT (6X,A,6X,A)
 9087 FORMAT (I4,2X,A,I3,3X,A)
 9088 FORMAT (21X,'existing file renamed to .bak')
 9089 FORMAT (1X)
      END

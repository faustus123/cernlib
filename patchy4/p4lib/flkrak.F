CDECK  ID>, FLKRAK.
      SUBROUTINE FLKRAK (IPARA)

C-    Krack next parameter

      COMMON /CCPARA/NCHCCD,NCHCCT,KARDCC(84),   JCCTYP,JCCPRE,JCCEND
     +,              MCCPAR(120),NCCPAR,MXCCIF,JCCIFV,JCCBAD,JCCWK(4)
     +,              JCCPP,JCCPD,JCCPZ,JCCPT,JCCPIF,JCCPC,JCCPN
     +,              NCCPP,NCCPD,NCCPZ,NCCPT,NCCPIF,NCCPC,NCCPN
      COMMON /IOFCOM/IOTALL,IOTOFF,IOTON,IOSPEC,IOPARF(5),IOMODE(12)
                   PARAMETER (NTEXT=128, NLINE=256)
                   CHARACTER  IDPROG*8,  HOMED*48
                   CHARACTER  LINECC*(NLINE), LINEUP*(NLINE)
                   CHARACTER  CHDEF*8,   CHTERM*4,   CHEXT*8
                   CHARACTER  TEXT*(NTEXT), FILEST(13)*(NTEXT)
      COMMON /FLKRAC/IFLDIA, INTACT, KINDPA, IFLBAK, JFAULT, NLCUM
     +,              JLINC,JLINT, NTXT, LUNOP, NHOMED, HOMED, IDPROG
     +,              LINECC,LINEUP, CHDEF,CHTERM, CHEXT,TEXT, FILEST
C--------------    END CDE                             --------------
      COMMON /SLATE/ NDSLAT,NESLAT,NFSLAT,NGSLAT,MMSLAT(36)
      CHARACTER    COLCC(NLINE)*1, COLUP(NLINE)*1
      EQUIVALENCE (COLCC,LINECC), (COLUP,LINEUP)

      CHARACTER    HOLDPA*80
      CHARACTER    CHWORK*3
      EQUIVALENCE (CHWORK,HOLDPA)

C-----------  Directory for Public PAM Files
      CHARACTER    MPUBLI*(*)
      PARAMETER   (MPUBLI = '/cern/pro/pam/')



C- 1 ATT, 2 RES, 3 CAR, 4 DET, 5 EOF, 6 HOLD, 7 OUT, 8 CE, 9 INI, 10 FIN

      TEXT  = ' '
      JFAULT = 0
      IFLCOL = 0
      IFLEXC = 0

C--                Entry from IOFILE

      IF (IFLDIA.NE.0)             GO TO 14
      LINECC = ' '
      CALL UH1TOC (KARDCC,LINECC,80)
      LINEUP = LINECC
      CALL CLTOU (LINEUP)
      JLINC = NCHCCD
      JLINT = NCHCCT
      KINDPA = 11

      IF (IOMODE(3).EQ.0)  THEN
          CHEXT = '.pam'
        ELSE
          CHEXT = '.car'
        ENDIF
      GO TO 21

C--                Entry from FLPARA

   14 IF (CHTERM.NE.'    ')        GO TO 29
      NLCUM = JLINC

C-----             Handle 'No parameter'

C--                No more parameters

   21 JLINC = ICNEXT (LINECC,JLINC+1,JLINT)
      IF (JLINC.GT.JLINT)             RETURN
      NCHUU = NDSLAT
      JENDU = NESLAT

C--                Remove apostrophes

      IF (COLCC(JLINC).EQ.CHAR(39))  THEN
          JN = JLINC
   22     COLCC(JN) = ' '
          COLUP(JN) = ' '
          JN = ICFIND (CHAR(39),LINECC,JN+1,JLINT)
          IF (JN.GT.JLINT)         GO TO 21
          GO TO 22
        ENDIF

C--                Remove leading reverse slash

      IF (COLCC(JLINC).EQ.CHAR(92))  THEN
          COLCC(JLINC) = ' '
          GO TO 21
        ENDIF

C--                '-' or '&' for Skip next parameter

      TEXT(1:1) = COLCC(JLINC)
      IF     (COLCC(JLINC).NE.'-') THEN
          IF (COLCC(JLINC).NE.'&') GO TO 23
        ENDIF

      IF (KINDPA.NE.4)                         RETURN
      IF (INDEX('+*!?C', COLCC(JLINC+1)).EQ.0)  RETURN
      GO TO 41

C--                '.' or ':' for Skip Remaining parameters

   23 IF     (COLCC(JLINC).NE.':')  THEN
          IF (COLCC(JLINC).NE.'.') GO TO 41
        ENDIF

      JN = ICFNBL (LINECC,JLINC+1,JLINT)
      IF (JN.GE.JLINT)             GO TO 27
      CHWORK = LINEUP(JN:JN+2)
      IF (CHWORK.EQ.'GO ')         GO TO 28
      IF (COLCC(JLINC+1).NE.' ')   GO TO 41

   27 CHWORK = '  '
   28 CHTERM = COLCC(JLINC) // CHWORK
      IF (CHTERM(1:1).EQ.':')  CHDEF(1:1) = '&'
      JLINC = NLCUM
   29 TEXT(1:8) = CHDEF
      RETURN

C-----             Check special parameters

   41 IF (IPARA.EQ.-1)            RETURN
      JLAST = JENDU - 1
      NCHU  = NCHUU
      TEXT  = LINEUP(JLINC:JLINC+NCHU-1)
      IF (NCHU.LE.4)  THEN
          IF (TEXT(1:5).EQ.'HELP ')     GO TO 78
          IF (TEXT(1:5).EQ.'TTY  ')     GO TO 78
          IF (TEXT(1:5).EQ.'TTP  ')     GO TO 78
          IF (TEXT(1:5).EQ.'EOF  ')     GO TO 78
        ENDIF

C--                Handle literal enclosed by $

      IF (COLCC(JLINC).EQ.'$')  THEN
          JLINC = JLINC + 1
          JLAST = ICFIND ('$',LINECC,JLINC,JLAST)
          NCHU  = JLAST - JLINC
          IF (NCHU.LE.0)           GO TO 91
          TEXT = LINECC(JLINC:JLINC+NCHU-1)
          GO TO 78
        ENDIF

C--                Stop analysis of OPT or CCH parameter

      IF (KINDPA.EQ.3)             GO TO 78
      IF (KINDPA.EQ.4)             GO TO 78

C--                Handle  LNAME!  for logical names

      IF (COLCC(JLAST).EQ.'!')  THEN
          JLAST  = JLAST - 1
          IFLEXC = 7
        ENDIF

C-----             Analyse file name

      JLINU = JLINC
      TEXT = ' '

C--                Check prefix  : + =

   44 J = INDEX (':+=', COLCC(JLINU))
      IF (J.EQ.0)                  GO TO 45
      IF (J.EQ.1)  THEN
          IFLCOL = 7
        ELSE
          TEXT(1:1) = COLCC(JLINU)
        ENDIF
      JLINU = JLINU + 1
      GO TO 44

   45 JTXU = 2

C----              Is the file PUBLIC ?

      IF (COLCC(JLINU).EQ.'*')  THEN
          N  = LEN (MPUBLI)
          TEXT(JTXU:JTXU+N-1) = MPUBLI
          JTXU  = JTXU  + N
          JLINU = JLINU + 1
          GO TO 46
        ENDIF

C----              Does the file name start with (SYMBOL)

      IF (COLCC(JLINU).EQ.'(')  THEN
          JLINU = JLINU + 1
          JA = JLINU
          JE = ICFIND (')',LINECC,JA,JLAST)
          IF (NGSLAT.EQ.0)         GO TO 46
          JLINU = JE + 1
          IF (JE.EQ.JA)            GO TO 46
          LINECC(JE:JE) = ' '
          CALL GETENVF (LINECC(JA:JE),HOLDPA)
          N = LNBLNK (HOLDPA)
          IF (N.LE.0)              GO TO 46

          TEXT(JTXU:JTXU+N-1) = HOLDPA(1:N)
          JTXU  = JTXU  + N
          GO TO 46
        ENDIF

C----              Does the file name start with '~'

      IF (COLCC(JLINU).EQ.'~')  THEN
        IF (NHOMED.GT.0)   THEN
          N = NHOMED
          TEXT(JTXU:JTXU+N-1) = HOMED(1:N)
          JTXU  = JTXU  + N
          JLINU = JLINU + 1
          IF (COLCC(JLINU).EQ.'/')  JLINU=JLINU+1
        ENDIF
        ENDIF

C----            Look for Directory and Extension

   46 IF (JLINU.GT.JLAST)          GO TO 91
      IF (IFLCOL.EQ.0)  CALL CUTOL (LINECC(JLINU:JLAST))

      JFILN = JLINU
      J     = ICFILA ('/', LINECC,JFILN,JLAST) + 1
      IF (J.LE.JLAST)   JFILN = J
      LDIR  = JFILN - JLINU

      JEXT  = ICFILA ('.', LINECC,JFILN,JLAST)
      LEXT  = JLAST+1 - JEXT
      LFILN = JEXT    - JFILN

C----              Do the Directory

      IF (LDIR.NE.0)  THEN
          TEXT(JTXU:JTXU+LDIR-1) = LINECC(JLINU:JLINU+LDIR-1)
          JTXU = JTXU + LDIR
        ENDIF

C----              Do the File-name

      IF (LFILN.GE.3)              GO TO 49
      IF (LFILN.LE.0)              GO TO 91

      JUSE = ICDECI (LINECC,JFILN,JFILN)
      IF (JUSE.EQ.0)               GO TO 49

C--                File name 'n' or 'n+' to use name of stream n

      KEEPD = 0
      IF (LFILN.EQ.2)   THEN
          IF (LDIR.NE.0)               GO TO 91
          IF (COLCC(JFILN+1).NE.'+')   GO TO 91
          KEEPD = 7
        ENDIF

      NUSE = LNBLNK (FILEST(JUSE))
      IF (NUSE.LE.1)               GO TO 91

      JUFN  = ICFILA ('/',FILEST(JUSE),2,NUSE) + 1
      IF (JUFN.GT.NUSE)  JUFN = 2
      JUEX = ICFILA ('.',FILEST(JUSE),JUFN,NUSE)
      JUST = 2
      IF (KEEPD.EQ.0)  JUST = JUFN
      N = JUEX - JUST

      TEXT(JTXU:JTXU+N-1) = FILEST(JUSE)(JUST:JUST+N-1)
      JTXU = JTXU + N
      GO TO 51

   49 TEXT(JTXU:JTXU+LFILN-1) = LINECC(JFILN:JFILN+LFILN-1)
      JTXU = JTXU + LFILN

C----              Do the File extension

   51 IF (LEXT.GT.0)  THEN
          TEXT(JTXU:JTXU+LEXT-1) = LINECC(JEXT:JEXT+LEXT-1)
          CHEXT = TEXT(JTXU:JTXU+LEXT-1)
          JTXU  = JTXU + LEXT
        ELSE
          IF (IFLEXC.NE.0)         GO TO 57
          N = LNBLNK (CHEXT)
          TEXT(JTXU:JTXU+N-1) = CHEXT(1:N)
          JTXU = JTXU + N
        ENDIF

   57 CALL CLEFT (TEXT,2,JTXU)

C--                EXIT

   78 JLINC = JENDU
      RETURN

C----              Trouble

   91 JFAULT = 7
      RETURN
      END

CDECK  ID>, YINDEX.
      PROGRAM YINDEX

      COMMON /LUNSLN/NSTRM,NBUFCI,LUNVL(3),LUNVN(9),NOPTVL(4),NCHCH(6)

      PARAMETER   (NCNAME=48)
      PARAMETER   (NFILES= 3)
      CHARACTER    NAME(NFILES)*(NCNAME)
      DATA NAME/ 'PAM     .pam        11       0       1      !FF!'
     +,          'OPT      -           3       0       0      !FF!'
     +,          'PRINT   .lis         2      68       0      !FF!' /

      CALL FLPARA (NFILES,NAME,
     +   'YINDEX  Action,C/c,If,Keep,Seq, Ponly,Quick, Xp,Yd,Zz.')

      NBUFCI = -1
      NSTRM  = 1
      CALL AUXINI
      CALL YIXEX
      END

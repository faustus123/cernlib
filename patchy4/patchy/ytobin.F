CDECK  ID>, YTOBIN.
      PROGRAM YTOBIN

      COMMON /LUNSLN/NSTRM,NBUFCI,LUNVL(3),LUNVN(9),NOPTVL(4),NCHCH(6)

      PARAMETER   (NCNAME=48)
      PARAMETER   (NFILES= 5)
      CHARACTER    NAME(NFILES)*(NCNAME)
      DATA NAME/ 'CARD    .car        11       4       1      !FF!'
     +,          'PAM     .pam        21      64       4      !FF!'
     +,          'OPT      -           3       0       0      !FF!'
     +,          'CCH      -           4       0       0      !FF!'
     +,          'PRINT   .lis         2      68       0      !FF!' /
C-                _:.=+=.:_1_:.=+=.:_2_:.=+=.:_3_:.=+=.:_4_:.=+=.:

      CALL FLPARA (NFILES,NAME,
     +   'YTOBIN  Ponly,Quick, Truncate 72.')

      NSTRM  = 1
      NBUFCI = 1
      CALL AUXINI
      CALL INCHCH
      CALL YBINEX
      END

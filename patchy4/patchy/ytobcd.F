CDECK  ID>, YTOBCD.
      PROGRAM YTOBCD

      COMMON /LUNSLN/NSTRM,NBUFCI,LUNVL(3),LUNVN(9),NOPTVL(4),NCHCH(6)

      PARAMETER   (NCNAME=48)
      PARAMETER   (NFILES= 6)
      CHARACTER    NAME(NFILES)*(NCNAME)
      DATA NAME/ 'PAM     .pam        11       0       1      !FF!'
     +,          'CARD    .car        21      68       4      !FF!'
     +,          'OPT      -           3       0       0      !FF!'
     +,          'CCH      -           4       0       0      !FF!'
     +,          'PRINT   .lis         2      68       0      !FF!'
     +,          'PDH     .car        22      68       5      !FF!' /
C-                _:.=+=.:_1_:.=+=.:_2_:.=+=.:_3_:.=+=.:_4_:.=+=.:

      CALL FLPARA (NFILES,NAME,
     +   'YTOBCD  No title deck, Separate decks, Title cards, Xpdh.')

      NSTRM  = 2
      CALL AUXINI
      CALL INCHCH
      CALL YBCDEX
      END

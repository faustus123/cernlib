CDECK  ID>, YSEARC.
      PROGRAM YSEARC

      COMMON /LUNSLN/NSTRM,NBUFCI,LUNVL(3),LUNVN(9),NOPTVL(4),NCHCH(6)

      PARAMETER   (NCNAME=48)
      PARAMETER   (NFILES= 6)
      CHARACTER    NAME(NFILES)*(NCNAME)
      DATA NAME/ 'PAM     .pam        11       0       1      !FF!'
     +,          'CARD    .car        21      68       4      !FF!'
     +,          'OPT      -           3       0       0      !FF!'
     +,          'READ    .cra         1       4       0      !FF!'
     +,          'PRINT   .lis         2      68       0      !FF!'
     +,          'TEMP    .scr        24      64       6      !FF!' /

      CALL FLPARA (NFILES,NAME,
     +   'YSEARCH Copy all, Quick, Title ignored.')

      CALL AUXINI
      CALL YSEREX
      END

CDECK  ID>, YEDIT.
      PROGRAM YEDIT

      COMMON /LUNSLN/NSTRM,NBUFCI,LUNVL(3),LUNVN(9),NOPTVL(4),NCHCH(6)

      PARAMETER   (NCNAME=48)
      PARAMETER   (NFILES=10)
      CHARACTER    NAME(NFILES)*(NCNAME)
      DATA NAME/ 'OLD1    .pam        11       0       1      !FF!'
     +,          'NEW1    .pam        21      64       4      !FF!'
     +,          'OPT      -           3       0       0      !FF!'
     +,          'CCH      -           4       0       0      !FF!'
     +,          'READ    .cra         1      -4       0      !FF!'
     +,          'PRINT   .lis         2      68       0      !FF!'
     +,          'OLD2    .pam        12       0       2      !FF!'
     +,          'NEW2    .pam        22      64       5      !FF!'
     +,          'OLD3    .pam        13       0       3      !FF!'
     +,          'NEW3    .pam        23      64       6      !FF!' /

      CALL FLPARA (NFILES,NAME,
     +   'YEDIT   Autoupd, Kill, Next, Ponly,Quick, Truncate 72.')

      NSTRM  = 3
      NBUFCI = 1
      CALL AUXINI
      CALL INCHCH
      CALL YEDTEX
      END

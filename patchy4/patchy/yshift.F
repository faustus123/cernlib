CDECK  ID>, YSHIFT.
      PROGRAM YSHIFT

      COMMON /LUNSLN/NSTRM,NBUFCI,LUNVL(3),LUNVN(9),NOPTVL(4),NCHCH(6)

      PARAMETER   (NCNAME=48)
      PARAMETER   (NFILES= 5)
      CHARACTER    NAME(NFILES)*(NCNAME)
      DATA NAME/ 'OLD     .pam        11       0       1      !FF!'
     +,          'NEW     .pam        21      64       4      !FF!'
     +,          'OPT      -           3       0       0      !FF!'
     +,          'READ    .cra         1       4       0      !FF!'
     +,          'PRINT   .lis         2      68       0      !FF!' /

      CALL FLPARA (NFILES,NAME,
     +   'YSHIFT  All,Unknown tags, Bypass, Ponly,Quick, Xcout, Ycin.')
      CALL SBIT1 (NOPTVL(4),21)

      NSTRM  = 1
      CALL AUXINI
      CALL YSHFEX
      END

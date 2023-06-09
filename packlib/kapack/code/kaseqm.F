*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 11:40:50  mclareni
* Initial revision
*
*
#include "kapack/pilot.h"
      SUBROUTINE KASEQM(LUN,MAJNAM,LDEF,LMAX,IRC)
*
*.....RETRIEVE THE MAJOR NAME FOLLOWING THE ONE SUPPLIED BY THE CALLER
*
#include "kapack/kax000.inc"
#include "kapack/kax020.inc"
#include "kapack/kax02c.inc"
#include "kapack/kax050.inc"
#include "kapack/kax0a0.inc"
*
      CHARACTER MAJNAM*(*)
      CHARACTER MAJOLD*(MAXNAM)
      SAVE MAJOLD
*
*-----------------------------------------------------------------------
*
      CALL KAXINI(LUN)
*
*.....CHECK WHETHER THIS IS AN IMMEDIATE RECALL
      IF (.NOT.NEWLUN .AND. MAJNAM.EQ.MAJOLD .AND. IA(10).EQ.4) GO TO 3
*
*.....NOT AN IMMEDIATE RECALL SO CONVERT THE SUPPLIED MAJOR NAME
 2    IF ( MAJNAM .EQ. ' ' )  THEN
         MAJKEY(1) = 2
         MAJKEY(2) = -1
      ELSE
         CALL KAXNAM(MAJNAM,MAJKEY,*11)
      ENDIF
*
*.....DO A KEY SEARCH FROM THE ROOT
      CALL KAXGET(1,MAJKEY,1,LOC,*5)
*
*.....THE SUPPLIED NAME HAS BEEN LOCATED SO GET THE NEXT ONE
 3    LOC = LOC + IA(LOC)
      IF ( LOC .GE. IA(7) )  THEN
         NBLK = IA(1)
         CALL KAXRD(IA(3),IA,LBLK)
         IF ( IA(2) .NE. NBLK )  GO TO 2
         LOC = IA(6)
      ENDIF
*
*.....CHECK FOR 'END OF FILE'
 5    IF ( IA(LOC+NRCW+1) .EQ. MAXKEY )  GO TO 21
*
*.....CONVERT THE LOCATED KEY TO AN EXTERNAL NAME
      CALL KAXI2E(IA(LOC+NRCW),MAJNAM,*12)
*
*.....STORE THE DEFAULT AND MAXIMUM LENGTHS FOR THE CALLER
      IPTR = LOC + NRCW + IA(LOC+NRCW)
      LDEF = IA(IPTR+1)
      LMAX = IA(IPTR+2)
*
*.....STORE THE ROOT BLOCK NUMBER FOR USE BY KAPRIK AND KARLSE
      KPROOT= IA(IPTR)
*
*.....SUCCESSFUL COMPLETION
      MAJOLD = MAJNAM
      IA(10) = 4
      IRC    = 0
      RETURN
*
*.....ERROR PROCESSING
 11   IRC = 1
      WRITE(MSG,111) MAJNAM
      GO TO 99
*
 12   IRC = 1
      WRITE(MSG,112) LUN, LEN(MAJNAM)
      GO TO 99
*
 21   IRC = 2
      IF ( RETURN )  RETURN
      WRITE(MSG,121) LUN
      GO TO 99
*
 99   CALL KAXMSG(LUNERR,MSG)
      IF ( RETURN )  RETURN
      CALL KAXEND
*
 111  FORMAT('CRNKA131 KASEQM: ''',A,''' IS NOT AN ACCEPTABLE MAJOR
     +        NAME')
 112  FORMAT('CRNKA132 KASEQM: RETRIEVAL OF MAJOR NAMES FAILED',
     +       ' ON UNIT ', I3,', THE LENGTH OF ',I11,
     +       ' IS INSUFFICIENT FOR THE SECOND ARGUMENT')
 121  FORMAT('CRNKA133 KASEQM: END OF FILE DETECTED DURING
     +        FORWARD SEQUENTIAL RETRIEVAL OF MAJOR NAMES ON UNIT ',I3)
*
      END

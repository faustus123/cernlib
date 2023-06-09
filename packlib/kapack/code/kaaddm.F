*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 11:40:50  mclareni
* Initial revision
*
*
#include "kapack/pilot.h"
      SUBROUTINE KAADDM(LUN,MAJNAM,LDEF,LMAX,IRC)
*
*.....ADD A MAJOR ENTRY TO A KA-FILE
*
#include "kapack/kax000.inc"
#include "kapack/kax020.inc"
#include "kapack/kax02c.inc"
#include "kapack/kax050.inc"
#include "kapack/kax0b0.inc"
*
      CHARACTER MAJNAM*(*)
*
      PARAMETER (MAJLEN=3)
      INTEGER MAJREC(1:MAJLEN)
*
*-----------------------------------------------------------------------
*
      CALL KAXINI(LUN)
      IF ( .NOT. MODIFY )  GO TO 21
*
*.....CHECK THE DEFAULT AND MAXIMUM LENGTHS
      IF ( LDEF .LT. 0 )  GO TO 12
      IF ( LMAX .LT. 0 )  GO TO 13
      IF ( LDEF .GT. LMAX )  GO TO 14
*
*.....CONVERT THE MAJOR NAME TO A KEY
      CALL KAXNAM(MAJNAM,MAJKEY,*11)
*
*.....GET A ROOT BLOCK, BUILD MAJOR ENTRY AND ADD IT TO THE MAJOR TREE
* . . (NOTE THAT BLOCK 1 MUST BE LOCKED THROUGHOUT THIS PROCESS)
      CALL KAXOLK(1)
      CALL KAXGBK(IROOT)
      MAJREC(1) = IROOT
      MAJREC(2) = LDEF
      MAJREC(3) = LMAX
      CALL KAXADD(1,MAJKEY,MAJREC,MAJLEN,*31,*91)
      CALL KAXRLK(1)
*
*.....INITIALIZE THE ROOT BLOCK OF THE MINOR TREE
      CALL UZERO(IB,1,NBCW)
      IB(1) = IROOT
      IB(4) = IROOT
      IB(5) = 1
      IB(6) = NBCW + 1
      IB(7) = IB(6) + 3
      IB(NBCW+1) = 3
      IB(NBCW+2) = 2
      IB(NBCW+3) = MAXKEY
      CALL KAXWRT(IROOT,IB,NBCW+4)
*
*.....SUCCESSFUL COMPLETION
      IRC = 0
      WRITE(MSG,100) MAJNAM, LUN, LDEF, LMAX
      CALL KAXMSG(LUNLOG,MSG)
      RETURN
*
*.....ERROR PROCESSING
 11   IRC = 1
      WRITE(MSG,111) MAJNAM
      GO TO 99
*
 12   IRC = 1
      WRITE(MSG,112) LDEF
      GO TO 99
*
 13   IRC = 1
      WRITE(MSG,113) LMAX
      GO TO 99
*
 14   IRC = 1
      WRITE(MSG,114) LDEF, LMAX
      GO TO 99
*
 21   IRC = 2
      WRITE(MSG,121) LUN
      GO TO 99
*
 31   IRC = 3
      CALL KAXFBK(IROOT)
      CALL KAXRLK(1)
      WRITE(MSG,131) MAJNAM, LUN
      GO TO 99
*
 91   CALL KAXFBK(IROOT)
      WRITE(MSG,191) MAJNAM, LUN
      CALL KAXMSG(LUNERR,MSG)
      CALL KAXEND
*
 99   CALL KAXMSG(LUNERR,MSG)
      IF ( RETURN )  RETURN
      CALL KAXEND
*
 100  FORMAT('CRNKA020 KAADDM: MAJOR NAME ''',A,
     +       ''' HAS BEEN ADDED TO THE KA-FILE ON UNIT ',I3,
     +       ' WITH DEFAULT LENGTH ',I11,' AND MAXIMUM LENGTH ',I11)
 111  FORMAT('CRNKA021 KAADDM: ''',A,''' IS NOT AN ACCEPTABLE MAJOR
     +        NAME')
 112  FORMAT('CRNKA022 KAADDM: ',I11,' IS NOT AN ACCEPTABLE VALUE FOR
     +        THE DEFAULT RECORD LENGTH')
 113  FORMAT('CRNKA023 KAADDM: ',I11,' IS NOT AN ACCEPTABLE VALUE FOR
     +        THE MAXIMUM RECORD LENGTH')
 114  FORMAT('CRNKA024 KAADDM: THE DEFAULT RECORD LENGTH OF ',I11,
     +       ' EXCEEDS THE MAXIMUM RECORD LENGTH OF ',I11)
 121  FORMAT('CRNKA025 KAADDM: MODIFICATION ATTEMPTED ON UNIT ',I3,
     +       ' WITH MODIFY=NO SET')
 131  FORMAT('CRNKA026 KAADDM: ADDITION OF MAJOR NAME ''',A,
     +       ''' FAILED ON UNIT ',I3,
     +       ', THIS MAJOR NAME ALREADY EXISTS IN THE KA-FILE')
 191  FORMAT('CRNKA027 KAADDM: ADDITION OF MAJOR NAME ''',A,
     +       ''' FAILED ON UNIT ',I3,', THE KA-FILE CONTAINS
     +        INSUFFICIENT FREE SPACE')
*
      END

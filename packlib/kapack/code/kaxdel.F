*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 11:40:51  mclareni
* Initial revision
*
*
#include "kapack/pilot.h"
      SUBROUTINE KAXDEL(IROOT,KEY,*)
*
*.....DELETE A RECORD FROM A TREE: STEERING ROUTINE
*
* MODIFIED 1987/05/06 TO INCLUDE THE KAXADX CALL IN THE LABEL 1 LOOP
* SINCE THE CALL TO KAXDL1 IN THE LOOP MAY GENERATE INDEX ADDITION
* ENTRIES. THIS CORRECTS THE RARE BUG WHEREBY INDEX BLOCKS GOT LOST.
*                        PAM VERSION 2.08 H.RENSHALL, DD, CERN.
*
#include "kapack/kax000.inc"
#include "kapack/kax020.inc"
#include "kapack/kax050.inc"
#include "kapack/kax080.inc"
#include "kapack/kax090.inc"
#include "kapack/kax0a0.inc"
*
      INTEGER KEY(*)
*
*-----------------------------------------------------------------------
*
*.....LOCK THE TREE
      CALL KAXOLK(IROOT)
*
*.....LOCATE THE RECORD
      CALL KAXGET(IROOT,KEY,1,LOC,*11)
*
*.....INITIALIZE THE INDEX ADDITION AND DELETION QUEUE POINTERS
      IXAF = 0
      IXAL = 0
      IXDF = 0
      IXDL = 0
*
*.....DELETE THE RECORD
      CALL KAXDL1(LOC)
*
*.....PERFORM ANY INDEX MODIFICATIONS WHICH HAVE BEEN GENERATED
*     (DELETIONS MUST BE MADE AFTER ADDITIONS TO AVOID DELETING
*      THE LEVELS TO WHICH THE ADDITIONS ARE TO BE MADE)
*
    1 CALL KAXADX(IROOT)
*
      IF ( IXDF .NE. IXDL )  THEN
         NEXT = MOD(IXDF+1,LXDQ+1)
         CALL KAXGET(IROOT,IXDKEY(1,NEXT),IXDLEV(NEXT),IXLOC,*91)
         CALL KAXDL1(IXLOC)
         IXDF = NEXT
         GO TO 1
      ENDIF
*
*.....SUCCESSFUL COMPLETION
      CALL KAXRLK(IROOT)
      RETURN
*
*.....ERROR PROCESSING
 11   CALL KAXRLK(IROOT)
      RETURN 1
*
 91   WRITE(MSG,191) LUNKAF
      CALL KAXMSG(LUNERR,MSG)
      CALL KAXEND
*
 191  FORMAT('CRNKA161 KAXDEL: KAPACK SYSTEM ERROR OR CORRUPT FILE ON
     +        UNIT ',I3)
*
      END

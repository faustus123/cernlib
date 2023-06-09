*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/07 15:18:04  mclareni
* Initial revision
*
*
#include "fatmen/pilot.h"
      INTEGER FUNCTION FMNODE(NODE)
*CMZ :          26/11/90  16.11.50  by  Jamie Shiers
*-- Author :    Jamie Shiers   26/11/90
        CHARACTER*(*) NODE
        CHARACTER*8   TNODE
        INTEGER       FMHOST
        CHARACTER*8   CHNODE,CHTYPE,CHSYS,CLUNAM,CLUNOD
#include "fatmen/fatbug.inc"
#if defined(CERNLIB_VAXVMS)
      INTEGER SYS$GETSYIW
      INCLUDE '($SSDEF)'
       STRUCTURE /ITMLST/
         UNION
            MAP
            INTEGER*2 BUFFER_LENGTH
              INTEGER*2 ITEM_CODE
            INTEGER*4 BUFFER_ADDRESS
              INTEGER*4 RETURN_LENGTH_ADDRESS
            ENDMAP
            MAP
            INTEGER*4 END_LIST /0/
            ENDMAP
         END UNION
      END STRUCTURE
 
      RECORD /ITMLST/ SYI_LIST(2)
 
      INCLUDE '($SYIDEF)'
#endif
      FMNODE = 0
      LN     = LENOCC(NODE)
      IF(IDEBFA.GE.2) PRINT *,'FMNODE. enter for ',NODE(1:LN)
      TNODE  = NODE
      IC     = FMHOST(CHNODE,CHTYPE,CHSYS)
      LCHN   = LENOCC(CHNODE)
      IF(IDEBFA.GE.2) PRINT *,'FMNODE. current node is ',
     +   CHNODE(1:LCHN)
 
      CALL CLTOU(TNODE)
      CALL CLTOU(CHNODE)
*
*     Node names match...
*
      IF(TNODE(1:LN).EQ.CHNODE(1:LCHN)) RETURN
#if defined(CERNLIB_VAXVMS)
*
*     Nodename specified is the VAXcluster alias
*
      CALL FMGTLG('SYS$CLUSTER_NODE',CLUNAM,'LNM$SYSTEM',IRC)
      IF(IRC.EQ.0) THEN
         LENCLU = INDEX(CLUNAM,':') -1
         IF(IDEBFA.GE.2) PRINT *,'FMNODE. cluster alias is ',
     +      CLUNAM(1:LENCLU)
         IF(TNODE(1:LN).EQ.CLUNAM(1:LENCLU)) RETURN
      ENDIF
*
*     Check whether the node is in the same VAXcluster as us
*
      MEMBER                            = 0
      SYI_LIST(1).BUFFER_LENGTH         = 1
      SYI_LIST(1).ITEM_CODE             = SYI$_CLUSTER_MEMBER
      SYI_LIST(1).BUFFER_ADDRESS        = %LOC(MEMBER)
      SYI_LIST(1).RETURN_LENGTH_ADDRESS = %LOC(LENGTH)
      SYI_LIST(2).END_LIST              = 0
 
      ISTAT = SYS$GETSYIW(,,TNODE(1:LN),SYI_LIST,,,)
 
*     IF (ISTAT .NE. SS$_NOSUCHNODE) GOTO 99
      IF(MEMBER.EQ.0) GOTO 99
      IF(IDEBFA.GE.2) PRINT *,'FMNODE. ',TNODE(1:LN),
     +   ' is a VAXcluster member'
       RETURN
#endif
99    FMNODE = 1
      END
 

*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 12:01:13  mclareni
* Initial revision
*
*
#include "zbook/pilot.h"
      SUBROUTINE ZEXAM6
C
C   EXAMPLE  6:  - USAGE OF ZLOCAL
C
      COMMON/ZCOMM/Z(1),ID1,ID2,ID3,WS(1)
      DIMENSION IZ(1000),IWS(1)
      EQUIVALENCE (IZ(1),Z(1)), (IWS(1),WS(1))
C
      COMMON/LOCAL/NLOCAL,LOCAL1,LOCAL2,LOCAL3
C
C   INITIALISATION
C
      CALL ZINIT (Z,WS,1000)
C
      NWORDS = 12
      CALL ZBOOK (Z,ID1,NWORDS)
      IF (ID1.EQ.0)                              GO TO 999
C
C   J1 POINTS TO THE LAST DATA WORD IN THE BANK
C
      J1     = ID1 + NWORDS
C
C   CREATION OF A WORKING SPACE: IDENTIFIERS ARE AUTOMATICALLY UDATED
C   LOCAL POINTERS MUST BE UPDATED BY THE USER
C
      NWORK  = 23
      CALL ZWORK (Z,NWORK)
C
      J1     = ID1 + NWORDS
C
C   LOCAL1 POINTS TO THE SECOND DATA WORD IN THE BANK
C
      LOCAL1 = ID1 + 2
C
C   LOCAL1 WILL BE AUTOMATICALLY UPDATED
C
      CALL ZLOCAL (Z,NLOCAL)
      NLOCAL = 1
C
      NWORK  = NWORK + 10
      CALL ZWORK (Z,NWORK)
C
C   LOCAL1 POINTS TO THE SECOND WORD OF THE BANK
C
  999 RETURN
      END

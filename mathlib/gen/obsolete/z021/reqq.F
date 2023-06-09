*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:03:21  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "_gen/pilot.h"
      SUBROUTINE REQQ(ILFN,RC)
*
***** CETTE ROUTINE PERMET D AFFECTER LE FICHIER LFN (N OU TAPEN)
*     SUR LE DEVICE Q. ELLE CONSTRUIT LA TABLE DE REQUETE CONTENUE DANS
*     LE COMMUN REQPR DONT LE DERNIER MOT ER REPRESENTE LE CODE DE
*     RETOUR DE LA MACRO REQUEST ET FAIT APPEL A LA ROUTINE XXREQF.
*     SI AU RETOUR DE XXREQF ,ER N EST PAS NUL ET SI L APPEL DE REQQ NE
*     COMPORTE PAS DE CODE DE RETOUR (ADRRC = 0) , UN MESSAGE D ERREUR
*     EST IMPRIME DANS LA DAYFILE PAR L INTERMEDIAIRE DE XDISMES ET LE
*     JOB EST AVORTE.
*
      IMPLICIT INTEGER (A-Z)
*
      DIMENSION FIT(1)
      COMMON /REQPR/ REQPR(9),ER
*
***** QWORD : QBIT + OV BIT + RC BIT
*
#if !defined(CERNLIB_F4)
      DATA QWORD /O"02000000040004000000"/
#endif
#if defined(CERNLIB_F4)
      DATA QWORD /02000000040004000000B/
#endif
*
*.
      LFN=ILFN
      CALL GETFNB(LFN,FIT,IFIT)
      LFN=FIT(IFIT).AND.MASK(42)
      REQPR(1)=LFN
      REQPR(2)=QWORD
*
      CALL XXREQF
*
      ADRRC=LOCF(RC)
      IF(ADRRC.EQ.0) GO TO 1
      RC=ER
*....
*...  REMISE A ZERO DU COMMUN REQPR ET RETURN
*...
2     CONTINUE
      DO 100 I=1,9
      REQPR(I)=0
100   CONTINUE
      ER=0
      RETURN
*....
1     IF(ER.EQ.0) GO TO 2
#if !defined(CERNLIB_F4)
      CALL XDISMES(LFN,ER,L"REQQ")
#endif
#if defined(CERNLIB_F4)
      CALL XDISMES(LFN,ER,4LREQQ)
#endif
      END

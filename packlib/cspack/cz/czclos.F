*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:44:22  mclareni
* Initial revision
*
*
#include "cspack/pilot.h"
      SUBROUTINE CZCLOS(ISTAT)
*
*          To close socket with remote host HOST
*
#include "cspack/czsock.inc"
#if !defined(CERNLIB_IBM)||defined(CERNLIB_TCPSOCK)
      INTEGER SCLOSE
*
*     Send close message
*
      CALL CZPUTA('*CLOSE',ISTAT)
#endif
#if defined(CERNLIB_VAXVMS)
      IF(IPROT.NE.0) THEN
         CALL CZDCLS(ISTAT)
         RETURN
      ENDIF
#endif
#if !defined(CERNLIB_IBM)||defined(CERNLIB_TCPSOCK)
*
      ISTAT = SCLOSE(ISKIN)
#endif
#if (defined(CERNLIB_IBM))&&(!defined(CERNLIB_TCPSOCK))
      CALL SCLOSE(ISKIN)
#endif
      ISTAT=0
*
      END
 

*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 12:01:10  mclareni
* Initial revision
*
*
#include "zbook/pilot.h"
      LOGICAL FUNCTION ZBUG(IZ,IERROR)
C
C     ******************************************************************
C     *                                                                *
C     *       ZBUG IS.TRUE. IF THE CURRENT STATUS ERROR                *
C     *       IS EQUAL TO IERROR                                       *
C     *                                                                *
C     ******************************************************************
C
      DIMENSION IZ(1)
C
C     ------------------------------------------------------------------
C
      JZ     = IZ(1)
      ZBUG   = IZ(JZ + 6).EQ.IERROR
      RETURN
      END

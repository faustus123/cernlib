*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 12:01:10  mclareni
* Initial revision
*
*
#include "zbook/pilot.h"
      SUBROUTINE ZBOOK0(IZ,ID,ND)
C
C     ******************************************************************
C     *                                                                *
C     *       SAME AS ZBOOK                                            *
C     *       PRESETS CONTENTS TO 0.                                   *
C     *                                                                *
C     ******************************************************************
C
      DIMENSION IZ(1),ID(1)
C
C     ------------------------------------------------------------------
C
      CALL ZBOOKN(IZ,ID,ND,0,'    ',0)
      RETURN
      END

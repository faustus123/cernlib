*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 12:01:13  mclareni
* Initial revision
*
*
      SUBROUTINE YBOOK0(IZ,ID,N)
C
C     ******************************************************************
C     *                                                                *
C     *       SAME AS YBOOK + PRESET CONTENTS TO 0                     *
C     *                                                                *
C     ******************************************************************
C
      DIMENSION IZ(1),ID(1)
C
C     ------------------------------------------------------------------
C
      CALL ZBOOKN(IZ,ID,N,0,'    ',0)
      RETURN
      END

*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 12:01:13  mclareni
* Initial revision
*
*
      SUBROUTINE YBOOK(IZ,ID,N)
C
C     ******************************************************************
C     *                                                                *
C     *       CREATION OF A BANK WITH POINTER ID IN BLANK COMMON       *
C     *       CHECKS SPACE. IF NOT ENOUGH ---> CALL HISTGO             *
C     *                                                                *
C     ******************************************************************
C
      DIMENSION IZ(1),ID(1)
C
C     ------------------------------------------------------------------
C
      JZ     = IZ(1)
      IZ(JZ + 17) = 1
      CALL ZBOOKN(IZ,ID,N,0,'    ',0)
      RETURN
      END

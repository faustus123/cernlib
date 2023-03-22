*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 12:01:13  mclareni
* Initial revision
*
*
      SUBROUTINE YMOVE(IZ,N)
C
C     ******************************************************************
C     *                                                                *
C     *       MOVE END OF DYNAMIC AREA IZ BY N WORDS                   *
C     *       N POSITIVE OR NEGATIVE                                   *
C     *       IF N.GT.0 POSSIBILITY OF MEMORY EXTENSION                *
C     *                                                                *
C     ******************************************************************
C
      DIMENSION IZ(1)
C
C     ------------------------------------------------------------------
C
      CALL ZMOVE(IZ,N)
      RETURN
      END

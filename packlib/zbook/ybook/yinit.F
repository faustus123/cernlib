*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 12:01:13  mclareni
* Initial revision
*
*
      SUBROUTINE YINIT(IZ,IW,NWORDS)
C
C     ******************************************************************
C     *                                                                *
C     *       INITIALISES A DYNAMIC AREA IN BLANK COMMON               *
C     *       EXTEND MEMORY                                            *
C     *                                                                *
C     ******************************************************************
C
      DIMENSION IZ(1),IW(1)
C
C     ------------------------------------------------------------------
C
      CALL ZHINIT(IZ,IW,NWORDS)
      RETURN
      END

*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/21 17:19:53  mclareni
* Initial revision
*
*
*CMZ :          06/11/90  10.43.59  by  Michel Roethlisberger/IBM
*-- Author :
* Last modif.: 6 Nov 1990 at 09:52:11
C Last modif.: 6 Nov 1990 at 09:08:34
      FUNCTION DOT(NW,IV,Y,X)
      DIMENSION X(500),Y(500),IV(500)
      TEM= 0.0
      DO I=1,NW
          TEM = TEM +  Y(IV(I))*X(IV(I))
      ENDDO
      DOT = TEM
      RETURN
      END

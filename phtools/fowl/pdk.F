*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/22 16:42:46  mclareni
* Initial revision
*
*
      FUNCTION PDK(A,B,C)
C=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
C--  CALLED FROM -  GENEV
C     PDK = SQRT(A*A+(B*B-C*C)**2/(A*A) - 2.0*(B*B+C*C))/2.0
      A2 = A*A
      B2 = B*B
      C2 = C*C
      PDK = 0.5*SQRT(A2 + (B2-C2)**2/A2 - 2.0*(B2+C2))
      RETURN
      END

*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:52:46  mclareni
* Initial revision
*
*
*
* q_jbytet.inc
*
      JBYTET (MZ,IZW,IZP,NZB) = IAND (MZ, IBITS(IZW,IZP-1,NZB))
      JBYTOR (MZ,IZW,IZP,NZB) = IOR  (MZ, IBITS(IZW,IZP-1,NZB))
      MBYTET (MZ,IZW,IZP,NZB) = IAND (IZW, NOT(IRL (
     +                          ILS(NOT(MZ),36-NZB), 37-IZP-NZB)) )
      MBYTOR (MZ,IZW,IZP,NZB) = IOR (IZW, IRL (
     +                               ILS(MZ,36-NZB), 37-IZP-NZB) )

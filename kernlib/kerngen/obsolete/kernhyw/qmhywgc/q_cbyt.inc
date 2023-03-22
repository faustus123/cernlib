*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:52:46  mclareni
* Initial revision
*
*
*
* q_cbyt.inc
*
      MCBYT (MZ,IZQ,IZW,IZP,NZB) = IOR ( IAND (IZW, NOT(
     +                         ILS (IRL(NOT(0),36-NZB), IZP-1)))
     +                , IRL (ILS(IRL(MZ,IZQ-1),36-NZB), 37-IZP-NZB) )

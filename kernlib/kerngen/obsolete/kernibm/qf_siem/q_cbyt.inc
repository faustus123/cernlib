*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:53:03  mclareni
* Initial revision
*
*
*
* q_cbyt.inc
*
      MCBYT (MZ,IZQ,IZW,IZP,NZB) = LOR ( LAND (IZW, LCOMPL(
     +                         SHFTL (SHFTR(-1,32-NZB), IZP-1)))
     +          , SHFTR (SHFTL(SHFTR(MZ,IZQ-1),32-NZB), 33-IZP-NZB) )

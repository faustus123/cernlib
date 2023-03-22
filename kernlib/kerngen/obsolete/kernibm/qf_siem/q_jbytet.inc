*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:53:03  mclareni
* Initial revision
*
*
*
* q_jbytet.inc
*
      JBYTET (MZ,IZW,IZP,NZB) = LAND (MZ,
     +                        SHFTR (SHFTL(IZW,33-IZP-NZB), 32-NZB) )
      JBYTOR (MZ,IZW,IZP,NZB) = LOR  (MZ,
     +                        SHFTR (SHFTL(IZW,33-IZP-NZB), 32-NZB) )
      MBYTET (MZ,IZW,IZP,NZB) = LAND (IZW, LCOMPL(SHFTR (
     +                       SHFTL(LCOMPL(MZ),32-NZB), 33-IZP-NZB)) )
      MBYTOR (MZ,IZW,IZP,NZB) = LOR (IZW, SHFTR (
     +                               SHFTL(MZ,32-NZB), 33-IZP-NZB) )

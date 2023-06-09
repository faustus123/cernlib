*
* $Id$
*
* $Log$
* Revision 1.2  2006/09/15 09:35:16  mclareni
* Submitted mods for gcc4/gfortran and MacOSX, corrected to work also on slc4 with gcc3.4 and 4.1
*
* Revision 1.1.1.1  1996/02/15 17:49:19  mclareni
* Kernlib
*
*
*
* q_cbyt.inc
*
#if defined(CERNLIB_QMLNX) && (!defined(CERNLIB_GFORTRAN))
      MCBYT (MZ,IZQ,IZW,IZP,NZB) = OR (
     +       AND (IZW, NOT(LSHIFT (ISHFTR(NOT(0),32-NZB),IZP-1)))
     +      ,ISHFTR (LSHIFT(LSHIFT(MZ,IZQ-1),32-NZB), 33-IZP-NZB))
#elif defined(CERNLIB_QMDOS)&&defined(CERNLIB_QF_F2C)
C      MCBYT (MZ,IZQ,IZW,IZP,NZB) = OR (
C     +          AND (IZW, NOT(LSHIFT (ishftr(NOT(0),32-NZB), IZP-1)))
C     +        , ishftr (LSHIFT(LSHIFT(MZ,-IZQ+1),32-NZB), 33-IZP-NZB) )
#elif defined(CERNLIB_QMOS9)||defined(CERNLIB_QMHPX)||(defined(CERNLIB_QMDOS)&&(!defined(CERNLIB_QF_F2C)))
      MCBYT (MZ,IZQ,IZW,IZP,NZB) = IOR (
     +          IAND (IZW, NOT(ISHFT (ISHFT(NOT(0),-32+NZB), IZP-1)))
     +        , ISHFT (ISHFT(ISHFT(MZ,-IZQ+1),32-NZB), -33+IZP+NZB) )
#elif defined(CERNLIB_GFORTRAN)
      MCBYT (MZ,IZQ,IZW,IZP,NZB) = IOR (
     +          IAND (IZW, NOT(ISHFT (ISHFT(NOT(0),-32+NZB), IZP-1)))
     +        , ISHFT (ISHFT(ISHFT(MZ,IZQ-1),32-NZB), -33+IZP+NZB) )
#endif

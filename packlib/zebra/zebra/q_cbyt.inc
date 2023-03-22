*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/06 10:46:51  mclareni
* Initial revision
*
*
#ifndef CERNLIB_ZEBRA_Q_CBYT_INC
#define CERNLIB_ZEBRA_Q_CBYT_INC
*
*
* q_cbyt.inc
*
#if defined(CERNLIB_APOLLO)
      MCBYT (MZ,IZQ,IZW,IZP,NZB) = OR (
     +      AND (IZW, NOT(LSHFT (RSHFT(NOT(INT4(0)),32-NZB), IZP-1)))
     +    , RSHFT (LSHFT(RSHFT(MZ,IZQ-1),32-NZB), 33-IZP-NZB) )

#elif defined(CERNLIB_CDC)
      MCBYT (MZ,IZQ,IZW,IZP,NZB) = SHIFT (
     +            (SHIFT(IZW,61-IZP-NZB) .AND. .NOT.MASK(NZB))
     +       .OR. (SHIFT (MZ,61-IZQ-NZB) .AND. MASK(NZB)), IZP+NZB-1)

#elif defined(CERNLIB_CRAY)
      MCBYT (MZ,IZQ,IZW,IZP,NZB)=(IZW.AND.SHIFT(MASK(64-NZB),IZP-1))
     +         .OR. SHIFT(SHIFTR(MZ,IZQ-1).AND.MASK(128-NZB),IZP-1)

#elif (defined(CERNLIB_MSDOS))&&(defined(CERNLIB_QF_F2C))
C      MCBYT (MZ,IZQ,IZW,IZP,NZB) = OR (
C     +          AND (IZW, NOT(LSHIFT (ishftr(NOT(0),32-NZB), IZP-1)))
C     +        , ishftr (LSHIFT(LSHIFT(MZ,-IZQ+1),32-NZB), 33-IZP-NZB) )

#elif defined(CERNLIB_QF_SIEM)
      MCBYT (MZ,IZQ,IZW,IZP,NZB) = LOR (
     +            LAND (IZW, LCOMPL(SHFTL (SHFTR(-1,32-NZB), IZP-1)))
     +          , SHFTR (SHFTL(SHFTR(MZ,IZQ-1),32-NZB), 33-IZP-NZB) )

#elif defined(CERNLIB_LINUX)
      MCBYT (MZ,IZQ,IZW,IZP,NZB) = OR (
     +       AND (IZW, NOT(LSHIFT (ISHFTR(NOT(0),32-NZB),IZP-1)))
     +      ,ISHFTR (LSHIFT(LSHIFT(MZ,IZQ-1),32-NZB), 33-IZP-NZB))

#elif defined(CERNLIB_PDP)
      MCBYT (MZ,IZQ,IZW,IZP,NZB) = IOR (
     +          IAND (IZW, NOT(ISHFT (ISHFT(NOT(0),-36+NZB), IZP-1)))
     +        , ISHFT (ISHFT(ISHFT(MZ,-IZQ+1),36-NZB), -37+IZP+NZB) )

#elif defined(CERNLIB_VAXVMS)

#elif defined(CERNLIB_QMVDS)
      MCBYT (MZ,IZQ,IZW,IZP,NZB) = OR (
     +            AND (IZW, NOT(LSHFT (RSHFT(NOT(0),32-NZB), IZP-1)))
     +          , LSHFT(JBYT(MZ,IZQ,NZB), IZP-1) )

#elif 1
      MCBYT (MZ,IZQ,IZW,IZP,NZB) = IOR (
     +          IAND (IZW, NOT(ISHFT (ISHFT(NOT(0),-32+NZB), IZP-1)))
     +        , ISHFT (ISHFT(ISHFT(MZ,-IZQ+1),32-NZB), -33+IZP+NZB) )

#endif

#endif

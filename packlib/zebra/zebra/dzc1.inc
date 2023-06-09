*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/06 10:46:56  mclareni
* Initial revision
*
*
#ifndef CERNLIB_ZEBRA_DZC1_INC
#define CERNLIB_ZEBRA_DZC1_INC
*
*
* dzc1.inc
*
      PARAMETER(NOFMTQ=0)
      PARAMETER(MSYSFQ=5,MSYSDQ=7,MSYSKQ=8,MSYSPQ=9)

      COMMON /DZC1/  IFLOPT(26),
     +               JDROP,LN,LS,LX,IO,NL,NS,ND,
     +               IBASE,LBASE,NDW,JDFD,JD,JTYP

      PARAMETER (NSTMXQ=16,NDVMXQ=20,LNULL=0,NOFLIQ=8,NCHEKQ=-7)

      PARAMETER (MCQSIQ=8,MCQLSQ=2,MCQLGQ=15,MCQLTQ=19,MCQLIQ=87)
      CHARACTER CQSTAK*13,CQINFO*40
      PARAMETER (NLICHQ=130,NSTCHQ=8,NDVCHQ=8,NBKCHQ=4 )
      CHARACTER CQLINE*(NLICHQ),CQMAP(10)*(NLICHQ)
      CHARACTER CQSTOR*(NSTCHQ),CQDIV*(NDVCHQ),CQID*(NBKCHQ)
      COMMON /DZC1CH/ CQSTOR,CQDIV,CQID,CQMAP,CQSTAK,CQINFO
      EQUIVALENCE (CQLINE,CQMAP)

      CHARACTER   CDUMMQ*(*)
      PARAMETER ( CDUMMQ = ' ' )

#endif

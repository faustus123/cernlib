*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/28 16:24:03  mclareni
* Initial revision
*
*
#ifndef CERNLIB_HEPDB_CDCBLK_INC
#define CERNLIB_HEPDB_CDCBLK_INC
*
*
* cdcblk.inc
*
      COMMON /GCBANK/ FENCCD(22), LQ(9)
      DIMENSION       IQ(2), Q(2)
      EQUIVALENCE     (IQ(1),Q(1),LQ(9))
*
      COMMON /QUEST/  IQUEST(100)
*
      PARAMETER       (IKTYCD=33, KNSDCD=23, KLSDCD=26, NWNOCD=16)
      PARAMETER       (KLKDCD=27, KNKDCD=31)
      PARAMETER       (NWITCD=28, NPUSCD=50, MAXLCD=80, MXPACD=10)
      PARAMETER       (JRZUCD=1, JIGNCD=2, JPRTCD=3, JASFCD=4)
      PARAMETER       (KLKYCD=0, KLDACD=1, KLNOCD=2, KLUPCD=3, KLDICD=2)
      PARAMETER       (KLFZCD=3, MFZTOP=1, MFZDIR=5, MXLWCD=20)
      PARAMETER       (MNDNWK=1, MNDNWD=2, MNDNCH=3, MNDDIC=4)
      PARAMETER       (MNDIOF=5, MNDNAM=NWNOCD+5, NLKYCD=3, NSKYCD=1)
      PARAMETER       (MKYRID=-4, MKYCEV=-3, MKYCRU=-2, MKYPRE=-1)
      PARAMETER       (MKYFRI=0)
      PARAMETER       (MDCNTM=1, MDCITM=1, MDCNCH=2, MDCLUP=3, MDCCMP=4)
      PARAMETER       (MDCPRC=5, MDCDEL=6, MDCALI=7, MDCNAM=9)
      PARAMETER       (NARGCD=20)
      PARAMETER       (MUPLUN=1, MUPFLG=2, MUPSRV=3, MUPSHR=4, MUPAIR=5)
      PARAMETER       (MUPDIC=6, MUPKIN=7, MUPJFL=8, MUPBAK=9,MUPNCH=10)
      PARAMETER       (MUPKY7=7, MUPNAM=11,MUPHFL=MUPNAM+4)
      PARAMETER       (NLUPCD=3, NSUPCD=2, NDUPCD=MUPHFL)
#include "hepdb/cdlufm.inc"
      PARAMETER       (IDHKSN=1, IDHPTR=2, IDHFLG=3, IDHINS=4, IDHUSI=6,
     +                 IDHSRN=7, IDHEX1=8, IDHEX2=9, IDHEX3=10)
* For DBL3
*     PARAMETER       (IDHKSN=1, IDHPTR=2, IDHFLG=6, IDHINS=7, IDHUSI=5)
      PARAMETER       (MPSRCD=1, MXKPCD=2, MOBJCD=5)
      PARAMETER       (MHFMCD=3, MLEVCD=3, MNAMCD=7, MNCHCD=5, MNDWCD=4)
      PARAMETER       (MNFNCD=3, MNLVCD=2, MNNUCD=2, MNODCD=4, MPNNCD=2)
      PARAMETER       (MPNLCD=1, MPPLCD=8, MXOFCD=5, MXWDCD=6, MYFLCD=7)
      PARAMETER       (MYFNCD=6)
      COMMON /CDCBLK/ LCDRCD, LJNKCD, IBIGCD, INSRCD, IOVRCD
     +              , KYENCD(MXPACD), IARGCD(NARGCD)
      COMMON /CDIOBK/ IODICD, IOFDCD, IOFZCD, IOKYCD(NWNOCD), IONOCD
     +              , IOUPCD
      COMMON /CDUPCD/ IOPPCD, IOPSCD, ITOPCD, IOUTCD, LUBKCD, LUFZCD
     +              , LURZCD, MXINCD, NCHRCD, NPARCD, IHFLCD
      COMMON /CDDICD/ DELTCD, ICMPCD, IPRECD, ITNUCD, LUPDCD
      COMMON /CDCHVR/ TOPNCD, CALICD
      CHARACTER       TOPNCD*16, CALICD*8
#include "hepdb/cduscm.inc"

#endif

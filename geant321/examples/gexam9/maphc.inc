*
* $Id$
*
* $Log$
* Revision 1.1  1995/10/24 10:22:22  cernlib
* Initial revision
*
*
*
* maphc.inc
*
      PARAMETER (MAXENE=8,MAXEV=1000,MAXKP=MAXEV*MAXENE)
      COMMON/MAPHC/FMAP(58,30,10),ZMAP(45,30,10),RNON(10),NP1,NPZ,
     +         KP(MAXEV),KEVN,IBUF(20000)
      INTEGER*2 IBUF,KP
*

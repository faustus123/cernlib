*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:32:58  mclareni
* Initial revision
*
*
#ifndef CERNLIB_KUIP_KCPAR_INC
#define CERNLIB_KUIP_KCPAR_INC
*
*
* kcpar.inc
*
      PARAMETER (MAXPAR=100)
      COMMON /KCPARI/ PARPTR(4,MAXPAR),GETPAR,ICLENG,ICLIST,
     +                IPFLAG(MAXPAR),NONPOL,NOPOS1
      INTEGER PARPTR,GETPAR

      COMMON /KCPARS/ GETSPY,SPYFLG,PROFLG,SPYING
      INTEGER GETSPY
      LOGICAL SPYFLG,PROFLG,SPYING

      COMMON /KCDEFL/ DEFLAG
      LOGICAL DEFLAG

      COMMON /KCPART/ TOTPAR
      INTEGER TOTPAR

      COMMON /KCPARC/ PARLST,CLIST,NOALIN,COMAND,CHLAST,NONPOS
      CHARACTER*80  CLIST,COMAND
      CHARACTER*(MAXCMD) NONPOS
      CHARACTER*(MAXCMD) PARLST,NOALIN,CHLAST

#endif

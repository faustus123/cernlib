*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/06 10:47:02  mclareni
* Initial revision
*
*
*
* fqtlun.inc
*
      COMMON /FQTLUN/LUNT1,LUNT2,LUNT3,LUNPTR(3),NLUNT, LOGLEV,JMAKE
     +,              LEVIN,LEVOUT,MAXMAK,MKBREA,MINPR,MAXPR
                           DIMENSION     LUNTV(3)
                           EQUIVALENCE  (LUNTV(1),LUNT1)
*    ------   for tests of MQ  ---------------------------------

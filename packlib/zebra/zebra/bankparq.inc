*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/06 10:46:55  mclareni
* Initial revision
*
*
#ifndef CERNLIB_ZEBRA_BANKPARQ_INC
#define CERNLIB_ZEBRA_BANKPARQ_INC
*
*  BANK  PARAMETERS
*
* bankparq.inc
*
      PARAMETER(NBKHDQ=1,NBKCTQ=9,NBKOHQ=NBKHDQ+NBKCTQ,NBKJMQ=12)
      PARAMETER(MBKLNQ=0,JBKSKQ=1,NBKSKQ=16)
      PARAMETER(MBKIOQ=MBKLNQ,JBKIOQ=NBKSKQ+1,NBKIOQ=16)
      PARAMETER(JBKUSQ=1,NBKUSQ=18,JBKSYQ=NBKUSQ+1,NBKSYQ=32-NBKUSQ)

#endif

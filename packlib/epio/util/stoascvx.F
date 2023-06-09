*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:21:49  mclareni
* Initial revision
*
*
#include "epio/pilot.h"
#if (defined(CERNLIB_VAX)||defined(CERNLIB_STF77VX))&&(!defined(CERNLIB_STF77))
      SUBROUTINE STOASC(SOURCE,N1,TARGET,N2,NCH)
C.+++++++ VAX VERSION ++++++++++
C. CONVERTS A HOLLERITH STRING FROM INTERNAL ASCII TO
C. EXTERNAL ASCII, I.E. ON VAX PERFORMS BYTE SWAPPING ONLY.
C. BY MAKING SOURCE AND TARGET, AND N1 AND N2 IDENTICAL, THE ROUTINE CAN
C. BE USED FOR BYTE SWAPPING ONLY.
C.
C. THE VAX VERSION IS IDENTICAL TO THE VAX VERSION OF SFRASC .
C.
C.  PARAMETERS
C.
C.  SOURCE     ARRAY CONTAINING THE INPUT ASCII STRING
C.  N1         FIRST CHARACTER IN SOURCE TO CONVERT
C.  TARGET     ARRAY RECEIVING THE OUTPUT ASCII STRING (SWAPPED BYTES)
C.  N2         FIRST CHARACTER POSITION OF CONVERTED STRING IN TARGET
C.  NCH        NUMBER OF CHARACTERS TO CONVERT
C.
C. THE ROUTINE ALLOWS THE SIMULTANEOUS CONVERSION AND CONCATENATION
C. OF A STRING. ON VAX, IBM ( NOT CDC ! ), SOURCE AND TARGET MAY OVERLAP
C. AS LONG AS N2.LE.N1  .
C.
      LOGICAL*1 K1,K2,SOURCE(NCH),TARGET(NCH)
C     CHARACTER*1 K1,K2,SOURCE(NCH),TARGET(NCH)
      IF(NCH.LE.0)  GOTO 77777
      DO 20  I=1,NCH,2
      K1=SOURCE(N1+I-1)
      K2=SOURCE(N1+I)
      TARGET(N2+I-1)=K2
   20 TARGET(N2+I)=K1
77777 RETURN
      END
#endif

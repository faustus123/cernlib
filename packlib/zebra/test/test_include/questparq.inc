*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/06 10:47:02  mclareni
* Initial revision
*
*
*  Parameters defining the error handling in IQUEST
*
* questparq.inc
*



      PARAMETER (MARE1Q=-1      ,MARE2Q=MARE1Q-1,MARE3Q=MARE2Q-1,
     X           MARE4Q=MARE3Q-1,MARE5Q=MARE4Q-1,MARE6Q=MARE5Q-1,
     X           MARE7Q=MARE6Q-1)
      PARAMETER (MBKD1Q=MARE7Q-1,MBKD2Q=MBKD1Q-1)
      PARAMETER (MBKU1Q=MBKD2Q-1,MBKU2Q=MBKU1Q-1,MBKU3Q=MBKU2Q-1,
     X           MBKU4Q=MBKU3Q-1)
      PARAMETER (MBKX1Q=MBKU4Q-1,MBKX2Q=MBKX1Q-1,MBKX3Q=MBKX2Q-1)
      PARAMETER (MCHV1Q=MBKX3Q-1)
      PARAMETER (MFOR1Q=MCHV1Q-1,MFOR2Q=MFOR1Q-1,MFOR3Q=MFOR2Q-1)
      PARAMETER (MIOP1Q=MFOR3Q-1)
      PARAMETER (MSHO1Q=MFOR3Q-1,MSHO2Q=MSHO1Q-1)
      PARAMETER (MSHP1Q=MSHO2Q-1)
      PARAMETER( MSNA1Q=MSHP1Q-1,MSNA2Q=MSNA1Q-1,MSNA3Q=MSNA2Q-1,
     X           MSNA4Q=MSNA3Q-1,MSNA5Q=MSNA4Q-1,MSNA6Q=MSNA5Q-1,
     X           MSNA7Q=MSNA6Q-1,MSNA8Q=MSNA7Q-1)
      PARAMETER (MSUR1Q=MSNA8Q-1)
      PARAMETER( MVER1Q=MSUR1Q-1,MVER2Q=MVER1Q-1,MVER3Q=MVER2Q-1,
     X           MVER4Q=MVER3Q-1,MVER5Q=MVER4Q-1,MVER6Q=MVER5Q-1,
     X           MVER7Q=MVER6Q-1,MVER8Q=MVER7Q-1,MVER9Q=MVER8Q-1,
     X           MVE10Q=MVER9Q-1)

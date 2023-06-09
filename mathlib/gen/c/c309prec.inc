*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:01:55  mclareni
* Initial revision
*
*
*
* c309prec.inc
*

#if defined(CERNLIB_IBM)||defined(CERNLIB_IBMAIX)
      PARAMETER(FPMAX = 1D60, FPMIN = 2D-61)
      PARAMETER(ACCU = 1D-14, ACC8 = 2D-16, ACC16 = 3D-33)

#elif defined(CERNLIB_VAX)
      PARAMETER(FPMAX = 1D21, FPMIN = 3D-22)
      PARAMETER(ACCU = 5D-15, ACC8 = 2D-17, ACC16 = 3D-34)

#elif defined(CERNLIB_CDC)
      PARAMETER(FPMAX = 1E250, FPMIN = 1E-250)
      PARAMETER(ACCU = 1D-13, ACC8 = 4D-15, ACC16 = 2D-29)

#elif (defined(CERNLIB_CONVEX))&&(defined(CERNLIB_SINGLE))
      PARAMETER(FPMAX = 3D292, FPMIN = 2D-293)
      PARAMETER(ACCU = 1D-14, ACC8 = 2D-16, ACC16 = 2D-34)

#elif defined(CERNLIB_NECSX)
      PARAMETER(FPMAX = 4D74 , FPMIN = 5D-79 )
      PARAMETER(ACCU = 1D-14, ACC8 = 2D-16, ACC16 = 2D-16)

#elif (defined(CERNLIB_SINGLE))&&(!defined(CERNLIB_CDC))&&(!defined(CERNLIB_CONVEX))
      PARAMETER(FPMAX = 1E2451, FPMIN = 1E-2451)
      PARAMETER(ACCU = 1D-12, ACC8 = 7D-15, ACC16 = 2D-29)

#elif defined(CERNLIB_QUAD)
      PARAMETER(FPMAX = 3D292, FPMIN = 2D-292)
      PARAMETER(ACCU = 1D-14, ACC8 = 2D-16, ACC16 = 2D-34)

#elif 1
      PARAMETER(FPMAX = 3D292, FPMIN = 2D-292)
      PARAMETER(ACCU = 1D-14, ACC8 = 2D-16, ACC16 = 2D-16)
#endif

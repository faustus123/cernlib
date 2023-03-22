      PROGRAM COMIS64BITEXAMPLE

c     Using COMIS safely on 64-bit architectures.  This example will
c     call the BESI0 function in mathlib and the ERFC intrinsic using
c     COMIS, and show some of the complications of using COMIS on
c     AMD64/EM64t/Itanium.  Generally one would use COMIS to interpret
c     or compile a separate file of FORTRAN 77 code, rather than using
c     it as a FORTRAN version of dlopen(), but that would make this
c     example too complicated.
c
c     Compile with:
c     gfortran -Wall comis-64bit-example.F `cernlib pawlib mathlib`
c     
c     See also /usr/share/doc/libpawlib2-dev/README.64-bit
c     and /usr/share/doc/libpawlib2-dev/README.Debian
c     and the COMIS documentation at 
c     http://wwwasdoc.web.cern.ch/wwwasdoc/comis/comimain.html

c     Variable declarations
      IMPLICIT NONE

      EXTERNAL CSADDR, CSEXT, CSINIT, CSRJCL, CSSETL, HLIMIT

c     Functions we wish to pass to COMIS must be declared EXTERNAL
c     (even MYERFC which is defined below in this file).
      EXTERNAL BESI0, MYERFC
      
      REAL BESI0, CSRJCL, MYERFC, fparameter, fresult, r(1)
      INTEGER CSADDR, naddr

c     We put the fparameter variable in a COMMON block for the benefit
c     of 64-bit architectures, since it will be passed to a COMIS
c     routine (CSRJCL).  COMIS is not able to deal well
c     with pointers outside of a program's data segment.  For the same
c     reason, this program must be *statically* linked to the CERN
c     libraries (the "cernlib" linking command in Debian outputs the
c     necessary linker flags to do so).
      COMMON/BLOCK64/ fparameter

c     Set up COMIS; the following two lines are probably needed in
c     this order in just about any COMIS program.
      CALL HLIMIT(10000)
      CALL CSINIT(10000)

c     Tell COMIS that we want to use an external library function,
c     BESI0 (the zeroth-order Bessel function in Mathlib).  The
c     COMIS documentation claims we could do it like this:
c
c     CALL CSEXT('BESI0.R#', BESI0)
c
c     ... but in reality, dummy "r" arguments are required to fill out
c     all eleven arguments to CSEXT() because gfortran will otherwise
c     pass the length of the string 'BESI0.R#' in the wrong position.
c     No, FORTRAN 77 doesn't really have variadic functions.
      CALL CSEXT('BESI0.R#', BESI0, r,r,r,r,r,r,r,r,r)

c     Get address of the BESI0 function
      naddr = CSADDR('BESI0')

c     Print the value of BESI0(2.0) using COMIS
      fparameter = 2.0
      fresult = CSRJCL(naddr, 1, fparameter)
      WRITE (*, *) '*** Using BESI0 routine called via COMIS'
      WRITE (*, 1000) fresult
      WRITE (*, *) ' '

c     For comparison, print BESI0(2.0) calling the routine directly
      fresult = BESI0(fparameter)
      WRITE (*, *) '*** Using BESI0 routine called directly'
      WRITE (*, 1000) fresult
      WRITE (*, *) ' '

c     Another CSEXT call.  In principle we would insert ERFC in here,
c     but the compile command at top will link against libg2c
c     dynamically.  As a function in a shared library, the address of
c     ERFC will be outside of COMIS' range on some 64-bit architectures.
c     Hence we instead have to use a locally defined wrapper function,
c     MYERFC (see below).
      CALL CSEXT('ERFC.R#', MYERFC, r,r,r,r,r,r,r,r,r)

c     But note that we've tricked COMIS into thinking the function
c     really is named ERFC, so we can get its address this way:
      naddr = CSADDR('ERFC')

c     N.B. we could have combined the CSEXT calls for BESI0 and MYERFC
c     earlier, like thus:
c
c     CALL CSEXT('BESI0.R,ERFC.R#', BESI0, MYERFC, r,r,r,r,r,r,r,r)

c     Print the value of ERFC(2.0) using COMIS
      fresult = CSRJCL(naddr, 1, fparameter)
      WRITE (*, *) '*** Using MYERFC routine called via COMIS'
      WRITE (*, 1001) fresult
      WRITE (*, *) ' '

c     For comparison, print ERFC(2.0) calling the routine directly
      fresult = ERFC(fparameter)
      WRITE (*, *) '*** Using ERFC routine called directly'
      WRITE (*, 1001) fresult
      WRITE (*, *) ' '

1000  FORMAT ('Output of BESI0(2.0) is ', F5.3)
1001  FORMAT ('Output of ERFC(2.0) is ', F5.3)
      END


c     The wrapper function MYERFC, as promised above:
      REAL FUNCTION MYERFC(x)
      REAL x
c     this just calls the ERFC intrinsic defined in gfortran's library
      MYERFC = ERFC(x)
      END


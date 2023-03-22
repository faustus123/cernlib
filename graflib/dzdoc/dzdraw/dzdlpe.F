*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/04 16:13:06  mclareni
* Initial revision
*
*
#include "dzdoc/pilot.h"
      SUBROUTINE DZDLPE(LUNSGM)
#if defined(CERNLIB_BSLASH)
#include "dzdoc/bslash2.inc"
#endif
#if !defined(CERNLIB_BSLASH)
#include "dzdoc/bslash1.inc"
#endif
      WRITE(LUNSGM,'(15(1A/))')
     +BS//'setlength{'//BS//'unitlength}{1cm}',
     +BS//'newcommand{'//BS//'p}{'//BS//'put}',
     +BS//'newcommand{'//BS//'mup}{'//BS//'multiput}',
     +BS//'newcommand{'//BS//'f}{'//BS//'framebox}',
     +BS//'newcommand{'//BS//'m}{'//BS//'makebox}',
     +BS//'renewcommand{'//BS//'l}{'//BS//'line}',
     +BS//'renewcommand{'//BS//'v}{'//BS//'vector}',
     +BS//'newcommand{'//BS//'bp}{'//BS//'begin{picture}}',
     +BS//'newcommand{'//BS//'ep}{'//BS//'end{picture}}'
      RETURN
      END
***********************************************************************

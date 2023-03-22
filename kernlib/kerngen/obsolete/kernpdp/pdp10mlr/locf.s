*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:53:42  mclareni
* Initial revision
*
*
        TITLE LOCF   (A)
;#
; CERN PROGLIB#         LOCF            .VERSION KERNPDP  1.00  750903
;#
        ;FUNCTION, RETURNS LOCATION OF VARIABLE A
        SEARCH HELP
#include "reentr.inc"
        HELLO( LOCF)
        HRRZI 0,@(16)
        GOODBY
        PRGEND
#ifdef CERNLIB_TCGEN_LOCF
#undef CERNLIB_TCGEN_LOCF
#endif

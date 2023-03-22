*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:50:54  mclareni
* Initial revision
*
*
|--> IDENT: locb
| CERN PROGLIB# N100    LOCB            .VERSION KERNALT  1.08  891207
| ORIG. 28/06/88  JZ
 
        .text
        .globl  _locb_
        | JAD = LOCB (VAR)              lword adr of VAR
_locb_:
        movl    a0@, d0         | d0   = lad   byte adr
        rts
#ifdef CERNLIB_CCGEN_LOCB
#undef CERNLIB_CCGEN_LOCB
#endif
#ifdef CERNLIB_TCGEN_LOCB
#undef CERNLIB_TCGEN_LOCB
#endif

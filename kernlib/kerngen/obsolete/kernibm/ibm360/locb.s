*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:53:13  mclareni
* Initial revision
*
*
LOCB     CSECT
*
* CERN PROGLIB#         LOCB            .VERSION KERNIBM  2.29  891120
*
#if defined(CERNLIB_QMIBMXA)
*        SPLEVEL  SET=2
LOCB     AMODE ANY
LOCB     RMODE ANY
#endif
         L     15,0(1)
         LA    15,0(15)
         LR    0,15          . R0 = BYTE - ADR
         BCR   15,14
         END
#ifdef CERNLIB_TCGEN_LOCB
#undef CERNLIB_TCGEN_LOCB
#endif

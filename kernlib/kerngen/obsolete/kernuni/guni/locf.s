*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:53:56  mclareni
* Initial revision
*
*
 .                                      LAST MODIF.  03/05/72
 .                                      FROM COPENHAGEN  3/05/72
         AXR$
 .       IADR=LOCF(VAR)
LOCF*    L,H2      A0,0,X11             . A0=ADR(VAR)
         J         2,X11                . RETURN
         END
#ifdef CERNLIB_TCGEN_LOCF
#undef CERNLIB_TCGEN_LOCF
#endif

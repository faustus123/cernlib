*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:21:59  mclareni
* Initial revision
*
*
#if defined(CERNLIB_UNIVAC)
 . SUBROUTINE FITEM(PACKET) CALLS ER FITEM$ WITH PACKET 'PACKET'.
 . THE PACKET MUST BE AT LEAST 13 WORDS LONG
 . THIS IS A  F T N  VERSION FROM 1981-07-01.
          AXR$                        .
$(1),FITEM* LA      A0,0,A0           .
          LXI,U     A0,13             .
          ER        FITEM$            .
          J         0,X11             .
          END                         .
#endif

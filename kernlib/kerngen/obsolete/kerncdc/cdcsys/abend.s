*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:51:32  mclareni
* Initial revision
*
*
          IDENT ABEND
*
* CERN PROGLIB# Z035    ABEND           .VERSION KERNCDC  0.1   760623
*
          ENTRY ABEND
 MESS     VFD   36/6HABEND.,24/0
 ABEND    BSS   1
          MESSAGE MESS
          MX6   0
          RJ    =XSYSEND.
          ABORT ,NODUMP
          END

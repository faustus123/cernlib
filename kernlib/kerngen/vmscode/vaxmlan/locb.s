;
; $Id$
;
; $Log$
; Revision 1.1  1996/02/15 17:50:27  mclareni
; Initial revision
;
;
 .TITLE LOCB
;++
; CERN PROGLIB# N100    LOCB            .VERSION KERNVAX  2.33  891120
; ORIG.  17/11/89 JZ
;
; INTEGER FUNCTION LOCB(AM)
; Return the virtual address of AM in longwords
;--
        .IDENT  /01/
        .PSECT  $CODE,PIC,CON,REL,LCL,SHR,EXE,RD,NOWRT,LONG
        .ENTRY  LOCB,^M<>

        MOVL    4(AP),R0
        RET
        .END

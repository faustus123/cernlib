*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:44:21  mclareni
* Initial revision
*
*
#if defined(CERNLIB_IBMVM)
         PRINT GEN
LNRDPAS  EDCPROL
         BALR 12,0
         USING *,12                  R12 <-- REGISTRO BASE
         L     2,0(,1)               GET ADDR OF PARM 1
         MVC   PRBF,0(2)
         SR    1,1                       INDEX
         L     4,=F'1'                   INCREMENT
         L     5,=F'100'                 LIMIT
         LA    6,PRBF-1                  POINTER (I NEED IT FOR CLI)
LOOP1    EQU   *
         A     6,=F'1'                   UPDATE POINTER
         CLI   0(6),0                    FIRST NULL ?
         BE    MORBLAN
         BXLE  1,4,LOOP1
         A     6,=F'1'                   UPDATE POINTER
MORBLAN  SR    7,7
NEXBLAN  STC   7,0(6)
         A     6,=F'1'                   UPDATE POINTER
         BXLE  1,4,NEXBLAN
***********************************************************************
GETIT    LINERD DATA=(BUF,L'BUF),                                      *
               CASE=MIXED,                                             *
*                                                       *
#if !defined(CERNLIB_BATCH)
               TYPE=INVISIBLE,                                         *
*                                                        *
#endif
#if defined(CERNLIB_BATCH)
               TYPE=STACK,                                             *
*                                                                 *
#endif
               WAIT=YES,                                               *
               PROMPT=(PRBF,L'PRBF)
***********************************************************************
         SR    1,1                       INDEX
         L     4,=F'1'                   INCREMENT
         L     5,=F'240'                 LIMIT
         LA    15,BUF                    STRING ADDR
         LA    6,BUF-1                   POINTER (I NEED IT FOR CLI)
BUCLE    EQU   *
         A     6,=F'1'                   UPDATE POINTER
         CLI   0(6),C' '                 FIRST BLANC ?
         BE    PUTNUL
         BXLE  1,4,BUCLE
         A     6,=F'1'                   UPDATE POINTER
PUTNUL   SR    4,4
         STC   4,0(6)
FIN      EDCEPIL
         LTORG *
PRBF     DS    CL100
BUF      DS    CL240
         DS    C                         NULL HOLDER
         END   LNRDPAS
#endif

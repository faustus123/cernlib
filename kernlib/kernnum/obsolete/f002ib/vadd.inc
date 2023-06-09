*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:17  mclareni
* Initial revision
*
*
*
* vadd.inc
*
#include "basic.inc"
#include "add.inc"
           MACRO
           MAIN      &F
#include "global.inc"
 &TWORDS   SETA      0
           SETYPE
           HEADER    ENTRY               (N,X,X2,Y,Y2,Z,Z2)
 J         EQU       1
 NSTEP     EQU       2
 N         EQU       3
 X         EQU       4
 JX        EQU       5
 Y         EQU       6
 JY        EQU       7
 Z         EQU       8
 JZ        EQU       9
 JX2       EQU       10
 JY2       EQU       11
 JZ2       EQU       12
 &REGLIM   SETA      12
 ENTRY     PROLOG
           LM        3,9,0(1)
 *                                       R3 = (N)
 *                                       R4 = (X)
 *                                       R5 = (X2)
 *                                       R6 = (Y)
 *                                       R7 = (Y2)
 *                                       R8 = (Z)
 *                                       R9 = (Z2)
           N         9,=X'7FFFFFFF'
           L         N,0(3)
           LA        NSTEP,2             NSTEP=2
           C         N,=F'0'
           BC        LE,RETURN           IF(N .LE. 0) RETURN
           SR        5,4                 R5 = (X2) - (X) = JX
           SR        7,6                 R7 = (Y2) - (Y) = JY
           SR        9,8                 R9 = (Z2) - (Z) = JZ
           LR        JX2,JX
           LR        JY2,JY
           LR        JZ2,JZ
           AR        JX2,JX              JX2 = 2 * JX
           AR        JY2,JY              JY2 = 2 * JY
           AR        JZ2,JZ              JZ2 = 2 * JZ
           VADD      &F,N,X,JX,Y,JY,Z,JZ,JX2,JY2,JZ2,J
 RETURN    EPILOG
           MEND
#include "tglobal.inc"

#!/bin/csh  -fx
# Installation Jobs

 set  ORIG =   $CERN/patchy        # origin directory for step jinst3/4
 set  TARG =   $CERN/patchy/4.15/bin    # target directory
 set  FOPT  = "-fno-automatic -O0 $ADDFOPT"                # Fortran compiler options
 set  FOPTC = "-c $FOPT"

# *******************************************************************
# *                                                                 *
# *       Shell Script for Boot-strap / Re-installation             *
# *                        of PATCHY                                *
# *                                                                 *
# *******************************************************************

 if ( $#argv == 0 ) then
   tee <<\\
# Run this script with   csh  -v  p4inst.sh  j  >&p4inst.log  &
# where :
#     j  =  0  for Boot-strap
#        =  1  for Re-installation Part 1
#        =  2  for Re-installation Part 2
#        =  3  release the new files to the users, saving the old
#        =  4  release the new files to the users, only
#       other  as you may have changed the script.
#
#     Make sure there are no trailing blanks in this script !
#     Make sure that the variable PATH contains both . and ..
#
#   -------------------------------------------------------
\\
   exit
  endif

 set    clobber
 echo   "      variable ORIG = $ORIG"
 echo   "      variable TARG = $TARG"
 echo   "      variable PATH = $PATH"

 set   mode_xqt = $1
 if ( $mode_xqt == 0 )  goto jboot3
 if ( $mode_xqt == 1 )  goto jinst1
 if ( $mode_xqt == 2 )  goto jinst2
 if ( $mode_xqt == 3 )  goto jinst3
 if ( $mode_xqt == 4 )  goto jinst4
 if ( $mode_xqt == 15 ) goto step15
 if ( $mode_xqt == 16 ) goto step16
 echo '  ***** invalid parameter j, no execution *****'
 exit

jboot3:

# *******************************************************************
# *                                                                 *
# *  job BOOT 3 :  Boot-Strap, ie. first installation of PATCHY     *
# *                                                                 *
# *  This requires jobs BOOT 1+2 to have been executed              *
# *  such that the following files do now exist :                   *
# *                                                                 *
# *                      p4inceta       copy of file 2 of the tape  *
# *                      p4crad.cra     cradle                      *
# *                      fcasplit.f     program FCASPLIT            *
# *                      p4comp.fca     source ready to compile     *
# *                                                                 *
# *******************************************************************

goto step11
#   -------------------------------------------------------

jinst1:

# *******************************************************************
# *                                                                 *
# *  job INST 1 :   Re-Installation of PATCHY, Part 1               *
# *                                                                 *
# *******************************************************************

#     Before running re-installation part 1
#     the new files must have been copied from the tape with :
#
# select the right density on the magnetic tape unit
# load tape
# type    ansir
# reply   temp.sc    for 'file name'      skipping file 1
#         BINARY     for 'character code'
#         U          for 'record format'
#         3600       for 'block length'
#         3600       for 'record length'
#
# reply   p4inceta   for 'file name'         doing file 2
#         BINARY     for 'character code'
#         U          for 'record format'
#         3600       for 'block length'
#         3600       for 'record length'

# Note : you may have to remove the A option from the YFRCETA call;
#        this option causes Direct Access reading of the CETA file.

 yfrceta   p4inceta!  =p4make  AP    <<\\
  tty tty .go
+PAM, N=1.                     p4make.pam
+PAM, LUN=21, T=ATT, N=1     .=p4crad.pam
+PAM, LUN=21, T=ATT, N=2,4   .=p4pam.pam
+QUIT.
\\


# end yfrceta

 ytobcd    p4make =p4make.sh    <<\\
  - - tty .go
\\
 ytobcd    p4crad =p4crad.cra   <<\\
  - - tty .go
\\
 rm  p4crad.pam
 rm  p4make.pam
 chmod u+x  p4make.sh

#   Please inspect and adjust the new files  p4make.sh + p4crad.cra
#   before running Part 2 of the re-installation procedure.

 exit
#   -------------------------------------------------------

jinst2:

# *******************************************************************
# *                                                                 *
# *  job INST 2 :   Re-Installation of PATCHY, Part 2               *
# *                                                                 *
# *******************************************************************

 echo ' -----------   ---->  Run YPATCHY to generate the ASM files'

 ypatchy   <<\\
   p4pam =p4comp.fca p4crad tty -- =fcasplit  .go
\\

step11:
 echo ' -----------   ---->  Compile new program fcasplit'

 gfortran  $FOPT -o fcasplit  fcasplit.f
 chmod a+x  fcasplit

step12:
 echo ' -----------   ---->  Compile P4COMP,  create P4LIB'

 if ( -f libp4lib.a )  rm libp4lib.a
 if ( -d p4sub )  rm -r p4sub
 mkdir p4sub
 cd p4sub                    # operate in the sub-directory p4sub

 fcasplit  ../p4comp.fca  "$FOPTC"

 cat  p4comp.shfca
 tcsh  -f p4comp.shfca

 mv    ypatch.o    ../ypatch.o
 mv    ytobcd.o    ../ytobcd.o
 mv    ytobin.o    ../ytobin.o
 mv    ytocet.o    ../ytocet.o
 mv    yfrcet.o    ../yfrcet.o
 mv    ycompa.o    ../ycompa.o
 mv    yedit.o     ../yedit.o
 mv    yindex.o    ../yindex.o
 mv    ylist.o     ../ylist.o
 mv    ysearc.o    ../ysearc.o
 mv    yshift.o    ../yshift.o

 ar rc  ../libp4lib.a  *.o
 rm  *.o

 cd ../                                # back to normal
 ranlib libp4lib.a

step14:
 echo ' -----------   ---->  Make the new Patchy executable files'
 set  CLD  = "gfortran $FOPT"

 $CLD -o ypatchy  ypatch.o   libp4lib.a
 $CLD -o ytobcd   ytobcd.o   libp4lib.a
 $CLD -o ytobin   ytobin.o   libp4lib.a
 $CLD -o ytoceta  ytocet.o   libp4lib.a
 $CLD -o yfrceta  yfrcet.o   libp4lib.a
 $CLD -o ycompar  ycompa.o   libp4lib.a
 $CLD -o yedit    yedit.o    libp4lib.a
 $CLD -o yindexb  yindex.o   libp4lib.a
 $CLD -o ylistb   ylist.o    libp4lib.a
 $CLD -o ysearch  ysearc.o   libp4lib.a
 $CLD -o yshift   yshift.o   libp4lib.a

 chmod a+x  ypatchy
 chmod a+x  ytobcd
 chmod a+x  ytobin
 chmod a+x  ytoceta
 chmod a+x  yfrceta
 chmod a+x  ycompar
 chmod a+x  yedit
 chmod a+x  yindexb
 chmod a+x  ylistb
 chmod a+x  ysearch
 chmod a+x  yshift

 if ( $mode_xqt > 0 ) goto step16
step15:
 echo ' -----------   ---->  Read new Patchy PAM from the CETA file'

# Note : you may have to remove the A option from the YFRCETA call;
#        this option causes Direct Access reading of the CETA file.

 yfrceta  <<\\
   p4inceta!  =p4pam  AP  :go
+PAM, N=4,4.
+QUIT.
\\

step16:
 echo ' -----------   ---->  First run of new YPATCHY, repeat generation'

# *******************************************************************
# *                                                                 *
# *            Test run of YPATCHY                                  *
# *                                                                 *
# *******************************************************************

 cd p4sub                    # operate in the sub-directory p4sub

 ../ypatchy   <<\\
 help
   ../p4pam =asm.fca ../p4crad tty -- =asm2   .go
\\
#-----------
step17:
 echo ' Check new ASM files against originals'
 ../ytobin    <<\\
   asm.fca  =binfn    p  c+  :go
\\
 rm  asm.fca
 ../ytobin    <<\\
   ../p4comp.fca  =binf  +p c+  :go
\\
 ../ycompar   <<\\
   binfn binf         +      :go
\\
 echo ' 1 failure expected in step17 for difference in time'
 rm  binf.pam
 rm  binfn.pam
 cd ../                                # back to normal

# *******************************************************************
# *                                                                 *
# *            Test runs of the PATCHY Auxiliaries                  *
# *                                                                 *
# *******************************************************************

#-----------
stept1:

 cd p4sub                    # operate in the sub-directory p4sub

 echo ' Make PXUSE as PAM file used in the tests'
 ../yedit    <<\\
   ../p4pam =pxuse k ?+ tty  =y   .go
+OPTION, LOG, LEV=3.
?COPY, P=ALLPX*.
?GET,  P=ALLX*.
?COPY, P=FLDIALG.
?GET,  P=ARRIVE.
?SKIP, F=.
?COPY, P=QEND.
?GET, P=MQ.
+QUIT.
\\

#-----------
stept2:
 echo ' Check  YTOBCD, YTOBIN, YCOMPAR'
 ../ytobcd    <<\\
   pxuse =pxcar                .go
\\
 ../ytobin    <<\\
   pxcar =pxcopy q+            .go
\\
 rm  pxcar.car
 ../ycompar   <<\\
   pxcopy pxuse q+             .go
\\

#-----------
stept3:
 echo ' Exercise YEDIT'
#       This YEDIT run up-dates all PAM-titles,
#       giving raise to comparison failures later on

 ../yedit    pxuse =pxcopy ak - eof      .go
 ../ycompar  pxcopy pxuse q+             .go
 echo ' Comparison failures in stept3 as expected'

#-----------
stept4:
 echo ' Make P4TLIS to be listed'

 ../yedit    ../p4pam - dk \?+ tty :=P4TLIS .go   <<\\
?STREAM, NEW1, LUN=21, T=ATT      .=:P4TLIS
?COPY, P=FLDIALG.
?GET, P=QABEND.
?GET,, P=PINIT.
?GET,, P=ARRIVE, LEV=2.
?GET, ARBIN.
?GET,, P=YTOCETA, LEV=2.
?GET, TOCETA.
?GET,, P=YFRCETA.
?GET, FRCETA.
?GET, P=AUXINI,L=2.
?GET, P=POPIN.
?GET, -AUXFIL, P=SERVAUX.
?GET, -IOFILX, P=SERVICE.
?GET, QABEND-PABEND.
?SKIP, F=,L=2.
?XSKIP, F=KERNFOR, LEV=2.
+DEL.
+QUIT.
\\
#-----------
stept5:
 echo ' Try YINDEX + YLIST'

 ../yindexb   :P4TLIS -  :+1              .go
 ../ylistb    :P4TLIS w3 :+1              .go

#-----------
stept6:
 echo ' Try YSHIFT'

 ../yshift   pxuse =pxcopy p tty         .go   <<\\
MACRO,A4,B32,HEX,L30,-IBM,UNI,PDP,CDC
TAG, -MSK, MSKC, MSKI, MSKU
TAG, -DEBUG.
+PAM, N=1.
+QUIT.
\\
 ../ycompar  pxcopy pxuse q+             .go
 echo ' Possible comparison failures expected in stept6'

#-----------
stept7:
 echo ' Try YSEARCH'

 ../ysearch  pxuse =temp - tty           .go   <<\\
IBX
+PAM.
\\

 ../ysearch  pxuse =temp - tty - =temp   .go   <<\\
QUNIT
QMACH     XXYXX
QBCD
+OPT, SPLIT.
CCPARA    NCHCC     JCCTYP    MXCCIF
LADRV
NVOPER
JASK      ARRIVE
+PAM, N=1.
\\
 rm  temp.*

#-----------
stept8:
 echo ' Try YTOCETA/YFRCETA with disk-file'

 ../ytoceta  pxuse =ce.dat - tty         .go   <<\\
+PAM, N=2.
+QUIT.
\\
 ../yfrceta  ce.dat 1  q+ eof            .go
 ../ycompar  ce pxuse q+                 .go
 rm  ce.*
 rm  pxcopy.pam
 rm  pxuse.pam
 rm  P4TLIS.pam
 cd ../                                # back to normal
 mv  p4sub/P4TLIS.lis p4tlis.lis
 mv  p4sub/y.lis .
 echo ' look at file  y.lis'
 echo ' look at file  p4tlis.lis'
 exit
#   -------------------------------------------------------

# *******************************************************************
# *                                                                 *
# *  job INST 3 :   Instal the release files                        *
# *                                                                 *
# *******************************************************************

jinst3:
 echo ' -----------   ---->  Save the existing files'
 mv -f  $TARG/ypatchy   $TARG/ypatchy.prev
 mv -f  $TARG/ytobcd    $TARG/ytobcd.prev
 mv -f  $TARG/ytobin    $TARG/ytobin.prev
 mv -f  $TARG/ytoceta   $TARG/ytoceta.prev
 mv -f  $TARG/yfrceta   $TARG/yfrceta.prev
 mv -f  $TARG/ycompar   $TARG/ycompar.prev
 mv -f  $TARG/yedit     $TARG/yedit.prev
 mv -f  $TARG/yindexb   $TARG/yindexb.prev
 mv -f  $TARG/ylistb    $TARG/ylistb.prev
 mv -f  $TARG/ysearch   $TARG/ysearch.prev
 mv -f  $TARG/yshift    $TARG/yshift.prev
 mv -f  $TARG/fcasplit  $TARG/fcasplit.prev

jinst4:
 echo ' -----------   ---->  Instal the new files'
 mv -f  $ORIG/ypatchy   $TARG/ypatchy
 mv -f  $ORIG/ytobcd    $TARG/ytobcd
 mv -f  $ORIG/ytobin    $TARG/ytobin
 mv -f  $ORIG/ytoceta   $TARG/ytoceta
 mv -f  $ORIG/yfrceta   $TARG/yfrceta
 mv -f  $ORIG/ycompar   $TARG/ycompar
 mv -f  $ORIG/yedit     $TARG/yedit
 mv -f  $ORIG/yindexb   $TARG/yindexb
 mv -f  $ORIG/ylistb    $TARG/ylistb
 mv -f  $ORIG/ysearch   $TARG/ysearch
 mv -f  $ORIG/yshift    $TARG/yshift
 mv -f  $ORIG/fcasplit  $TARG/fcasplit
 exit

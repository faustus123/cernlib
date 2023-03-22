CDECK  ID>, HELPPR.
      SUBROUTINE HELPPR

      COMMON /QUNIT/ IQREAD,IQPRNT,IQPR2,IQLOG,IQPNCH,IQTTIN,IQTYPE
     +,              IQDLUN,IQFLUN,IQHLUN,IQCLUN,  NQUSED

C-----------  Directory for Public PAM Files
      CHARACTER    MPUBLI*(*)
      PARAMETER   (MPUBLI = '/cern/pro/pam/')



      WRITE (IQTYPE,9001)
      WRITE (IQTYPE,9002) MPUBLI
      WRITE (IQTYPE,9003)
      RETURN

 9001 FORMAT (1X
     F/' For each Stream indicated, give File/Option as parameter in'
     F/' 1-to-1 correspondance.'/
     F/' Parameters must be separated by 1 or more blanks,'
     F/' except: multiple - do not need imbedded blanks.' /
     F/' Special parameter values :'
     F/'   - or & : do not open this stream / option string void,'
     F/'            except READ : TTY/TTP if &, file name.cra if -'
     F/'                   PRNT : TTY if &,     file +y.lis   if -'
     F/' . or .go : use - for this and all remaining streams,'
     F/' : or :go : use & for this and all remaining streams,'
     F/'      TTY : use Terminal for this stream (only for READ+PRNT),'
     F/'      TTP : use TTY with prompting (only for READ),'
     F/'      EOF : void input (only for READ),'
     F/'     HELP : as you guessed.' )

 9002 FORMAT (1X/' Normal parameters :'
     F/'  File:  DIR/FN.EXT  path name; DIR/, .EXT  may be omitted,'
     F/'                     a default extension is added to the'
     F/'                     file name, unless it contains a dot'
     F/'                     or terminates with !'
     F/'    [:] +DIR/FN.EXT  open output file for Append'
     F/'    [:] =DIR/FN.EXT  open output file for Over-write'
     F/'    [:] *DIR/FN.EXT   = ',A,'DIR/FN.EXT  public files'
     F/'    [:] ~DIR/FN.EXT   = $HOME/DIR/FN.EXT  relative'
     F/'    [:] (X)/FN.EXT    = $X/FN.EXT   env. variable X'
     F/'    [:]  LNAME!      Link name, no default extension added'
     F/'     :   this prefix prevents conversion to lower case')
 9003 FORMAT (1X/
     F '     FN = n or n+  (n is digit 1 to 9) : use file-name of'
     F/'                   stream n without/with directory part'/
     F/' OPT/CCH: string of max. 8 characters; if the string needs'
     F/10X,'to start with  - or &  it should be enclosed by $ signs'/
     F/' You may give 1 or several parameters on a line, the machine'
     F/' will keep asking until its list is satisfied.'
     F/' After that, you type GO to start the run and open the files.'
     F/' If you type anything else  ABEND  occurs.'/1X)
      END

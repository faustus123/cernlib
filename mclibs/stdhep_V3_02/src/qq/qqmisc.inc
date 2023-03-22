*
* $Id$
*
* $Log$
* Revision 1.1  1996/05/21 08:39:53  cernlib
* Initial revision
*
* Revision 1.1.1.1  1994/10/08  02:21:33  zfiles
* first version of qqlib in CVS
*
*
*CMZ :  1.04/00 05/10/94  02.27.49  by  Peter C Kim
*CMZ :          05/10/94  02.18.26  by  Peter C Kim
*>> Author :
*
*  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
*                      QQMISC.INC
*
*              Some variables left behind
*  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
*
*  NEWDEC        Name of user-defined decay file (*.dec)
*  FTAPQQ        Name of ROAR output file (*.rp)

      CHARACTER NEWDEC*80, FTAPQQ*80
      COMMON /QQMIS1/
     *                 NEWDEC, FTAPQQ

*
* $Id$
*
* $Log$
* Revision 1.1  1996/05/21 08:39:52  cernlib
* Initial revision
*
* Revision 1.1  1994/10/07  23:57:36  zfiles
* New include files for QQ.
*
*
*CMZ :  1.02/61 05/10/94  02.20.16  by  Peter Kim
*CMZ :          05/10/94  02.20.00  by  Peter Kim
*>> Author :
*
*  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
*                      QQINFO.INC
*
*               QQ information
*  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
*
*  IVRSQQ        QQ Version number
*  IORGQQ        Origin of QQ events
*                   1 = QQ
*                   2 = JETSET
*                   3 = LUND90?
*                   4 = ISAJET
*                   5 = PYTHIA
*                   6-20 = reserved
*                 >21 = user defined
*  IRS1QQ(3)     Reserved for future use

      INTEGER IVRSQQ, IORGQQ, IRS1QQ
      COMMON /QQINF1/
     *     IVRSQQ, IORGQQ, IRS1QQ(3)


*  DATEQQ              Date the QQ job was run
*  TIMEQQ              Time the QQ job was run

      CHARACTER DATEQQ*20, TIMEQQ*20
      COMMON/QQINF2/
     *   DATEQQ, TIMEQQ

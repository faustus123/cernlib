*
* $Id$
*
* $Log$
* Revision 1.1  1996/05/21 08:39:52  cernlib
* Initial revision
*
* Revision 1.2  1995/04/25  13:58:07  zfiles
* New variable XANGQQ and IDKMEC
*
* Revision 1.1  1994/10/07  23:57:35  zfiles
* New include files for QQ.
*
*
*CMZ :  1.02/61 03/10/94  17.34.41  by  Paul Avery
*CMZ :          08/10/93  10.27.52  by  Paul Avery
*>> Author :
*
*  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
*                      QQEVNT.INC
*
*           QQ parameters at the start of an event
*  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
*
*  IEVTQQ              QQ Event number
*  IRUNQQ              QQ Run number
*  IRANQQ(2)           Random seeds at start of QQ event
*  IRANMC(2)           Random seeds at start of event in subsequent analysis
*  IRANCC(2)           Historical. Not used
*  IRS2QQ(5)           Reserved for future use
*  IBMRAD              0 ==> No photon radiated  1 ==> Photon radiated
*
*  ECM                 CM invariant mass after radiation
*  P4CMQQ(4)           4 vector of CM in lab
*  P4PHQQ(4)           4 vector of radiated photon
*  ENERNW              CM energy after radiation
*  BEAMNW              ENERNW/2
*  BEAMP               Positron energy
*  BEAMN               Electron energy
*  XANGQQ              Beam crossing angle (in mrad)
      INTEGER IEVTQQ, IRUNQQ
      INTEGER IRANQQ, IRANMC, IRANCC, IRS2QQ
      INTEGER IBMRAD
      COMMON/QQEVT1/
     *   IEVTQQ, IRUNQQ,
     *   IRANQQ(2), IRANMC(2), IRANCC(2), IRS2QQ(5),
     *   IBMRAD

      REAL ECM, P4CMQQ, P4PHQQ, ENERNW, BEAMNW, BEAMP, BEAMN
      REAL XANGQQ
      COMMON/QQEVT2/
     *   ECM, P4CMQQ(4), P4PHQQ(4),
     *   ENERNW, BEAMNW, BEAMP, BEAMN, XANGQQ




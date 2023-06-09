*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/07 15:17:59  mclareni
* Initial revision
*
*
*=======================================================================
*  Delete all entries in a subtree for DELPHI
*  which point to a tape in the robot.
*  The entries are deleted, whereas the tapes themselves
*  are software write-enabled and moved to a pool XX_FREE
*=======================================================================
      PARAMETER (LURCOR=200000)
      COMMON/CRZT/IXSTOR,IXDIV,IFENCE(2),LEV,LEVIN,BLVECT(LURCOR)
      DIMENSION    LQ(999),IQ(999),Q(999)
      EQUIVALENCE (IQ(1),Q(1),LQ(9)),(LQ(1),LEV)
*
      COMMON /USRLNK/LUSRK1,LUSRBK,LUSRLS
*
      COMMON /QUEST/IQUEST(100)
*
* Start of FATMEN sequence FATPARA
*
** ***     Data set bank mnemonics
*
*          Keys
      PARAMETER ( MKSRFA= 1, MKFNFA= 2, MKCLFA=7, MKMTFA=8
     1           ,MKLCFA= 9, MKNBFA=10, NKDSFA=10 )
*
** ***     Bank offsets
*
      PARAMETER ( MFQNFA=  1, MHSNFA= 65, MCPLFA= 67, MMTPFA= 68
     1           ,MLOCFA= 69, MHSTFA= 70, MHOSFA= 74
     2           ,MVSNFA= 77, MVIDFA= 79, MVIPFA= 81, MDENFA= 82
     3           ,MVSQFA= 83, MFSQFA= 84, MSRDFA= 85, MERDFA= 86
     4           ,MSBLFA= 87, MEBLFA= 88, MRFMFA= 89, MRLNFA= 90
     5           ,MBLNFA= 91, MFLFFA= 92, MFUTFA= 93, MCRTFA= 94
     6           ,MCTTFA= 95, MLATFA= 96, MCURFA= 97, MCIDFA= 99
     7           ,MCNIFA=101, MCJIFA=103, MFPRFA=105, MSYWFA=106
     8           ,MUSWFA=116, MUCMFA=126, NWDSFA=145
     9           ,MFSZFA=MSYWFA,MUSCFA=MSYWFA+1)
 
* End of FATMEN sequence FATPARA
      CHARACTER*6  DENS
      CHARACTER*8  LIB
      CHARACTER*4  LABTYP
      CHARACTER*1  MNTTYP
      CHARACTER*8  MODEL
      CHARACTER*7  ROBMAN(2)
      DATA         ROBMAN(1)/'-Robot '/,ROBMAN(2)/'-Manual'/
      PARAMETER (LKEYFA=10)
      PARAMETER (MAXFIL=3000)
      DIMENSION KEYS(LKEYFA,MAXFIL)
      CHARACTER*255 FILES(MAXFIL)
      CHARACTER*8   THRONG
      CHARACTER*255 TOPDIR
      CHARACTER*26  CHOPT
      CHARACTER*8   DSN
*
*
*     Initialise ZEBRA
*
      CALL MZEBRA(-3)
      CALL MZSTOR(IXSTOR,'/CRZT/','Q',IFENCE,LEV,BLVECT(1),BLVECT(1),
     +            BLVECT(5000),BLVECT(LURCOR))
      CALL MZLOGL(IXSTOR,-3)
 
*
* *** Define user division and link area like:
*
      CALL MZDIV  (IXSTOR, IXDIV, 'USERS', 50000, LURCOR, 'L')
      CALL MZLINK (IXSTOR, '/USRLNK/', LUSRK1, LUSRLS, LUSRK1)
*
*     Units for FATMEN RZ/FZ files
*
      LUNRZ = 1
      LUNFZ = 2
*
*     Initialise FATMEN
*
      CALL FMINIT(IXSTOR,LUNRZ,LUNFZ,'//CERN/delphi',IRC)
      CALL FMLOGL(1)
*
      DATA MAXUPD,NGROUP / 2000,25 /
      CALL FMUPDT(MAXUPD,NGROUP,0,IRC)
      IF (IRC.NE.0)  STOP 9
*
*     Get list of file names
*
      JCONT = 0
1     CONTINUE
      CALL FMLFIL('//CERN/DELPHI/P01_*/RAWD/NONE/Y90V00/E*/L*/*',
     +FILES,KEYS,NFOUND,MAXFIL,JCONT,IRC)
      IF(IRC.EQ.-1) THEN
        JCONT = 1
      ELSE
        JCONT = 0
      ENDIF
 
      PRINT *,NFOUND,' files found'
 
      DO 10 I=1,NFOUND
      LENF = LENOCC(FILES(I))
      PRINT *,'Processing ',FILES(I)(1:LENF)
      LBANK = 0
      CALL FMQMED(FILES(I)(1:LENF),LBANK,KEYS(1,I),IMEDIA,IROBOT,IRC)
      IF(IROBOT.NE.1) GOTO 10
      CALL FMSHOW(FILES(I)(1:LENF),LBANK,KEYS(1,I),'MG',IRC)
      GOTO 10
      CALL FMULOK(FILES(I)(1:LENF),LBANK,KEYS(1,I),' ',IRC)
      IF(IRC.NE.0) THEN
         PRINT *,'Return code ',IRC,' from FMULOK for ',
     +   FILES(I)(1:LENF)
         GOTO 10
      ENDIF
      CALL FMPOOL(FILES(I)(1:LENF),LBANK,KEYS(1,I),
     +            'XX_FREE',' ',IRC)
      IF(IRC.NE.0) THEN
         PRINT *,'Return code ',IRC,' from FMPOOL for ',
     +   FILES(I)(1:LENF)
         GOTO 10
      ENDIF
      CALL FMRM(FILES(I)(1:LENF),LBANK,KEYS(1,I),IRC)
      IF(IRC.NE.0) THEN
         PRINT *,'Return code ',IRC,' from FMRM for ',
     +   FILES(I)(1:LENF)
         GOTO 10
      ENDIF
10    CONTINUE
      IF(JCONT.NE.0) GOTO 1
*
        CALL FMUPDT(MAXUPD,NGROUP,1,IRC)
*
*     Terminate cleanly
*
      CALL FMEND(IRC)
 
      END
 

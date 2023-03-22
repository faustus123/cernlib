CDECK  ID>, MXJOIN.
      SUBROUTINE MXJOIN (MPATP,MDECP)

      DIMENSION    MPATP(9), MDECP(9)


      MPAT = MPATP(1)
      MDEC = MDECP(1)
      MOR  = MDEC                                                       -MSK
      CALL   SBYTOR (MPAT,MOR, 1,18)                                    -MSK
      MAND = JBYTET (MPAT,MDEC,1,10)                                    -MSK
C     MOR  = MPAT .OR.  MDEC                                             MSKC
C     MAND = MPAT .AND. MDEC                                             MSKC

      MINH = JBYT        (MAND,6,5)
C     NEW  = MINH .AND. MOR                                              MSKC
      NEW  = JBYTET (MINH,MOR, 1,5)                                     -MSK
      MUSE = JBYTET (MINH,MOR, 11,4)
      MSEL = JBYTET (MINH,MOR, 15,4)
      CALL   SBYT   (MINH,NEW, 6,5)
      CALL   SBYT   (MUSE,NEW, 11,4)
      CALL   SBYT   (MSEL,NEW, 15,4)
      CALL   SBYT   (NEW, MDECP(1),1,18)
      RETURN
      END

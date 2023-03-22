CDECK  ID>, MXNEW.
      FUNCTION MXNEW (MNEW,MDP)


      MGATE= JBYTET (MNEW,MDP,6,4)
      MOLD = JBYT (MDP,1,4)                                             -MSK
      MSUM = MOLD                                                       -MSK
      CALL SBYTOR (MGATE,MSUM,1,4)                                      -MSK
C     MOLD = MDP .AND. 15                                                MSKC
C     MSUM = MGATE .OR. MOLD                                             MSKC
      MXNEW= MSUM - MOLD
      RETURN
      END

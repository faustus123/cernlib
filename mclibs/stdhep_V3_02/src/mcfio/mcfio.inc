c
c Include file for mcfast i/o layer.
c
c        Paul Lebrun, October 1994.
c
        integer  MCFIO_VERSION 
        integer  MCFIO_STATUS 
        integer  MCFIO_RUNNING 
        integer  MCFIO_BOF
        integer  MCFIO_EOF
        integer  MCFIO_NUMBLOCKS
        integer  MCFIO_READORWRITE
        integer  MCFIO_READ
        integer  MCFIO_WRITE
        integer  MCFIO_DIRECTORSEQUENTIAL
        integer  MCFIO_DIRECT
        integer  MCFIO_SEQUENTIAL
        integer  MCFIO_BLOCKIDS
        integer  MCFIO_NUMWORDS
        integer  MCFIO_EFFICIENCY
        integer  MCFIO_NUMEVTS
        integer  MCFIO_FILENUMBER
        integer  MCFIO_MAXREC
        integer  MCFIO_MINREC
        integer  MCFIO_NUMRECORDS
        integer  MCFIO_RECORDLENGTHS
        integer  MCFIO_TITLE
        integer  MCFIO_COMMENT
        integer  MCFIO_CREATIONDATE
        integer  MCFIO_FILENAME
        integer  MCFIO_DEVICENAME
        integer  MCFIO_EVENTNUMBER
        integer  MCFIO_STORENUMBER
        integer  MCFIO_RUNNUMBER
        integer  MCFIO_TRIGGERMASK
        PARAMETER (MCFIO_VERSION = 100)
        PARAMETER (MCFIO_STATUS = 101)
        PARAMETER (MCFIO_RUNNING = 102)
        PARAMETER (MCFIO_BOF = 103)
        PARAMETER (MCFIO_EOF = 104)
        PARAMETER (MCFIO_NUMBLOCKS = 501)
        PARAMETER (MCFIO_READORWRITE = 502)
        PARAMETER (MCFIO_READ = 1)
        PARAMETER (MCFIO_WRITE = 2)
        PARAMETER (MCFIO_DIRECTORSEQUENTIAL = 503)
        PARAMETER (MCFIO_DIRECT = 1)
        PARAMETER (MCFIO_SEQUENTIAL = 2)
        PARAMETER (MCFIO_BLOCKIDS = 504)
        PARAMETER (MCFIO_NUMWORDS = 505)
        PARAMETER (MCFIO_EFFICIENCY = 506)
        PARAMETER (MCFIO_NUMEVTS = 507)
        PARAMETER (MCFIO_FILENUMBER = 508)
        PARAMETER (MCFIO_MAXREC = 509)
        PARAMETER (MCFIO_MINREC = 510)
        PARAMETER (MCFIO_NUMRECORDS = 511)
        PARAMETER (MCFIO_RECORDLENGTHS = 512)
        PARAMETER (MCFIO_TITLE = 1001)
        PARAMETER (MCFIO_COMMENT = 1002)
        PARAMETER (MCFIO_CREATIONDATE = 1003)
        PARAMETER (MCFIO_FILENAME = 1004)
        PARAMETER (MCFIO_DEVICENAME = 1005)
        PARAMETER (MCFIO_EVENTNUMBER = 2001)
        PARAMETER (MCFIO_STORENUMBER = 2002)
        PARAMETER (MCFIO_RUNNUMBER = 2003)
        PARAMETER (MCFIO_TRIGGERMASK = 2004)
       
        integer mcfio_OpenReadDirect
        integer mcfio_OpenWriteDirect
        integer mcfio_OpenReadSequential
        integer mcfio_OpenWriteSequential
        integer mcfio_NextEvent
        integer mcfio_SpecificEvent
        integer mcfio_NextSpecificEvent
        integer mcfio_Block
        integer mcfio_InfoNumStream
        
        external mcfio_OpenReadDirect
        external mcfio_OpenWriteDirect
        external mcfio_OpenReadSequential
        external mcfio_OpenWriteSequential
        external mcfio_NextEvent
        external mcfio_SpecificEvent
        external mcfio_NextSpecificEvent
        external mcfio_Block
        external mcfio_InfoNumStream
      
C
C Block definition now. Start counting at 101 See also mcfioC_GetBlockNames
C
        integer MCFIO_STDHEP
        integer MCFIO_STDHEPM
        integer MCFIO_STDHEPBEG
        integer MCFIO_STDHEPEND
        integer MCFIO_OFFTRACKARRAYS
        integer MCFIO_OFFTRACKSTRUCT
        integer MCFIO_TRACEARRAYS
        parameter ( MCFIO_STDHEP = 101 )
        parameter ( MCFIO_OFFTRACKARRAYS = 102 )
        parameter ( MCFIO_OFFTRACKSTRUCT = 103 )
        parameter ( MCFIO_TRACEARRAYS    = 104 )
        parameter ( MCFIO_STDHEPM = 105 )
        parameter ( MCFIO_STDHEPBEG = 106 )
        parameter ( MCFIO_STDHEPEND = 107 )
c
c        Some of these statements should be in the user code, 
c        uncommented.
c
c        integer xdr_mcfast_track_offline 
c        external xdr_mcfast_track_offline
c        integer xdr_mcfast_track_offlslow
c        external xdr_mcfast_track_offlslow
c
c

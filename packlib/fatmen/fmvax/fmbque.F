*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/07 15:18:22  mclareni
* Initial revision
*
*
#include "fatmen/pilot.h"
      SUBROUTINE FMBQUE(CHQUE,QUEUE_NAME_LEN)
 
      CHARACTER*(*) CHQUE
      STRUCTURE /ITMLST/
         UNION
            MAP
               INTEGER*2 BUFFER_LENGTH
               INTEGER*2 ITEM_CODE
               INTEGER*4 BUFFER_ADDRESS
               INTEGER*4 RETURN_LENGTH_ADDRESS
            ENDMAP
            MAP
               INTEGER*4 END_LIST /0/
            ENDMAP
         END UNION
      END STRUCTURE
 
 
      STRUCTURE /IOSBLK/
         INTEGER*4 STS,ZEROED
      END STRUCTURE
 
      RECORD /IOSBLK/ IOSB
      RECORD /ITMLST/ QUEUE_LIST(4)
 
      CHARACTER*31  QUEUE_NAME
      INTEGER*4     QUEUE_NAME_LEN
      INTEGER*4     SEARCH_FLAGS,QSTATUS
      INCLUDE '($QUIDEF)'
 
      SEARCH_FLAGS = QUI$_QUEUE_NAME
      LQUE         = LENOCC(CHQUE)
 
      QUEUE_LIST(1).BUFFER_LENGTH         = LQUE
      QUEUE_LIST(1).ITEM_CODE             = QUI$_SEARCH_NAME
      QUEUE_LIST(1).BUFFER_ADDRESS        = %LOC(CHQUE)
      QUEUE_LIST(1).RETURN_LENGTH_ADDRESS = 0
 
      QUEUE_LIST(2).BUFFER_LENGTH         = 4
      QUEUE_LIST(2).ITEM_CODE             = QUI$_SEARCH_FLAGS
      QUEUE_LIST(2).BUFFER_ADDRESS        = %LOC(SEARCH_FLAGS)
      QUEUE_LIST(2).RETURN_LENGTH_ADDRESS = 0
 
      QUEUE_LIST(3).BUFFER_LENGTH         = 31
      QUEUE_LIST(3).ITEM_CODE             = QUI$_QUEUE_NAME
      QUEUE_LIST(3).BUFFER_ADDRESS        = %LOC(QUEUE_NAME)
      QUEUE_LIST(3).RETURN_LENGTH_ADDRESS = %LOC(QUEUE_NAME_LEN)
 
      QUEUE_LIST(4).END_LIST              = 0
 
      QSTATUS = SYS$GETQUIW (,%VAL(QUI$_CANCEL_OPERATION),,,,,)
 
      QSTATUS = SYS$GETQUIW
     +   (,%VAL(QUI$_DISPLAY_QUEUE),,QUEUE_LIST,IOSB,,)
 
      END

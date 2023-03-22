#!/bin/csh
# run the standard jetset translation test executable
# the environment variables must be defined as below:
#   setup cern 
#   setup stdhep 
#   setup lund 
set echo

  mv stdtstp.lpt stdtstp.lpt.bak
  mv stdtstp.io  stdtstp.io.bak
 stdtstp

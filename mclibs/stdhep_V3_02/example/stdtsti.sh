#!/bin/csh
# run the standard isajet translation test executable
# the environment variables must be defined as below:
#   setup cern 
#   setup stdhep 
#   setup isajet
set echo

  mv stdtsti.lpt stdtsti.lpt.bak
  mv stdtsti.io  stdtsti.io.bak
 stdtsti

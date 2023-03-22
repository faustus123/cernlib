#!/bin/csh
# run the standard qq translation test executable
# the environment variables must be defined as below:
#   setup cern 
#   setup stdhep 
#   setup qq 
set echo

  mv stdtstq.lpt stdtstq.lpt.bak
  stdtstq

#!/bin/csh
# run the standard jetset translation test executable
# the environment variables must be defined as below:
#   setup cern 
#   setup stdhep 
#   setup lund 
set echo

  mv stdtstpx.lpt stdtstpx.lpt.bak
  mv stdtstpx.io  stdtstpx.io.bak
 stdtstpx

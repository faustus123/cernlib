#!/bin/csh
# run the standard jetset translation test executable
# the environment variables must be defined as below:
#   setup cern 
#   setup stdhep 
#   setup lund 
set echo

  mv stdtstjx.lpt stdtstjx.lpt.bak
  mv stdtstjx.io  stdtstjx.io.bak
 stdtstjx

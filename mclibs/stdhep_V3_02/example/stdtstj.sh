#!/bin/csh
# run the standard jetset translation test executable
# the environment variables must be defined as below:
#   setup cern 
#   setup stdhep 
#   setup lund 
set echo

  mv stdtstj.lpt stdtstj.lpt.bak
  mv stdtstj.io  stdtstj.io.bak
 stdtstj

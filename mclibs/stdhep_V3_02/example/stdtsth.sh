#!/bin/csh
# run the standard herwig translation test executable
# the environment variables must be defined as below:
#   setup cern 
#   setup stdhep 
#   setup herwig

  mv stdtsth.lpt stdtsth.lpt.bak
  mv stdtsth.io  stdtsth.io.bak
 stdtsth

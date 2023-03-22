#!/bin/csh
# run the standard herwig translation test executable
# the environment variables must be defined as below:
#   setup cern 
#   setup stdhep 
#   setup herwig
set echo

  mv stdtsthz.lpt stdtsthz.lpt.bak
  mv stdtsthz.fz  stdtsthz.fz.bak
 stdtsthz

#!/bin/csh
# run the standard translation test executable
# the environment variables must be defined as below:
#   setup stdhep 
set echo

  mv stdhep.lpt stdhep.lpt.bak
 stdtst

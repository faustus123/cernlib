#!/bin/csh
# run the multiple input stream test executable
# the environment variables must be defined as below:
#   setup cern 
#   setup stdhep 
# this example assumes that stdtsth, stdtsti, stdtstj, and stdtstp have run
#       successfully and that their *.IO files are present
set echo

  mv stdtstiom.lpt stdtstiom.lpt.bak
 stdtstiom

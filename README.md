# cernlib

This repository is my personal copy of the cernlib source where I can make modifications. Primarily to resolve issues with compiling on OSX. The code has been copied from here:

https://cernlib.web.cern.ch/version.html

It would have been preferable to fork the original repository so I could pull from that and submit merge requests for any fixes. But alas, they keep that on the internal cern gitlab server with access restricted to cern primary accounts. The location of that repository is here:

https://gitlab.cern.ch/DPHEP/cernlib/cernlib

Please note that this is covered by the original license that the code was distributed under. 


## Building instructions for macosx

1. Make sure [homebrew is installed](https://brew.sh/) and use it to install the `gsed` and `openmotif` packages like this:
~~~
brew install gsed
brew install openmotif
~~~

2. Clone this repository or download a release and build it with cmake. 
n.b. this will place the binaries in a directory called `install` in your current working directory. Adjust as desired.
~~~
git clone https://github.com/faustus123/cernlib
export CERN=${PWD}
export CERN_LEVEL=install
cmake -S cernlib -B build -DCMAKE_INSTALL_PREFIX=${CERN}/${CERN_LEVEL}
cmake --build build --target install -- -j8
export PATH=${CERN}/${CERN_LEVEL}/bin:${PATH}
~~~

3. Run `paw` or `paw++` via command line as usual.

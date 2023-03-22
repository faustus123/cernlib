class Cernlib < Formula
  desc "CERN library"
  homepage "https://gitlab.cern.ch/DPHEP/cernlib/"
#  url "file:///Volumes/Work/cernlib/TEMP/2022.11_src.tar.gz"
#  sha256 "836289153864a3838def071521b0f22c23785751285d4817ffb8565ecaa3b6a9"
  license "GPL-2.0-or-later"
  revision 1

  depends_on "cmake" => [:build]
  depends_on "gcc" => [:build]
  depends_on "coreutils" 
  depends_on "openmotif"
  depends_on "libXaw"
  def install
    mkdir "../build" do
      args = %W[
        -S 
        ../#{version}/src
        -DCMAKE_CXX_COMPILER=g++-#{Formula["gcc"].version_suffix}
        -DCMAKE_Fortran_COMPILER=gfortran-#{Formula["gcc"].version_suffix}
        -DCMAKE_C_COMPILER=gcc-#{Formula["gcc"].version_suffix}
        -DCMAKE_INSTALL_PREFIX=#{prefix}
        -DMOTIF_INCLUDE_DIR=#{Formula["openmotif"].include}
        -DMOTIF_LIBRARIES=#{Formula["openmotif"].lib}/libXm.dylib
      ]
      system "cmake", "-B", ".", *args
      system "cmake","--build", "."
      system "cmake", "--install","."
    end
  end
end

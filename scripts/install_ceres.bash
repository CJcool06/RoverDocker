# Ceres Installation

cd ~/dependencies
tar zxf ../dependencies/ceres-solver-2.0.0.tar.gz
mkdir ceres-bin && cd ceres-bin
cmake ../ceres-solver-2.0.0
make -j3
# make test
make install
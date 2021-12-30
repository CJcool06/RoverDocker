# AprilTags Installation

# Install AprilTag
cd ~/
git clone https://github.com/AprilRobotics/apriltag.git
cd apriltag
cmake .
make install

# Fix missing module import issue
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
source ~/.bashrc
ldconfig
ln -s /usr/local /root/.local

# Clone RoverTags
cd ~/catkin_ws
git clone https://github.com/CJcool06/RoverTags.git

# VINS installation
cd ~/ && mkdir -p ~/catkin_ws/src && cd ~/catkin_ws/src
git clone -b opencv4 https://github.com/CJcool06/VINS-Fusion.git
cd ../
catkin_make -DCMAKE_CXX_STANDARD=14 -DHAVE_CXX11=ON -DCMAKE_CXX_EXTENSIONS=OFF
~/scripts/setup_script.bash
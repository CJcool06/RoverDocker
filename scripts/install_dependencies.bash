./install_ceres.bash
./install_vins.bash
./install_rovertags.bash
./install_roverbehaviortree.bash

cd ~/catkin_ws
catkin_make -DCMAKE_CXX_STANDARD=14 -DHAVE_CXX11=ON -DCMAKE_CXX_EXTENSIONS=OFF
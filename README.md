### Run Instructions
Run each of these commands in a separate bash instance.

1. roscore
2. roslaunch realsense2_camera rs_camera.launch enable_infra1:=true enable_infra2:=true
3. rosrun vins vins_node ~/catkin_ws/src/VINS-Fusion/config/realsense_d435/realsense_stereo_imu_config.yaml
4. roslaunch vins vins_rviz.launch
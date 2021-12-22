# Docker System for Adelaide University's Autonomous Rover Team

## Installation Instructions
This has only been tested using Ubuntu 20.04.  

### Install Docker
Visit https://docs.docker.com/get-docker/ and follow the instructions.

### Install Requirements
```
scripts/install_local_requirements.sh
```

### Clone Repository
```
mkdir -p ~/Desktop/AdelaideRover/ && cd ~/Desktop/AdelaideRover/
git clone https://github.com/CJcool06/RoverDocker.git
```

### Create Docker Container
```
make build
make run
```

### Setup Container
```
../scripts/install_ceres.bash
../scripts/install_vins.bash
```

You're now ready to go.  

## Run Instructions
Run each of these commands in a separate bash instance.

1. `roscore`
2. `roslaunch realsense2_camera rs_camera.launch enable_infra1:=true enable_infra2:=true`
3. `rosrun vins vins_node ~/catkin_ws/src/VINS-Fusion/config/realsense_d435/realsense_stereo_imu_config.yaml`
4. `roslaunch vins vins_rviz.launch`

If everything is working correctly, you should be seeing a point-cloud in rviz.  
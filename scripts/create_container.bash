
n_cores=$(grep -c ^processor /proc/cpuinfo)
avail_cores=$(($n_cores - 4))
if [ $avail_cores -lt 4 ]
then
        avail_cores=4
fi
cpus=$avail_cores
mem="8g"

# XServer
xsock="/tmp/.X11-unix"
xauth="/tmp/.docker.xauth"

docker create -it \
    --name="rover_env" \
    --user=root \
    --privileged \
    --env="DISPLAY"=$DISPLAY \
    --volume="/etc/group:/etc/group:ro"   \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/etc/shadow:/etc/shadow:ro" \
    --volume=$(pwd)/catkin_ws:/root/catkin_ws:rw \
    --volume=$(pwd)/scripts/docker_resources/setup_script.bash:/root/scripts/setup_script.bash \
    --volume=$(pwd)/dependencies/ceres-solver-2.0.0.tar.gz:/root/dependencies/ceres-solver-2.0.0.tar.gz \
    --volume=$(pwd)/scripts/install_ceres.bash:/root/scripts/install_ceres.bash \
    --volume=$(pwd)/scripts/install_vins.bash:/root/scripts/install_vins.bash \
    --volume=$(pwd)/scripts/install_rovertags.bash:/root/scripts/install_rovertags.bash \
    --volume=$(pwd)/scripts/install_dependencies.bash:/root/scripts/install_dependencies.bash \
    --volume=$(pwd)/scripts/install_roverbehaviortree.bash:/root/scripts/install_roverbehaviortree.bash \
    --volume=$(pwd)/camera/toggle_emitter.py:/root/camera/toggle_emitter.py \
    --volume=$xsock:$xsock:rw \
    --volume=$xauth:$xauth:rw \
    --env=XAUTHORITY=$xauth \
    --device=/dev \
    --network=host \
    --workdir=/root/catkin_ws \
    --cpus=$cpus \
    --memory=$mem \
    --gpus all \
    -e NVIDIA_DRIVER_CAPABILITIES=all \
    --ipc=host \
    rover_env_img

# IP: 10.90.184.11
#--volume="/dev:/dev" \
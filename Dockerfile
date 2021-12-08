# syntax=docker/dockerfile:1

# Ubuntu Focal with ROS Noetic
FROM ros:noetic-ros-core-focal

RUN apt-get update

# Setup script sourcing every time a new shell is launched.
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
# RUN echo "source /root/setup_script.bash" >> /root/.bashrc
CMD ["bash", "source", "~/.bashrc"]

# Install rosdep
RUN apt-get -y install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential

# Install realsense dependencies
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE || apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE 
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y "deb https://librealsense.intel.com/Debian/apt-repo $(lsb_release -cs) main" -u
RUN apt-get -y install librealsense2-dkms
RUN apt-get -y install librealsense2-utils
RUN apt-get -y install librealsense2-dev
RUN apt-get install librealsense2-dbg
RUN apt-get -y install ros-noetic-realsense2-camera
RUN apt-get -y install ros-noetic-rgbd-launch
RUN apt-get -y install ros-noetic-joy

# Initialise rosdep
RUN rosdep init
RUN rosdep update

CMD ["bash"]
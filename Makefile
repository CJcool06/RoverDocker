DOCKER_IMAGE_UBUNTU=focal-noetic-cuda
DOCKER_IMAGE_ROVER=rover_env_img
DOCKER_CONTAINER=rover_env

all:
	echo "Choose from build, run, exec, or destroy."

# Builds the image.
build:
	docker build -t $(DOCKER_IMAGE_ROVER) -f dockerfiles/Dockerfile.rover .


# Creates a new container from the built image.
run: destroy open-display
	bash scripts/create_container.bash	# Creates container

	# Realsense driver requires a failure before it connects to the camera,
	# so I start the container, run the command that fails, kill it,
	# then start it again.
	# docker start ${DOCKER_CONTAINER}
	# docker exec $(DOCKER_CONTAINER) rs-enumerate-devices
	# docker kill $(DOCKER_CONTAINER)

	# Install Ceres and VINS
	# docker start ${DOCKER_CONTAINER}
	# docker exec -i $(DOCKER_CONTAINER) bash < scripts/install_ceres.bash
	# docker exec -i $(DOCKER_CONTAINER) bash < scripts/install_vins.bash

	make exec


# Start and enter the container.
exec: open-display
	-docker start $(DOCKER_CONTAINER)
	docker exec -it $(DOCKER_CONTAINER) bash

# Stop the container and remove it.
destroy:
	-docker kill $(DOCKER_CONTAINER)
	-docker rm $(DOCKER_CONTAINER)

open-display:
	xhost +	# Opens display port
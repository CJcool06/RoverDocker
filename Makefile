DOCKER_IMAGE=rover_env_img
DOCKER_CONTAINER=rover_env

all:
	echo "Choose from build, run, exec, or destroy."

# Builds the image.
build:
	docker build -t $(DOCKER_IMAGE) -f Dockerfile .


# Creates a new container from the built image.
run: destroy

	xhost +	# Opens display port
	bash scripts/create_container.bash	# Creates container

	# Realsense driver requires a failure before it connects to the camera,
	# so I start the container, run the command that fails, kill it,
	# then start it again.
	docker start ${DOCKER_CONTAINER}
	docker exec $(DOCKER_CONTAINER) rs-enumerate-devices
	docker kill $(DOCKER_CONTAINER)
	make exec


# Start and enter the container.
exec:
	-docker start $(DOCKER_CONTAINER)
	docker exec -it $(DOCKER_CONTAINER) bash

# Stop the container and remove it.
destroy:
	-docker kill $(DOCKER_CONTAINER)
	-docker rm $(DOCKER_CONTAINER)
DOCKER_IMAGE_UBUNTU=focal-noetic-cuda
DOCKER_IMAGE_ROVER=rover_env_img
DOCKER_CONTAINER=rover_env

all:
	echo "Choose from build, create, run, or destroy."

# Builds the image.
build:
	docker build -t $(DOCKER_IMAGE_ROVER) -f dockerfiles/Dockerfile.rover .


# Creates a new container from the built image.
create: destroy open-display
	bash scripts/create_container.bash	# Creates container
	make run


# Start and enter the container.
run: open-display
	-docker start $(DOCKER_CONTAINER)
	docker exec -it $(DOCKER_CONTAINER) bash

# Stop the container.
kill:
	-docker kill $(DOCKER_CONTAINER)

# Stop the container and remove it.
destroy: kill
	-docker rm $(DOCKER_CONTAINER)

open-display:
	xhost +	# Opens display port
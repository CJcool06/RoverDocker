all:
	echo "Choose from build, run, or exec."

build:
	docker build -t rover_env_img -f Dockerfile .

run:
	xhost +
	bash scripts/run_docker.bash

exec:
	docker start rover_env
	docker exec -it rover_env bash
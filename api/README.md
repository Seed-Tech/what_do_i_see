# Instructions to configure environment for naoapi
* install docker
* run dockerfile example: "docker build -t <image_name> ."
* wait for docker image to build
* run container with the flags: "-t -d --network host" example: "docker run --name <docker container name> -t -d --network host <docker image name>"
* execute in interactive mode newly created docker container wiht this command: "docker exec -ti <docker container name> bash"
* cd to api directory: "cd api"
* deploy naoapi with this command: "uvicorn init_fast:app --port 8000 --host 0.0.0.0"
* enjoy! to connect to naoapi use the next URL: "http://<ip adress>:8000/"

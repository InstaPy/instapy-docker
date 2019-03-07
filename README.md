# InstaPy-Docker

## How to use InstaPy with Docker and docker-compose. Find below some basics commands



* Start all the containers (selenium + InstaPy)
`docker-compose up -d --build
* Start only selenium container
`docker-compose up -d --build selenium`
* Start only InstaPy container
`docker-compose up -d --build web`
* Stop all container
`docker-compose stop`
* Stop only selenium container
`docker-compose stop selenium`
* Stop only InstaPy container
`docker-compose stop web`
* Stop and remove Docker configs for all containers
`docker-compose down`
* Display InstaPy output logs
`docker logs -f instapy_web_1` or `docker logs --tail 80 -f $(docker ps -a | grep instapy_web | cut -d " " -f 1)`

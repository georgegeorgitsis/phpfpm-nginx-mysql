# SmartView Dev Docker
---

Docker development environment

## Services
- mysql 5.7.23
- nginx 1.13.3
- php-fpm 7.3

## Requirements
- Install [Docker](https://docs.docker.com/) (Docker Engine: 18.09+) for your host machine 


### Useful Docker commands 

#### List containers
- `docker ps`

#### List images
- `docker image ls`

#### SSH into containers
- `docker exec -it [CONTAINER_NAME] /bin/bash`

#### Watch logs from services
- `docker-compose logs -f -t`

#### (use wisely)
- `docker stop $(docker ps -a -q)` stopping ALL instances!
- `docker network rm $(docker network ls)` removing ALL docker networks!
- `docker rm -vf $(docker ps -a -q)` remove ALL containers!
- `docker rmi -f $(docker images -a -q)` remove ALL images!

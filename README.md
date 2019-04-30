# InstaPy-Docker 🐳
[![MIT license](https://img.shields.io/badge/license-GPLv3-blue.svg)](https://github.com/timgrossmann/InstaPy/blob/master/LICENSE)
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/instapy/instapy.svg)](https://img.shields.io/docker/cloud/build/instapy/instapy.svg)
[![Docker Pulls](https://img.shields.io/docker/pulls/instapy/instapy.svg)](https://img.shields.io/docker/pulls/instapy/instapy.svg)
[![Backers on Open Collective](https://opencollective.com/instapy/backers/badge.svg)](#backers)
[![Sponsors on Open Collective](https://opencollective.com/instapy/sponsors/badge.svg)](#sponsors)

# Table of contents
1. [Running InstaPy with docker](#docker)
2. [Running InstaPy with docker-compose](#docker-compose)
## Running InstaPy with docker <a name="docker"></a>
* Copy the quickstart example file from `docker-compose` directory to get started
* Edit the file `docker_quicktart.py` to personalize how InstaPy will interact. All functions are the same than the classic installation mode. If you are **new** to InstaPy, **we strongly suggest to have a look to InstaPy documentation** to fully understand this file and how to modify it. Keep in mind all InstaPy functions should start with `bot.` when running with Docker.
  - [Complete functions documentation](https://github.com/timgrossmann/InstaPy#documentation)
  - [Some quickstart examples](https://github.com/InstaPy/instapy-quickstart/tree/master/quickstart_templates)
* Start InstaPy container
```
docker pull instapy/instapy && \
docker run \
  --name instapy \
  -v /path_to_file/docker_quickstart.py:/code/docker_quickstart.py \
  -d instapy
```
* Stop InstaPy container
<br>`docker stop instapy`
* Remove InstaPy container
<br>`docker rm instapy`
* Display InstaPy output logs
<br>`docker logs -f instapy` or `docker logs --tail 50 -f $(docker ps -a | grep instapy | cut -d " " -f 1)`

## Running InstaPy with docker-compose <a name="docker-compose"></a>

* Clone this repository
<br>`git clone https://github.com/InstaPy/instapy-docker.git`
* Change your directory to docker-compose
<br>`cd docker-compose`
* Copy the quickstart example file to get started
<br>`cp -a docker_quickstart.py.example docker_quickstart.py`
* Edit the file `docker_quicktart.py` to personalize how InstaPy will interact. All functions are the same than the classic installation mode. If you are **new** to InstaPy, **we strongly suggest to have a look to InstaPy documentation** to fully understand this file and how to modify it. Keep in mind all InstaPy functions should start with `bot.` when running with Docker.
  - [Complete functions documentation](https://github.com/timgrossmann/InstaPy#documentation)
  - [Some quickstart examples](https://github.com/InstaPy/instapy-quickstart/tree/master/quickstart_templates)
* Start InstaPy container 
<br>`docker-compose pull && docker-compose up -d --build web`
* Stop InstaPy container
<br>`docker-compose stop web`
* Stop and remove Docker configs
<br>`docker-compose down`
* Display InstaPy output logs
<br>`docker logs -f instapy_web_1` or `docker logs --tail 50 -f $(docker ps -a | grep instapy_web | cut -d " " -f 1)`
* Automatically run InstaPy or run it at a speified time (Example below: run it everyday at 8:30AM)
  - Edit your crontab file
  - Add `30 8 * * * root cd /path_to_repo/docker-compose/ && docker-compose up -d --build`

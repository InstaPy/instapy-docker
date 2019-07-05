# InstaPy-Docker 🐳
[![MIT license](https://img.shields.io/badge/license-GPLv3-blue.svg)](https://github.com/timgrossmann/InstaPy/blob/master/LICENSE)
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/instapy/instapy.svg)](https://hub.docker.com/r/instapy/instapy/builds)
[![Docker Pulls](https://img.shields.io/docker/pulls/instapy/instapy.svg)](https://hub.docker.com/r/instapy/instapy)
[![Backers on Open Collective](https://opencollective.com/instapy/backers/badge.svg)](https://github.com/timgrossmann/InstaPy#backers)
[![Sponsors on Open Collective](https://opencollective.com/instapy/sponsors/badge.svg)](https://github.com/timgrossmann/InstaPy#sponsors)
[![Discord](https://img.shields.io/discord/510385886869979136.svg)](https://discord.gg/FDETsht)

# Table of contents
1. [Running InstaPy with docker](#docker)
2. [Running InstaPy with docker-compose](#docker-compose)
## Running InstaPy with docker <a name="docker"></a>
* If you previously ran `InstaPy` the classical way you have to mount `InstaPy` logs folder, which is by default saved in your home directory `~/InstaPy`, into the container otherwise you will loose all your previous data
* Copy the quickstart example file from `docker-compose` directory to get started
* Edit the file `docker_quicktart.py` to personalize how InstaPy will interact. All functions are the same than the classic installation mode. If you are **new** to InstaPy, **we strongly suggest to have a look to InstaPy documentation** to fully understand this file and how to modify it. Keep in mind all InstaPy functions should start with `bot.` when running with Docker.
  - [Complete functions documentation](https://github.com/timgrossmann/InstaPy#documentation)
  - [Some quickstart examples](https://github.com/InstaPy/instapy-quickstart/tree/master/quickstart_templates)
* Start InstaPy container
```
docker pull instapy/instapy:latest && \
docker run --name instapy \
  -v /absolute_path_to_file/docker_quickstart.py:/code/docker_quickstart.py \
  -v /absolute_path_to_file/InstaPy:/code/InstaPy \
  -d instapy/instapy:latest
```
Example:
```
docker pull instapy/instapy:latest && \
docker run --name instapy \
  -v /home/myuser/docker_quickstart.py:/code/docker_quickstart.py \
  -v /home/myuser/InstaPy:/code/InstaPy \
  -d instapy/instapy:latest
```

* Stop InstaPy container
<br>`docker stop instapy`
* Remove InstaPy container
<br>`docker rm instapy`
* Display InstaPy output logs
<br>`docker logs -f instapy` or `docker logs --tail 50 -f $(docker ps -a | grep instapy | cut -d " " -f 1)`
* Using specific version of InstaPy
<br>By default, you will use the latest version of InstaPy. For some reasons, if you want to run a specific version you could with adapting the starting command (see above) by replacing both `latest` with the desire released version of InstaPy. It will then start a container of InstaPy with the corresponding version.

## Running InstaPy with docker-compose <a name="docker-compose"></a>

* Clone this repository
<br>`git clone https://github.com/InstaPy/instapy-docker.git`
* Change your directory to docker-compose
<br>`cd docker-compose`
* If you previously ran `InstaPy` the classical way you have to move `InstaPy` logs folder, which is by default saved in your home directory `~/InstaPy`, into the current folder otherwise you will loose all your previous data
<br>`mv ~/InstaPy .`
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
* Using specific version of InstaPy
<br>By default, you will use the latest version of InstaPy. For some reasons, if you want to run a specific version you have to edit `docker-compose.yml`file and replace `latest` with the desire released version in the line `image: instapy/instapy:latest`. It will then start a container of InstaPy with the corresponding version. 

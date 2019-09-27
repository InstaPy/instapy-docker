# InstaPy-Docker 🐳

#### Table of contents
- [Prerequisite](#running-instapy-with-docker)
- [Start InstaPy container](#start-instapy-container)
- [Stop InstaPy container](#stop-instapy-container)
- [Stop and remove InstaPy docker config](#stop-and-remove-instapy-docker-config)
- [Display InstaPy output logs](#display-instapy-output-logs)
- [Automatically run Instapy or at a specific time](#automatically-run-instapy-or-run-it-at-a-specified-time)
- [Deploy specific version of InstaPy](#deploy-specific-version-of-instapy)

---

## Prerequisite
Before starting InstaPy container, you have to follow few steps to prepare your environment:
* Clone this repository
```
git clone https://github.com/InstaPy/instapy-docker.git
```
* Change your directory to docker-compose
```
cd docker-compose
```
* If you previously ran `InstaPy` the classical way you have to move `InstaPy` logs folder, which is by default saved in your home directory `~/InstaPy`, into the current folder otherwise you will loose all your previous data
```
mv ~/InstaPy .
```
* Copy the quickstart example file to get started
```
cp -a docker_quickstart.py.example docker_quickstart.py
```
* Edit the file `docker_quickstart.py` to personalize how InstaPy will interact. All functions are the same than the classic installation mode. If you are **new** to InstaPy, **we strongly suggest to have a look to InstaPy documentation** to fully understand this file and how to modify it. Keep in mind all InstaPy functions should start with `bot.` when running with Docker.
  - [Complete functions documentation](https://github.com/timgrossmann/InstaPy#documentation)
  - [Some quickstart examples](https://github.com/InstaPy/instapy-quickstart/tree/master/quickstart_templates)
  
## Start InstaPy container
To make sure you always use the latest version of InstaPy, always start the container with the following command. This way, if a new version of InstaPy docker image is released, it will ensure to download it before starting the container.
```
docker-compose pull && docker-compose up -d web
```

## Stop InstaPy container
```
docker-compose stop web
```

## Stop and remove InstaPy docker config
```
docker-compose down
```

## Display InstaPy output logs
Use one of the two following commands
```
docker logs -f instapy_web_1
```
```
docker logs --tail 50 -f $(docker ps -a | grep instapy_web | cut -d " " -f 1)
```

## Automatically run InstaPy or run it at a specified time
Use cron to run InstaPy automatically at a specific time. Example below: run it everyday at 8:30AM
* Edit your crontab file
* Add `30 8 * * * root cd /path_to_repo/docker-compose/ && docker-compose up -d`

## Deploy specific version of InstaPy
By default, you will use the latest version of InstaPy. For some reasons, if you want to run a specific version you could with adapting the starting command (see above) by replacing tag `latest` with the desire released version of InstaPy.

It will then start a container of InstaPy with the corresponding version. Please be aware breaking chanes may exist between version and refers to the changelog of InstaPy to adapt your quickstart file.

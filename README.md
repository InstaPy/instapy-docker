# InstaPy-Docker

## How to use InstaPy with docker-compose

* Clone this repository
<br>`git clone https://github.com/InstaPy/instapy-docker.git`
* Change your directory to docker-compose
<br>`cd docker-compose`
* Copy the example file to get started
<br>`cp -a docker_quickstart.py.example docker_quickstart.py`
* Edit the file `docker_quicktart.py` to personalize how InstaPy will interact. All functions are the same than the classic installation mode. If you are **new** to InstaPy, **we strongly suggest to have a look to InstaPy documentation** to fully understand this file and how to modify it. Keep in mind all InstaPy functions should start with `bot.` when running with Docker.
  - [Complete functions documentation](https://github.com/timgrossmann/InstaPy#documentation)
  - [Some quickstart examples](https://github.com/InstaPy/instapy-quickstart/tree/master/quickstart_templates)
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

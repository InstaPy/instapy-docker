# InstaPy-Docker 🐳

#### Table of contents
- [Prerequisite](#prerequisite)
- [Start InstaPy container](#start-instapy-container)
- [Stop InstaPy container](#stop-instapy-container)
- [Remove InstaPy container](#remove-instapy-container)
- [Display InstaPy output logs](#display-instapy-output-logs)
- [Deploy specific version of InstaPy](#deploy-specific-version-of-instapy)

<br />

---

## Prerequisite
If you previously ran `InstaPy` the classical way you have to mount `InstaPy` logs folder, which is by default saved in your home directory `~/InstaPy`, into the container otherwise you will loose all your previous data like blacklist, log files, accounts followed, accouants unfollowed.
* Copy the quickstart example file named `docker_quickstart.py.example` from `docker-compose`
* Rename this file `docker_quickstart.py`
* Edit the file `docker_quicktart.py` to personalize how InstaPy will interact. All functions are the same than with the classic installation mode. If you are **new** to InstaPy, **we strongly suggest to have a look to InstaPy documentation** to fully understand this file and how to modify it. Keep in mind all InstaPy functions should start with `bot.` when running with Docker.
  - [Complete functions documentation](https://github.com/timgrossmann/InstaPy/blob/master/DOCUMENTATION.md)
  - [Some quickstart examples](https://github.com/InstaPy/instapy-quickstart/tree/master/quickstart_templates)

## Start InstaPy container
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

## Stop InstaPy container
```
docker stop instapy
```

## Remove InstaPy container
Make sure the container is already stopped or first stop it the above command, then run
```
docker rm instapy
```

## Display InstaPy output logs
Use one of the two following commands
```
docker logs -f instapy
```
```
docker logs --tail 50 -f $(docker ps -a | grep instapy | cut -d " " -f 1)
```

## Deploy specific version of InstaPy
By default, you will use the latest version of InstaPy. For some reasons, if you want to run a specific version you could with adapting the starting command (see above) by replacing tag `latest` with the desire released version of InstaPy.

It will then start a container of InstaPy with the corresponding version. Please be aware breaking chanes may exist between version and refers to the changelog of InstaPy to adapt your quickstart file.

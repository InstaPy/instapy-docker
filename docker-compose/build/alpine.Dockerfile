FROM python:3.7-alpine

COPY ./build/requirements.txt /code/build/requirements.txt

RUN apk add --update --no-cache \
  wget \
  gcc \
  g++ \
  firefox-esr \
  xvfb \
  xdpyinfo \
  && pip install --no-cache-dir -U -r /code/build/requirements.txt \
  && rm -rf code/build/requirements.txt 

WORKDIR /code
COPY . /code

CMD ["python", "/code/docker_quickstart.py"]
ENTRYPOINT [ "./build/entrypoint.sh" ]

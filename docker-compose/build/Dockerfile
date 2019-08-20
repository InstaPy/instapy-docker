FROM python:3.7-slim-stretch
WORKDIR /code
RUN apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
      wget \
      gcc \
      g++ \
      chromedriver \
    && wget -O '/tmp/requirements.txt' https://raw.githubusercontent.com/InstaPy/instapy-docker/master/requirements.txt \
    && pip install --no-cache-dir -U -r /tmp/requirements.txt \
    && apt-get purge -y --auto-remove \
      gcc \
      g++ \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/requirements.txt

CMD ["./build/entrypoint.sh", "http://selenium:4444/wd/hub", "python", "docker_quickstart.py"]

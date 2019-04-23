FROM python:3.7-slim-stretch
WORKDIR /code
RUN apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
      wget \
      gcc \
      g++ \
      chromedriver \
    && pip install --no-cache-dir -U instapy \
    && apt-get purge -y --auto-remove \
      gcc \
      g++ \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

<<<<<<< HEAD
CMD ["python", "docker_quickstart.py"]
=======
CMD ["python", "docker_quickstart.py"]
>>>>>>> upstream/master

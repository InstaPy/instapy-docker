FROM python:3.7-slim-stretch
WORKDIR /code
COPY ./build/requirements.txt /code/build/requirements.txt
RUN apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
      wget \
      gcc \
      g++ \
      chromedriver \
    && pip install --no-cache-dir -U -r /code/build/requirements.txt \
    && apt-get purge -y --auto-remove \
      gcc \
      g++ \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /code/build/requirements.txt

COPY . /code

CMD ["python", "/code/docker-quickstart.py"]
ENTRYPOINT [ "./build/entrypoint.sh" ]

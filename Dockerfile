FROM python:3.7-slim-buster
WORKDIR /code
RUN sed -i "s#deb http://deb.debian.org/debian buster main#deb http://deb.debian.org/debian buster main contrib non-free#g" /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
      wget \
      gcc \
      g++ \
      firefox-esr \
      firefoxdriver \
    && wget -O '/tmp/requirements.txt' https://raw.githubusercontent.com/InstaPy/instapy-docker/master/requirements.txt \
    && pip install --no-cache-dir -U -r /tmp/requirements.txt \
    && apt-get purge -y --auto-remove \
      gcc \
      g++ \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/requirements.txt \
    # Disabling geckodriver log file
    && sed -i "s#browser = webdriver.Firefox(#browser = webdriver.Firefox(service_log_path=os.devnull,#g" /usr/local/lib/python3.7/site-packages/instapy/browser.py \
    # Fix Login A/B test detected error - https://github.com/timgrossmann/InstaPy/issues/4887#issuecomment-522290752
    && sed -i "159s#a\[text#button\[text#g" /usr/local/lib/python3.7/site-packages/instapy/xpath_compile.py

CMD ["python", "docker_quickstart.py"]

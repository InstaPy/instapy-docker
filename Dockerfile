FROM python:3.7-slim-buster
WORKDIR /code
RUN sed -i "s#deb http://deb.debian.org/debian buster main#deb http://deb.debian.org/debian buster main contrib non-free#g" /etc/apt/sources.list \
  && apt-get update \
  && apt-get install -y --no-install-recommends --no-install-suggests \
  # Firefox dependencies
  libgtk-3-0 libdbus-glib-1-2 libx11-xcb1 libxt6 \
  # Firefox downlader dependencies
  bzip2 \
  wget \
  gcc \
  g++ \
  # Install newesst Firefox
  && wget -q -O - "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64" | tar -xj -C /opt \
  && ln -s /opt/firefox/firefox /usr/bin/ \
  && wget -O '/tmp/requirements.txt' https://raw.githubusercontent.com/InstaPy/instapy-docker/master/requirements.txt \
  && pip install --no-cache-dir -U -r /tmp/requirements.txt \
  && apt-get purge -y --auto-remove \
  gcc \
  g++ \
  bzip2 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/requirements.txt \
  # Disabling geckodriver log file
  && sed -i "s#browser = webdriver.Firefox(#browser = webdriver.Firefox(service_log_path=os.devnull,#g" /usr/local/lib/python3.7/site-packages/instapy/browser.py \
  # Fix webdriverdownloader not handling asc files
  && sed -i "s#bitness in name]#bitness in name and name[-3:] != 'asc' ]#g" /usr/local/lib/python3.7/site-packages/webdriverdownloader/webdriverdownloader.py
CMD ["python", "docker_quickstart.py"]

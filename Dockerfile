FROM ubuntu:18.04

ARG BUILD_DATE
ARG VCS_REF

# Good docker practice, plus we get microbadger badges
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/InstaPy/instapy-docker.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="2.2-r1"

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    build-essential \
    curl wget \
    chromium-bsu \
    libnss3-dev \
    unzip python3-dev build-essential libssl-dev libffi-dev xvfb \
    xdg-utils fonts-liberation libappindicator3-1 libatk-bridge2.0-0 \
    libatk1.0-0 libatspi2.0-0 libcairo2 libcups2 libgdk-pixbuf2.0-0 \
    libgtk-3-0 libpango-1.0-0 libpangocairo-1.0-0 lsb-release

RUN pip3 install --upgrade pip 
RUN pip3 install instapy instapy-chromedriver && \ 
  curl -O "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"  && \
  dpkg -i google-chrome-stable_current_amd64.deb && \
  apt-get install -y -f && \
  rm google-chrome-stable_current_amd64.deb 

WORKDIR /
ADD https://raw.githubusercontent.com/InstaPy/instapy-quickstart/master/quickstart.py /

# Set quickstart.py to default to headleass browser, which is necessary in our case
RUN sed -i 's/headless_browser=False/headless_browser=True/' /quickstart.py

CMD python3 /quickstart.py --username $USERNAME --password $PASSWORD

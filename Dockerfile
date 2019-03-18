FROM alpine

ARG BUILD_DATE
ARG VCS_REF

# Good docker practice, plus we get microbadger badges
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/InstaPy/instapy-docker.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="2.2-r1"

RUN apk --update --no-cache add \
  chromium \
  chromium-chromedriver \
  libstdc++ \
  python3 \
  && apk add --update --no-cache --virtual .build-dependencies \
  build-base \
  python3-dev \
  py3-pip \
  && pip3 install instapy \
  && apk del .build-dependencies

# Workaround to set the chromedrive location on Alpine
RUN echo "Settings.chromedriver_location = '/usr/bin/chromedriver'" >> /usr/lib/python3.6/site-packages/instapy/settings.py

WORKDIR /
ADD https://raw.githubusercontent.com/InstaPy/instapy-quickstart/master/quickstart.py /

# Set quickstart.py to default to headleass browser, which is necessary in our case
RUN sed -i 's/headless_browser=False/headless_browser=True/' /quickstart.py

CMD python3 /quickstart.py --username $USERNAME --password $PASSWORD

#should change with a python container, so it can be independent from transmission 

FROM python:2.7-alpine
LABEL name="transmission-multiple-folders"
LABEL maintainer="dev@soflane.ovh"
LABEL url="https://github.com/soflane"
LABEL vcs-url="https://github.com/soflane"

RUN apk update \
    && apk add py-pip git \
    && pip install transmissionrpc \
    && rm -rf /var/lib/apt/lists/* 
COPY . /app
VOLUME /opt/logs
#RUN git clone https://github.com/soflane/transmission-multiple-watch-folders 
CMD python /app/main.py


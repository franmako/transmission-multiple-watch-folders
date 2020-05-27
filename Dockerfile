FROM python:2.7-alpine
LABEL name="transmission-multiple-folders"
LABEL maintainer="dev@soflane.ovh"
LABEL url="https://github.com/soflane"
LABEL vcs-url="https://github.com/soflane"

VOLUME /torrents
VOLUME /opt/logs

ENV RPC_WATCH_TV_FOLDER=/torrents/TV
ENV RPC_WATCH_MOVIES_FOLDER=/torrents/Movies
ENV RPC_WATCH_MUSIC_FOLDER=/torrents/Music
ENV RPC_CLIENT_HOST=transmission
ENV RPC_CLIENT_PORT=9091

RUN apk update \
    && apk add py-pip \
    && pip install transmissionrpc \
    && rm -rf /var/lib/apt/lists/* 
COPY ./app /app

RUN mkdir -p {$RPC_WATCH_TV_FOLDER,$RPC_WATCH_MOVIES_FOLDER,$RPC_WATCH_MUSIC_FOLDER}

CMD python /app/main.py



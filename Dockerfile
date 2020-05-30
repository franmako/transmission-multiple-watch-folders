FROM python:3.6-alpine
#LABEL maintainer="dev@soflane.ovh"
#LABEL url="https://github.com/soflane"

#VOLUME /opt/logs
#USER ${PUID}:${PGID}
ENV RPC_WATCH_TV_FOLDER=/torrents/TV
ENV RPC_WATCH_MOVIES_FOLDER=/torrents/Movies
ENV RPC_WATCH_MUSIC_FOLDER=/torrents/Music
ENV RPC_CLIENT_HOST=transmission
ENV RPC_CLIENT_PORT=9091

RUN mkdir -p $RPC_WATCH_TV_FOLDER && mkdir -p $RPC_WATCH_MOVIES_FOLDER && mkdir -p $RPC_WATCH_MUSIC_FOLDER \
    && touch $RPC_WATCH_TV_FOLDER/dumb.file

RUN apk update \
    && apk add py-pip \
    && pip install transmissionrpc \
    && rm -rf /var/lib/apt/lists/* 

VOLUME /torrents
COPY ./app /app
COPY ./app /torrents



CMD python /app/main.py



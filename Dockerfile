#should change with a python container, so it can be independent from transmission 

FROM linuxserver/transmission
LABEL name="transmission-multiple-folders"
LABEL maintainer="dev@soflane.ovh"
LABEL url="https://gitlab.com/soflane"
LABEL vcs-url="https://gitlab.com/soflane"

RUN apk update \
    && apk add py-pip git \
    && pip install transmissionrpc \
    && rm -rf /var/lib/apt/lists/* 

VOLUME /transmission-watcher

RUN git clone https://github.com/soflane/transmission-multiple-watch-folders 
CMD /transmission-watcher/startup.sh


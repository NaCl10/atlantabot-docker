FROM alpine:latest

RUN apk update \
    && apk upgrade

RUN apk add \
    bash \
    git\
    nodejs \
    npm \
    python3 \
    build-base \
    ffmpeg

RUN git clone https://github.com/Androz2091/AtlantaBot.git
RUN chmod 777 /AtlantaBot
RUN cp /AtlantaBot/config.sample.js /AtlantaBot/config.js

WORKDIR /AtlantaBot

RUN npm install --production
RUN npm install -g pm2

COPY init.sh /
RUN chmod +x /init.sh

ENTRYPOINT ["/init.sh"]

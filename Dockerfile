FROM cm2network/steamcmd:steam

ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /opt/craftopia

RUN /home/steam/steamcmd/steamcmd.sh +force_install_dir "/opt/craftopia" +login anonymous +app_update 1670340 validate +quit

RUN timeout 10 ./Craftopia.x86_64 || exit 0 # create config files

ENV WORLD_NAME=NoName
ENV WORLD_DIFFICULTY=1
ENV WORLD_GAME_MODE=1

ENV HOST_PORT=6587
ENV HOST_MAX_PLAYER_NUMBER=32
ENV HOST_USE_PASSWORD=0
ENV HOST_SERVER_PASSWORD=00000000

ENV SAVE_AUTO_SAVE_SEC=300
ENV SAVE_AUTO_SAVE_PER_HOUR=1

ENV FORCE_UPDATE=false

ADD docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE ${HOST_PORT}/udp

# fix permission
RUN mkdir -p /opt/craftopia/DedicatedServerSave
VOLUME [ "/opt/craftopia/DedicatedServerSave" ]

ENTRYPOINT [ "/docker-entrypoint.sh" ]
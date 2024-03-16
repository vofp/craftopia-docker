#!/bin/bash
set -e
if [[ -n $FORCE_UPDATE ]] && [[ $FORCE_UPDATE == "true" ]]; then
    /home/steam/steamcmd/steamcmd.sh +force_install_dir "/opt/craftopia" +login anonymous +app_update 1670340 validate +quit
fi

if [[ -n $WORLD_NAME ]]; then
    sed -i "s^name=.*^name=$WORLD_NAME^g" /opt/craftopia/ServerSetting.ini
fi
if [[ -n $WORLD_DIFFICULTY ]]; then
    sed -i "s^difficulty=.*^difficulty=$WORLD_DIFFICULTY^g" /opt/craftopia/ServerSetting.ini
fi
if [[ -n $WORLD_GAME_MODE ]]; then
    sed -i "s^gameMode=.*^gameMode=$WORLD_GAME_MODE^g" /opt/craftopia/ServerSetting.ini
fi
if [[ -n $HOST_PORT ]]; then
    sed -i "s^port=.*^port=$HOST_PORT^g" /opt/craftopia/ServerSetting.ini
fi
if [[ -n $HOST_MAX_PLAYER_NUMBER ]]; then
    sed -i "s^maxPlayerNumber=.*^maxPlayerNumber=$HOST_MAX_PLAYER_NUMBER^g" /opt/craftopia/ServerSetting.ini
fi
if [[ -n $HOST_USE_PASSWORD ]]; then
    sed -i "s^usePassword=.*^usePassword=$HOST_USE_PASSWORD^g" /opt/craftopia/ServerSetting.ini
fi
if [[ -n $HOST_SERVER_PASSWORD ]]; then
    sed -i "s^serverPassword=.*^serverPassword=$HOST_SERVER_PASSWORD^g" /opt/craftopia/ServerSetting.ini
fi
if [[ -n $SAVE_AUTO_SAVE_SEC ]]; then
    sed -i "s^autoSaveSec=.*^autoSaveSec=$SAVE_AUTO_SAVE_SEC^g" /opt/craftopia/ServerSetting.ini
fi
if [[ -n $SAVE_AUTO_SAVE_PER_HOUR ]]; then
    sed -i "s^autoSavePerHour=.*^autoSavePerHour=$SAVE_AUTO_SAVE_PER_HOUR^g" /opt/craftopia/ServerSetting.ini
fi

if [ $# -eq 0 ]; then
    /opt/craftopia/Craftopia.x86_64
else
    exec "$@"
fi

# craftopia-docker

[![Check Update](https://github.com/KagurazakaNyaa/craftopia-docker/actions/workflows/update.yml/badge.svg)](https://github.com/KagurazakaNyaa/craftopia-docker/actions/workflows/update.yml)
[![Build Docker Image](https://github.com/KagurazakaNyaa/craftopia-docker/actions/workflows/build.yml/badge.svg)](https://github.com/KagurazakaNyaa/craftopia-docker/actions/workflows/build.yml)
![Docker Pulls](https://img.shields.io/docker/pulls/kagurazakanyaa/craftopia)
![Docker Stars](https://img.shields.io/docker/stars/kagurazakanyaa/craftopia)
![Image Size](https://img.shields.io/docker/image-size/kagurazakanyaa/craftopia/latest)

Craftopia dedicated server with docker

## Environments

The variables in the table below valid during initialization, if you need to make it valid, please recreate the container.
| Variable                | Describe                                                      | Default Values | Allowed Values |
|-------------------------|---------------------------------------------------------------|----------------|----------------|
| WORLD_NAME              | world name                                                    | NoName         | string         |
| WORLD_DIFFICULTY        | 0- Easy, 1- Normal, 2- Hard, 3- VeryHard                      | 1              | 0-3            |
| WORLD_GAME_MODE         | 1- NormalWorld, 2- CreativeWorld_Build, 3- CreativeWorld_Play | 1              | 1-3            |
| HOST_PORT               | used when not using steam lobby function                      | 6587           | 1024-65535     |
| HOST_MAX_PLAYER_NUMBER  | maximum number of player can join into the server             | 32             | 1-127          |
| HOST_USE_PASSWORD       | using server password(1- True / 0- False)                     | 0              | 0/1            |
| HOST_SERVER_PASSWORD    | setting server password up to 8 digit number pin              | 00000000       | int[8]         |
| SAVE_AUTO_SAVE_SEC      | autoSavePer ** second, to disable, set to -1                  | 300            | integer        |
| SAVE_AUTO_SAVE_PER_HOUR | enable autoSavePerHour(1- True / 0- False)                    | 1              | 0/1            |
| FORCE_UPDATE            | Whether the server should be update each time start.          | false          | true/false     |

## Volumes

|Path                                 |Describe    |
|-------------------------------------|------------|
|`/opt/craftopia/DedicatedServerSave` |Game saves. |

NOTE: If you use bind instead of volume to mount, you need to manually change the volume owner to uid=1000.
In the case of the docker-compose.yml of the example, you need to execute `chown -R 1000:1000 ./data`
Please make sure the permissions and owners of the pak file you placed in the mods directory are correct.

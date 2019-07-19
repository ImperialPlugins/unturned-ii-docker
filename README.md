# Unturned-Docker
This repository contains scripts for installing Unturned II Linux servers (optionally without docker).
It will auto-download the game on first start and download updates on each restart. It can detect crashes and auto restart in that case.

# Getting Started
Images are hosted at `imperialplugins/unturned2`. You can visit the [Docker Hub Repository](https://hub.docker.com/r/imperialplugins/unturned2) for more information.

Example command to host a simple Unturned II server:

`docker run -it -p 27015:27015 -p 27016:27016 -e --restart unless-stopped --name myserverinstance imperialplugins/unturned2`

You can also define STEAM_CMD_ARGS to add your custom steamcmd commands on each restart:
`docker run -it -p 27015:27015 -p 27016:27016 -e STEAM_CMD_ARGS="+download_depot <somedepot>" --restart unless-stopped --name myserverinstance imperialplugins/unturned2`

## Building
To build, use `docker build . -t unturned2`.

After building, you can start your server like the command in "Getting Started", but you will have to replace "imperialplugins/unturned2" with just "unturned2".

## Non-Docker Usage
First install the required dependencies:
```sh
$ sudo apt-get install -y unzip tar curl coreutils lib32gcc1 git glibc.i686 jq
```

Set GAME_INSTALL_DIR and GAME_ID (730200 for dedicated server) environment variables:

```sh
$ export GAME_INSTALL_DIR=/path/to/UnturnedII
$ export GAME_ID=730200
```

You do not have to install steacmd, this script will do it for you. 


The script also supports $STEAM_CMD_ARGS which allows you to define more steamcmd commands on each restart (e.g. `export STEAM_CMD_ARGS="+download_depot <somedepot>`)

Finally, run `init.sh` to install / update your server. It will automatically start the server afterwards:
```sh
$ ./init.sh 
```
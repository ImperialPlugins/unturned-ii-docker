# Unturned II Docker
This repository contains scripts for installing Unturned II Linux servers (optionally without docker).
It will auto-download the game on first start and download updates on each restart. It can detect crashes and auto restart in that case.

# Getting Started
Images are hosted at `imperialplugins/unturned-ii`. You can visit the [Docker Hub Repository](https://hub.docker.com/r/imperialplugins/unturned-ii) for more information.

Example command to host a simple Unturned II server:

`docker run -it -p 27015:27015 -p 27016:27016 --restart unless-stopped --name myserverinstance imperialplugins/unturned-ii SERVER_ARGS`

Replace SERVER_ARGS with the map you want to host, e.g. `CQC`. You can specicy more args like -log or -PORT=7415

You can also define STEAM_CMD_ARGS to add your custom steamcmd commands on each restart:
`docker run -it -p 27015:27015 -p 27016:27016 -e STEAM_CMD_ARGS="+download_depot <somedepot>" --restart unless-stopped --name myserverinstance imperialplugins/unturned-ii CQC`

## Building
To build, use `docker build . -t unturned-ii`.

After building, you can start your server like the command in "Getting Started", but you will have to replace "imperialplugins/unturned-ii" with just "unturned-ii".

## Non-Docker Usage
First install the required dependencies:
```sh
$ sudo apt-get install -y unzip tar curl coreutils lib32gcc1 gcc-multilib jq
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
$ ./init.sh SERVER_ARGS
```


Replace SERVER_ARGS with the map you want to host, e.g. `CQC`. You can specicy more args like -log or -PORT=7415.
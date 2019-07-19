#!/bin/bash
cd $GAME_INSTALL_DIR
ulimit -n 2048

./U4Server.sh "$@" 
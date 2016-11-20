#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : init.sh
# ALIAS            : edjangerinit
# DESCRIPTION      : create a edjanger.properties file
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : edjangerinit
# ----------------------------------------------------
source {edjangerpath}/_common.sh
if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
  usage $0 init
else
  if [ ! -f "edjanger.${config_extension}" ] && [ "{edjangerpath}" != "$PWD" ]; then
    echo -e "> Initialize edjanger configuration file: edjanger.${config_extension} ..."
    cp {edjangerpath}/templates/edjanger_template.${config_extension} ./edjanger.${config_extension}
  else
    source {edjangerpath}/_common.sh
    echo -e "File edjanger.${config_extension} is already in your current directory !"
    checkconfig
  fi
  if [ ! -d "build" ] && [ "{edjangerpath}" != "$PWD" ]; then
    echo -e "> Initialize edjanger build folder for Dockerfile: /build ..."
    mkdir build/
  fi
  if [ ! -f "build/Dockerfile" ] && [ "{edjangerpath}" != "$PWD" ]; then
    echo -e "> Initialize Dockerfile: build/Dockerfile ..."
    touch build/Dockerfile
  fi
fi

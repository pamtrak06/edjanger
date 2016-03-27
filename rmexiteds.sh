#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : rmexiteds.sh
# ALIAS            : edockerrmexiteds
# DESCRIPTION      : run docker rm with list of container with exited status
#   PARAMETER      : docker_command
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : edockerrmexiteds
# ----------------------------------------------------
. {edockerpath}/_common.sh
if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
  usage $0 clean
else
  echo "Following stopped containers will be deleted, is it ok for you (y/n) ?"
  docker ps -a --filter "status=exited" --format "Container {{.Names}}/id:{{.ID}} from image:{{.Image}}"
  read response
  if [ "y" = "$response" ]; then
    echo "Delete stopped containers..."
    docker rm $(docker ps -aq --filter "status=exited")
    if [ "true" = "${docker_command}" ]; then
      echo -e "> Executed docker command:"
      echo -e "> docker rm $(docker ps -aq --filter "status=exited")"
    fi
  elif [ "n" != "$response" ]; then
    echo "Response must be \"y\" or \"n\""
  fi
fi

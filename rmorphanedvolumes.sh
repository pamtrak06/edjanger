#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : rmdorphanedvolumes.sh
# ALIAS            : edockerrmdorphanedvolumes
# DESCRIPTION      : remove all orphaned volumes
#   PARAMETER      : docker_command
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-10-10
# COMMENT          : creation
# --------------------------------
# USAGE            : edockerrmdorphanedvolumes
# ----------------------------------------------------
source {edockerpath}/_common.sh

if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
  usage $0 clean
else
  echo "Orphaned volumes will be deleted, is it ok for you (y/n) ?"
  read response
  if [ "y" = "$response" ]; then
    echo "Delete orphaned volumes..."
    docker volume rm $(docker volume ls -qf dangling=true)
    if [ "true" = "${docker_command}" ]; then
      echo -e "> Executed docker command:"
      echo -e "> docker volume rm $(docker volume ls -qf dangling=true)"
    fi
  elif [ "n" != "$response" ]; then
    echo "Response must be \"y\" or \"n\""
  fi
fi

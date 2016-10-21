#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : clean.sh
# ALIAS            : edockerclean
# DESCRIPTION      : clean all images with none attribute (run docker rmi with "none" filter)
#   PARAMETER      : force_rmi
#   PARAMETER      : docker_command
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : edockerclean
# ----------------------------------------------------
source {edockerpath}/_common.sh

if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
  usage $0 clean
else
  echo "Images with attribute name=\"none\" will be deleted, is it ok for you (y/n) ?"
  read response
  if [ "y" = "$response" ]; then
    echo "Delete images with attribute name=\"none\"..."
    docker rmi ${force_rmi} $(docker images --format="{{.Repository}} {{.ID}}" | grep -e '.none..[a-zA-Z0-9_].*'| awk '{print $2}')
    if [ "true" = "${docker_command}" ]; then
      echo -e "> Executed docker command:"
      echo -e "> docker rmi ${force_rmi} $(docker images --format=\"{{.Repository}}:{{.ID}}\" | grep -e '.none..[a-zA-Z0-9_].*')"
    fi
  elif [ "n" != "$response" ]; then
    echo "Response must be \"y\" or \"n\""
  fi
fi

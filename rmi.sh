#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : rmi.sh
# DESCRIPTION      : docker rmi script (read parameters from edocker.cfg)
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : alias edockerrmi
# ----------------------------------------------------
. {edockerpath}/_common.sh
if [ "$1" = "--help" ] || [ "$1" = "-help" ] || [ "$1" = "-h" ]; then
  usage $0 rmi
else
  if [ ! -f edocker.cfg ]; then
    echo -e "edocker:ERROR No edocker.cfg available, use \"<edockerinit>\" command to initialize one in this directory"
  else
    read_config
    echo "Are you sure you want to delete image: ${image_name} (y/n)?"
    read response
    if [ "y" = "$response" ]; then
      echo "Deleting image: ${image_name}..."
      docker rmi ${force_rmi} ${image_name}
      if [ "true" = "${docker_command}" ]; then
        echo -e "> Executed docker command:"
        echo -e "> docker rmi ${force_rmi} ${image_name}"
      fi
    elif [ "n" != "$response" ]; then
        echo "Response must be \"y\" or \"n\""
    fi
  fi
fi

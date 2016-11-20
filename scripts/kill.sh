#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : kill.sh
# ALIAS            : edockerkill
# DESCRIPTION      : kill command "docker kill", with parameters readed from local edocker.properties
#   PARAMETER      : kill_options
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-09-25
# COMMENT          : creation
# --------------------------------
# USAGE            : edockerkill
# ----------------------------------------------------
source {edockerpath}/_common.sh

if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
  usage $0 kill
else
  if [ ! -f edocker.${config_extension} ]; then
    echo -e "edocker:ERROR No edocker.${config_extension} available, use \"<edockerinit>\" command to initialize one in this directory"
  else
    read_app_properties
    idx=$(echo "$(docker ps | grep ${container_name} | wc -l)+1" | bc)
    echo "kill container_name: ${container_name}_${idx}..."
    docker kill ${kill_options} ${container_name}_${idx}
    if [ "true" = "${docker_command}" ]; then
      echo -e "> Executed docker command:"
      echo -e "> docker kill ${kill_options} ${container_name}_${idx}"
    fi
  fi
fi

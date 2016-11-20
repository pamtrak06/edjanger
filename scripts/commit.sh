#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : commit.sh
# ALIAS            : edockercommit
# DESCRIPTION      : run command "docker commit" with parameters readed from local edocker.properties
#   ARGUMENT       : [REPOSITORY[:TAG]], script argument passed to container, by example <edockercommit "V12.97">
#   PARAMETER      : container_name
#   PARAMETER      : commit_options
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-09-25
# COMMENT          : creation
# --------------------------------
# USAGE            : edockercommit
# ----------------------------------------------------
source {edockerpath}/_common.sh
if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
  usage $0 commit
else
  if [ ! -f edocker.${config_extension} ]; then
    echo -e "edocker:ERROR No edocker.${config_extension} available, use \"<edockerinit>\" command to initialize one in this directory"
  else
    read_app_properties
    idx=$(echo "$(docker ps | grep ${container_name} | wc -l)+0" | bc)
    echo enter in container_name: ${container_name}_${idx}...
    if [ -n "$1" ]; then
      docker commit ${commit_options} ${container_name}_${idx} "$1"
      if [ "true" = "${docker_command}" ]; then
        echo -e "> commituted docker command:"
        echo -e "> docker commit ${commit_options} ${container_name}_${idx} \"$1\""
      fi
    else
      usage $0 commit
    fi
  fi
fi

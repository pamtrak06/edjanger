#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : copy.sh
# ALIAS            : edockercopy
# DESCRIPTION      : run command "docker copy" with parameters readed from local edocker.properties
#   PARAMETER      : image_name
#   PARAMETER      : container_name
#   PARAMETER      : docker_command
#   ARGUMENT       : host (h) or container (c)
#   ARGUMENT       : source path= host or container
#   ARGUMENT       : destination path= container or host
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : edockercopy [h|c] [source path: host or container] [destination path: container or host]
# ----------------------------------------------------
source {edockerpath}/_common.sh
if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
  usage $0 copy
else
  if [ ! -f edocker.${config_extension} ]; then
    echo -e "edocker:ERROR No edocker.${config_extension} available, use \"<edockerinit>\" command to initialize one in this directory"
  else

    read_app_properties

    if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
      usage $0 copy
    else
      idx=$(echo "$(docker ps | grep ${image_name} | wc -l)+0" | bc)
      if [ "$1" = "c" ]; then
        echo copy from container_name: ${container_name}_${idx} file $2 to host:$3...
        docker cp ${container_name}_${idx}:$2 $3
        if [ "true" = "${docker_command}" ]; then
          echo -e "> Executed docker command:"
          echo -e "> docker cp ${container_name}_${idx}:$2 $3"
        fi
      elif [ "$1" = "h" ]; then
        echo copy file from host:$2 to container ${container_name}_${idx}:$3
        docker cp $2 ${container_name}_${idx}:$3
        if [ "true" = "${docker_command}" ]; then
          echo -e "> Executed docker command:"
          echo -e "> docker cp $2 ${container_name}_${idx}:$3"
        fi
      else
        usage $0 copy
      fi
    fi
  fi
fi

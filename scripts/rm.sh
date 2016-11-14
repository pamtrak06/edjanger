#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : rm.sh
# ALIAS            : edockerrm
# DESCRIPTION      : run command "docker rm" with parameters readed from local edocker.properties
#   ARGUMENT       : index=<index of container>, rm on specific container index
#   PARAMETER      : container_name
#   PARAMETER      : docker_command
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : edockerrm
# ----------------------------------------------------
source {edockerpath}/_common.sh

if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
  usage $0 rm
else
  if [ ! -f edocker.${config_extension} ]; then
    echo -e "edocker:ERROR No edocker.${config_extension} available, use \"<edockerinit>\" command to initialize one in this directory"
  else
    read_edockerproperties
    if [[ "$1" == *"index"* ]]; then
      idx=$(echo "$(echo $1 | cut -d '=' -f2)" | bc)
    else
      idx=$(echo "$(docker ps -a|grep ${container_name}|wc -l)+0"|bc)
    fi
    if [ "0" = "${idx}" ]; then
      echo "No running or stopped container which name contains: \"${container_name}\" available"
    else
      echo "Container \"${container_name}_${idx}\" will be permanently erased, do you want to continue (y/n) ?"
      read response
      if [ "y" = "$response" ]; then
        if [ -n "$(docker ps -a|grep ${container_name}_${idx})" ]; then
          echo "Deleting container: \"${container_name}_${idx}\"..."
          docker rm $(docker stop ${container_name}_${idx})
          if [ "true" = "${docker_command}" ]; then
            echo -e "Executed docker command:"
            echo -e "docker rm \$(docker stop ${container_name}_${idx})"
          fi
        else
          echo "Container \"${container_name}_${idx}\" does not exist"
        fi
      elif [ "n" != "$response" ]; then
        echo "Response must be \"y\" or \"n\""
      fi
    fi
  fi
fi

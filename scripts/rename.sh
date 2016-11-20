#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : rename.sh
# ALIAS            : edockerrename
# DESCRIPTION      : run command "docker rename" with parameters readed from local edocker.properties
#  ARGUMENT        : new name of container
#  PARAMETER       : container_name
#  PARAMETER       : docker_command
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : edockerrename
# ----------------------------------------------------
source {edockerpath}/_common.sh

name=$1

if [ -z "$1" ]; then
  "Please write new name of container for first argument"
else
  if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
    usage $0 rename
  else
    if [ ! -f edocker.${config_extension} ]; then
      echo -e "edocker:ERROR No edocker.${config_extension} available, use \"<edockerinit>\" command to initialize one in this directory"
    else
      read_app_properties
      idx=$(echo "$(docker ps -a|grep ${container_name}|wc -l)+0"|bc)
      if [ "0" = "${idx}" ]; then
        echo "No running or stopped container which name contains: \"${container_name}\" available"
      else
        echo "Container \"${container_name}_${idx}\" will be renamed, do you want to continue (y/n) ?"
        read response
        if [ "y" = "$response" ]; then
          if [ -n "$(docker ps -a|grep ${container_name}_${idx})" ]; then
            echo "Renaming container: \"${container_name}_${idx}\"..."
            docker rename ${container_name}_${idx} $name
            if [ "true" = "${docker_command}" ]; then
              echo -e "Executed docker command:"
              echo -e "docker rename ${container_name}_${idx} $name"
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
fi

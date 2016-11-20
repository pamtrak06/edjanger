#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : tag.sh
# ALIAS            : edockertag
# DESCRIPTION      : run command "docker tag" with parameters readed from local edocker.properties
#  ARGUMENT        : new name of container
#  PARAMETER       : image_name
#  PARAMETER       : docker_command
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : edockertag
# ----------------------------------------------------
source {edockerpath}/_common.sh

tag=$1

if [ -z "$1" ]; then
  "Please write tag of image \"${image_name}\" for first argument, enclosed with \""
else
  if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
    usage $0 tag
  else
    if [ ! -f edocker.${config_extension} ]; then
      echo -e "edocker:ERROR No edocker.${config_extension} available, use \"<edockerinit>\" command to initialize one in this directory"
    else
      read_app_properties
      idx=$(echo "$(docker images|grep ${image_name}|wc -l)+0"|bc)
      if [ "0" = "${idx}" ]; then
        echo "No image which name contains: \"${image_name}\" available"
      else
        echo "Image \"${image_name}\" will be tagged, do you want to continue (y/n) ?"
        read response
        if [ "y" = "$response" ]; then
          if [ -n "$(docker ps -a|grep ${image_name})" ]; then
            echo "Tag image: \"${image_name}\"..."
            docker tag ${image_name} $tag
            if [ "true" = "${docker_command}" ]; then
              echo -e "Executed docker command:"
              echo -e "docker tag ${image_name} $tag"
            fi
          else
            echo "Container \"${image_name}\" does not exist"
          fi
        elif [ "n" != "$response" ]; then
          echo "Response must be \"y\" or \"n\""
        fi
      fi
    fi
  fi
fi

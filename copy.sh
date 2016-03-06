#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : copy.sh
# DESCRIPTION      : docker copy script (read parameters from edocker.cfg)
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : alias edockercopy
# ----------------------------------------------------
source {edockerpath}/help.sh

if [ "$1" = "--help" ] || [ "$1" = "-help" ] || [ "$1" = "-h" ]; then
  usage_copy
else
  if [ ! -f edocker.cfg ]; then
    echo -e "edocker:ERROR No edocker.cfg available, use \"<edockerinit>\" command to initialize one in this directory"
  else
    source edocker.cfg
    
    if [ -z "$1" ] && [ -z "$2" ] && [ -z "$3" ]; then
      usage_copy
    else
      idx=$(echo "$(docker ps | grep ${image_name} | wc -l)+0" | bc)
      if [ "$1" = "c" ]; then
        echo copy from container_name: ${container_name}_${idx} file $2 to host:$3...
        docker cp ${container_name}_${idx}:$2 $3
      elif [ "$1" = "h" ]; then
        echo copy file from host:$2 to container ${container_name}_${idx}:$3
        docker cp $2 ${container_name}_${idx}:$3
      else
        usage_copy
      fi
    fi
  fi
fi

#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : rm.sh
# DESCRIPTION      : docker rm script (read parameters from edocker.cfg)
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : alias edockerrm
# ----------------------------------------------------

if [ ! -f edocker.cfg ]; then
  echo -e "edocker:ERROR No edocker.cfg available, use \"<edockerinit>\" command to initialize one in this directory"
else
  source edocker.cfg
  idx=$(echo "$(docker ps -a|grep ${container_name}|wc -l)+0"|bc)
  if [ "0" = "${idx}" ]; then
    echo "No running or stopped container which name contains: \"${container_name}\" available"
  else
    echo "Container \"${container_name}_${idx}\" will be permanently erased, do you want to continue (y/n) ?"
    read response
    if [ "y" = "$response" ]; then
      if [ -n "$(docker ps -a|grep ${container_name}_${idx})" ]; then
        echo "Delete container: \"${container_name}_${idx}\"..."
        docker rm $(docker stop ${container_name}_${idx})
      else
        echo "Container \"${container_name}_${idx}\" does not exist"
      fi
    elif [ "n" != "$response" ]; then
      echo "Response must be \"y\" or \"n\""
    fi
  fi
fi

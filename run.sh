#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : run.sh
# DESCRIPTION      : docker run script (read parameters from edocker.cfg)
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : ./run.sh
# ----------------------------------------------------
if [ "$1" = "--help" ] || [ "$1" = "-help" ] || [ "$1" = "-h" ]; then
  source {edockerpath}/help.sh  
  usage_run
else
  if [ ! -f edocker.cfg ]; then
    echo -e "edocker:ERROR No edocker.cfg available, use \"<edockerinit>\" command to initialize one in this directory"
  else
    source edocker.cfg
    idx=$(echo "$(docker ps | grep ${image_name} | wc -l)+1" | bc)
    echo run container_name: ${container_name}_${idx}...
    docker run -dt --name ${container_name}_${idx} ${exposed_ports} ${volumes_from} ${shared_volumes} ${environment_variables} ${linked_containers} ${image_name} ${command_run}
  fi
fi

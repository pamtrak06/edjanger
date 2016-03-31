#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : psa.sh
# ALIAS            : edockerpsa
# DESCRIPTION      : run command "docker ps -a" with parameters readed from local edocker.cfg
#   PARAMETER      : image_name
#   PARAMETER      : container_name
#   PARAMETER      : docker_command
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : edockerpsa
# ----------------------------------------------------
source {edockerpath}/_common.sh

if [ -n "$1" ]; then
  dockerbasiccontainer "help" "psa"
else
  dockerbasiccontainer "ps -a" "State of all containers (started/stoped) with name like: " "-1" "container"
fi

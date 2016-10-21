#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : start.sh
# ALIAS            : edockerstart
# DESCRIPTION      : run command "docker start" with parameters readed from local edocker.${config_extension}
#   PARAMETER      : image_name
#   PARAMETER      : container_name
#   PARAMETER      : start_options
#   PARAMETER      : docker_command
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : edockerstart
# ----------------------------------------------------
source {edockerpath}/_common.sh

if [ -n "$1" ]; then
  dockerbasiccontainer "help" "start"
else
  dockerbasiccontainer "start ${start_options}" "Starting container: " "0" "container"
fi

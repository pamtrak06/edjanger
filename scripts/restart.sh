#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : restart.sh
# ALIAS            : edockerrestart
# DESCRIPTION      : run command "docker restart" with parameters readed from local edocker.properties
#   PARAMETER      : image_name
#   PARAMETER      : container_name
#   PARAMETER      : restart_options
#   PARAMETER      : docker_command
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : edockerrestart
# ----------------------------------------------------
source {edockerpath}/_common.sh

if [ -n "$1" ]; then
  dockerbasiccontainer "help" "restart"
else
  dockerbasiccontainer "restart ${restart_options}" "Starting container: " "0" "container"
fi

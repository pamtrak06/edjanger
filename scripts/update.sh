#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : update.sh
# ALIAS            : edockerupdate
# DESCRIPTION      : run command "docker update" with parameters readed from local edocker.properties
#   PARAMETER      : image_name
#   PARAMETER      : container_name
#   PARAMETER      : update_options
#   PARAMETER      : docker_command
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : edockerupdate
# ----------------------------------------------------
source {edockerpath}/_common.sh

if [ -n "$1" ]; then
  dockerbasiccontainer "help" "update"
else
  dockerbasiccontainer "update ${update_options}" "updateing container: " "0" "container"
fi

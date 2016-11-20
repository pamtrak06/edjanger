#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : ps.sh
# ALIAS            : edjangerps
# DESCRIPTION      : run command "docker ps" with parameters readed from local edjanger.properties
#   PARAMETER      : image_name
#   PARAMETER      : container_name
#   PARAMETER      : docker_command
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : edjangerps
# ----------------------------------------------------
source {edjangerpath}/_common.sh

if [ -n "$1" ]; then
  dockerbasiccontainer "help" "ps"
else
  dockerbasiccontainer "ps ${ps_options}" "State of running containers with name like: " "-1" "container"
fi

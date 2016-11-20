#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : stats.sh
# ALIAS            : edockerstats
# DESCRIPTION      : run command "docker stats" with parameters readed from local edocker.properties
#   PARAMETER      : container_name
#   PARAMETER      : stats_options
#   PARAMETER      : docker_command
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : edockerstats
# ----------------------------------------------------
source {edockerpath}/_common.sh
read_app_properties
if [ -n "$1" ]; then
  dockerbasiccontainer "help" "stats"
else
  dockerbasiccontainer "stats ${stats_options}" "Statistics of container: " "0" "container"
fi

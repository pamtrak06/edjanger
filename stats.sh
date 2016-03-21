#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : stats.sh
# ALIAS            : edockerstats
# DESCRIPTION      : run command "docker stats" with parameters readed from local edocker.cfg
#   PARAMETER      : container_name
#   PARAMETER      : docker_command
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : ./start.sh
# ----------------------------------------------------
source {edockerpath}/_common.sh
dockerbasiccontainer "stats" "Starting container: " "0"

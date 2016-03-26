#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : top.sh
# ALIAS            : edockertop
# DESCRIPTION      : run command "docker top" with parameters readed from local edocker.cfg
#   PARAMETER      : container_name
#   PARAMETER      : docker_command
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : edockertop
# ----------------------------------------------------
source {edockerpath}/_common.sh

if [ -n "$1" ]; then
  dockerbasiccontainer "help" "top"
else
  dockerbasiccontainer "top" "top of container: " "0"
fi

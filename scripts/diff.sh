#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : diff.sh
# ALIAS            : edjangerdiff
# DESCRIPTION      : run command "docker diff" with parameters readed from local edjanger.properties
#   PARAMETER      : image_name
#   PARAMETER      : container_name
#   PARAMETER      : docker_command
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-09-25
# COMMENT          : creation
# --------------------------------
# USAGE            : edjangerdiff
# ----------------------------------------------------
source {edjangerpath}/_common.sh

if [ -n "$1" ]; then
  dockerbasiccontainer "help" "diff"
else
  dockerbasiccontainer "diff" "diffping container: " "0" "container" "container"
fi

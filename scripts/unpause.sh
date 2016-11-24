#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : pause.sh
# ALIAS            : edjangerpause
# DESCRIPTION      : run command "docker pause" with parameters readed from local edjanger.properties
#   PARAMETER      : image_name
#   PARAMETER      : container_name
#   PARAMETER      : docker_command
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-09-25
# COMMENT          : creation
# --------------------------------
# USAGE            : edjangerpause
# ----------------------------------------------------
source {edjangerpath}/_common.sh

if [ -n "$1" ]; then
  dockerbasiccontainer "help" "pause"
else
  dockerbasiccontainer "pause" "pause container: " "0" "container" "container"
fi
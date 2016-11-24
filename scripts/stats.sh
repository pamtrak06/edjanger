#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : stats.sh
# ALIAS            : edjangerstats
# DESCRIPTION      : run command "docker stats" with parameters readed from local edjanger.properties
#   PARAMETER      : container_name
#   PARAMETER      : stats_options
#   PARAMETER      : docker_command
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : edjangerstats
# ----------------------------------------------------
source {edjangerpath}/_common.sh

if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
  dockerbasiccontainer "help" "stats"
else
  dockerbasiccontainer "stats ${stats_options}" "Statistics of container: " $1
fi

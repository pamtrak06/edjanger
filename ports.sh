#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : ports.sh
# ALIAS            : edockerports
# DESCRIPTION      : run command "docker ports" on all running container
#   ARGUMENT       : exposed -> print list sorted off all container's exposed ports
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : edockerports
# ----------------------------------------------------
source {edockerpath}/_common.sh

ports=
if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
  usage $0 ports
else
  # list all container
  containers=$(docker ps --filter "status=running" -aq)
  if [ "$1" != "exposed" ]; then
    echo -e "--- List all mapped ports on runnning containers..."
  else
    echo -e "--- List all exposed ports on runnning containers..."
  fi
  for c in ${containers}; do
    id=$(docker ps --format "Id:{{.ID}} Image:{{.Image}} Name:{{.Names}}" |grep $c)
    if [ "$1" != "exposed" ]; then
      echo -e "$id"
      docker port $c
     else
       ports+=$(printf "%s;" $(docker port $c|cut -d ':' -f2))
     fi
  done
  if [ "$1" = "exposed" ]; then
    echo -e "${ports%;;}"
  fi
fi


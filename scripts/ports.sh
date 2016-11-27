#!/bin/bash
##  Show port list of all running container. Show exposed ports or mapped depends
##  of seletec option.
##  
##  Usage:
##     @script.name [option]
##  
##  Options:
##     -h, --help                     print this documentation
##  
##         --exposed                  index of the container name
##  
##  Parameters (edjanger.properties):
##     container_name                 container name
##     docker_command                 show docker command when edjanger is used
##     ps_options                    \"docker ps\" options to a running container
##  
##  edjanger, The MIT License (MIT)
##  Copyright (c) 2016 copyright pamtrak06@gmail.com
##  
# ------------------------------------------------------------------------------
source {edjangerpath}/_common.sh

ports=
if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
  printHeader $0
else
  # list all container
  containers=$(docker ps --filter "status=running" -aq)
  if [ "$1" != *"exposed"* ]; then
    echo -e "--- List all mapped ports on runnning containers..."
  else
    echo -e "--- List all exposed ports on runnning containers..."
  fi
  for c in ${containers}; do
    id=$(docker ps --format "Id:{{.ID}} Image:{{.Image}} Name:{{.Names}}" |grep $c)
    if [ "$1" != *"exposed"* ]; then
      echo -e "$id"
      docker port $c
     else
       ports+=$(printf "%s;" $(docker port $c|cut -d ':' -f2))
     fi
  done
  if [ "$1" == *"exposed"* ]; then
    echo -e "${ports%;;}"
  fi
fi


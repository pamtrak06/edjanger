#!/bin/bash
##  Print ports list of all running container.
##  
##  Usage:
##     @script.name [option]
##  
##  Options:
##     -h, --help                     print this documentation
##  
##         --list                     print list of exposed ports for all running containers
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
  if [[ "$1" == *"list"* ]]; then
    echo -e "--- List all exposed ports on runnning containers..."
  elif [[ "$1" == *"all"* ]]; then
    echo -e "--- List all exposed ports on all containers..."
  else
    echo -e "--- List all mapped ports on runnning containers..."
  fi
  for c in ${containers}; do
    id=$(docker ps --format "Id:{{.ID}} Image:{{.Image}} Name:{{.Names}}" |grep $c)
    if [[ "$1" == *"list"* ]]; then
      ports+=$(printf "%s;" $(docker port $c|cut -d ':' -f2))
    elif [[ "$1" == *"all"* ]]; then
      publishall=$(docker inspect --format='{{json .HostConfig.PublishAllPorts }}' $c)
      portbinding=$(docker inspect --format='{{json .HostConfig.PortBindings }}' $c)
      portexposed=$(docker inspect --format='{{json .Config.ExposedPorts }}' $c)
      netports=$(docker inspect --format='{{json .NetworkSettings.Ports }}' $c)
      printf "container $c: publish-all-ports=$publishall; bind=$portbinding; exposed=$portexposed; networking=$netports\n"
    else
      echo -e "$id"
      docker port $c
     fi
  done
  if [[ "$1" == *"list"* ]]; then
    echo -e "${ports%;;}"
  fi
fi


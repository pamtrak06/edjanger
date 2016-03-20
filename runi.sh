#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : runi.sh
# ALIAS            : edockerruni
# DESCRIPTION      : run command "docker run -it" interactive mode, with parameters readed from local edocker.cfg
#   PARAMETER      : image_name
#   PARAMETER      : exposed_ports
#   PARAMETER      : shared_volumes
#   PARAMETER      : environment_variables
#   PARAMETER      : linked_containers
#   PARAMETER      : exposed_ports
#   PARAMETER      : container_name
#   PARAMETER      : docker_command
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : ./run.sh
# ----------------------------------------------------
source {edockerpath}/_common.sh

if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
  usage $0 runi
else
  if [ ! -f edocker.cfg ]; then
    echo -e "edocker:ERROR No edocker.cfg available, use \"<edockerinit>\" command to initialize one in this directory"
  else
    read_config
    idx=$(echo "$(docker ps | grep ${image_name} | wc -l)+1" | bc)
    echo "Run container_name: ${container_name}_${idx}..."
    command_run="/bin/bash"
    docker run -it --name ${container_name}_${idx} ${exposed_ports} ${volumes_from} ${shared_volumes} ${environment_variables} ${linked_containers} ${image_name} ${command_run}
    if [ "true" = "${docker_command}" ]; then
      echo -e "> Executed docker command:"
      echo -e "> docker run ${exemode} --name ${container_name}_${idx} ${exposed_ports} ${volumes_from} ${shared_volumes} ${environment_variables} ${linked_containers} ${image_name} ${command_run}"
    fi
  fi
fi
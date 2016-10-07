#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : run.sh
# ALIAS            : edockerrun
# DESCRIPTION      : run command "docker run -id" daemon mode, with parameters readed from local edocker.${config_extension}
#   PARAMETER      : image_name
#   PARAMETER      : exposed_ports
#   PARAMETER      : shared_volumes
#   PARAMETER      : environment_variables
#   PARAMETER      : linked_containers
#   PARAMETER      : exposed_ports
#   PARAMETER      : network_settings
#   PARAMETER      : runtime_constraints_on_resources
#   PARAMETER      : container_name
#   PARAMETER      : docker_command
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# VERSION          : 1.0.1
# DATE             : 2016-08-01
# COMMENT          : add options for run : network_settings and network_settings
# --------------------------------
# USAGE            : edockerrun
# ----------------------------------------------------
source {edockerpath}/_common.sh

if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
  usage $0 run
else
  if [ ! -f edocker.${config_extension} ]; then
    echo -e "edocker:ERROR No edocker.${config_extension} available, use \"<edockerinit>\" command to initialize one in this directory"
  else
    read_config
    idx=$(echo "$(docker ps | grep ${container_name} | wc -l)+1" | bc)
    echo "Run container_name: ${container_name}_${idx}..."
    docker run -dt --name ${container_name}_${idx} ${run_other_options} ${network_settings} ${network_settings} ${exposed_ports} ${volumes_from} ${shared_volumes} ${environment_variables} ${linked_containers} ${image_name} ${command_run}
    if [ "true" = "${docker_command}" ]; then
      echo -e "> Executed docker command:"
      echo -e "> docker run -dt --name ${container_name}_${idx} ${run_other_options} ${network_settings} ${runtime_constraints_on_resources} ${exposed_ports} ${volumes_from} ${shared_volumes} ${environment_variables} ${linked_containers} ${image_name} ${command_run}"
    fi
  fi
fi

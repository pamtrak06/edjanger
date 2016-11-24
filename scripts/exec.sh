#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : exec.sh
# ALIAS            : edjangerexec
# DESCRIPTION      : run command "docker exec" with parameters readed from local edjanger.properties
#   ARGUMENT       : script argument passed to container, by example <edjangerexec "ls -la /">
#   ARGUMENT       : index=<index of container>, exec on specific container index
#   PARAMETER      : container_name
#   PARAMETER      : docker_command
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : edjangerexec
# ----------------------------------------------------
source {edjangerpath}/_common.sh
if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
  usage $0 exec
else
  rename_edocker_properties
  if [ ! -f edjanger.${config_extension} ]; then
    echo -e "edjanger:ERROR No edjanger.${config_extension} available, use \"<edjangerinit>\" command to initialize one in this directory"
  else
    read_app_properties
    idx=$(echo "$(docker ps | grep ${container_name} | wc -l)+0" | bc)
    echo enter in container_name: ${container_name}_${idx}...
    if [ -n "$1" ] && [[ "$1" == *"index"* ]]; then
      idx=$(echo "$(echo $1 | cut -d '=' -f2)" | bc)
      if [ -z "${command_run}" ]; then
        command_run="/bin/bash"
      fi
      if [ -n "$2" ]; then
        docker_command=\"${command_run} -c "$2"\"
      fi
      docker exec -t ${container_name}_${idx} ${docker_command}
      if [ "true" = "${docker_command}" ]; then
        echo -e "> Executed docker command:"
        echo -e "> docker exec -t ${container_name}_${idx} ${docker_command}"
      fi
    elif [ -n "$1" ]; then
      if [ -z "${command_run}" ]; then
        command_run="/bin/bash"
      fi
      docker exec -t ${container_name}_${idx} ${command_run} -c "$1"
      if [ "true" = "${docker_command}" ]; then
        echo -e "> Executed docker command:"
        echo -e "> docker exec -t ${container_name}_${idx} ${command_run} -c \"$1\""
      fi
    else
      if [ -z "${command_run}" ]; then
        command_run="/bin/bash"
      fi
      docker exec -it ${container_name}_${idx} ${command_run}
      if [ "true" = "${docker_command}" ]; then
        echo -e "> Executed docker command:"
        echo -e "> docker exec -it ${container_name}_${idx} ${command_run}"
      fi
    fi
  fi
fi

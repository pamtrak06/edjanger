#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : attach.sh
# ALIAS            : edjangerattach
# DESCRIPTION      : attach command "docker attach", with parameters readed from local edjanger.properties
#   PARAMETER      : attach_options
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-09-25
# COMMENT          : creation
# --------------------------------
# USAGE            : edjangerattach
# ----------------------------------------------------
source {edjangerpath}/_common.sh

if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
  usage $0 attach
else
  rename_edocker_properties
  if [ ! -f edjanger.${config_extension} ]; then
    echo -e "edjanger:ERROR No edjanger.${config_extension} available, use \"<edjangerinit>\" command to initialize one in this directory"
  else
    read_app_properties
    idx=$(echo "$(docker ps | grep ${container_name} | wc -l)+1" | bc)
    echo "attach container_name: ${container_name}_${idx}..."
    docker attach ${attach_options} ${container_name}_${idx}
    if [ "true" = "${docker_command}" ]; then
      echo -e "> Executed docker command:"
      echo -e "> docker attach ${attach_options} ${container_name}_${idx}"
    fi
  fi
fi

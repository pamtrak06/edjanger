#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : compose.sh
# ALIAS            : edockerexec
# DESCRIPTION      : generate docker compose yaml from all local edocker.poperties
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0.2
# DATE             : 2016-08-02
# COMMENT          : creation
# --------------------------------
# USAGE            : edockerexec
# ----------------------------------------------------
source {edockerpath}/_common.sh

function create_compose()
{
  # Retrieve all edocker configuration files from current directory
  listconf=$(find $PWD -name "edocker.properties")
  if [ -z "$listconf" ]; then
    echo -e "edocker:ERROR No edocker.${config_extension} available recursively in this directory"
  fi
  echo -e "edocker:INFO Write $CURDIR/docker-compose.yaml ..."
  CURDIR=$PWD
  echo "version: '2'" > $CURDIR/docker-compose.yaml
  echo "services:" >> $CURDIR/docker-compose.yaml

  for file in ${listconf[@]}
  do
    echo -e "edocker:INFO Process informations of configuration: \"$file\"  ..."
    working_directory=$(dirname ${file})
    relative_directory=$(echo "./${working_directory##${CURDIR}/}")
    cd ${working_directory}
    read_config

    prj=$(basename ${working_directory})
    echo "  ${prj}:" >> $CURDIR/docker-compose.yaml

    # TODO defined container name
    # echo "    container_name: ${container_name}" >> $CURDIR/docker-compose.yaml

    # Process build path configuration
    if [ -n "${build_file}" ]; then
      echo "    build:" >> $CURDIR/docker-compose.yaml
      #if [ ! -d "$CURDIR/${relative_directory}/${build_path}" ]; then
      build_file1=$(echo ${build_file//--file/})
      build_file2=$(echo ${build_file1//[[:space:]]/})
      if [[ ${build_path} = /* ]]; then
        echo "      context: ${build_path}" >> $CURDIR/docker-compose.yaml
        echo "      dockerfile: ${build_file2}" >> $CURDIR/docker-compose.yaml
      else
        echo "      context: ${relative_directory}/${build_path}" >> $CURDIR/docker-compose.yaml
        echo "      dockerfile: ${relative_directory}/${build_file2}" >> $CURDIR/docker-compose.yaml
      fi
      # Process build environment configuration
      if [ -n "${build_args}" ]; then
        echo "      args:" >> $CURDIR/docker-compose.yaml
        buildargsarray=(${build_args//-e/ })
        echo "        - buildno: ${#buildargsarray[@]}" >> $CURDIR/docker-compose.yaml
        for argnum in "${!buildargsarray[@]}"
        do
          echo "      - \"${buildargsarray[argnum]}\"" >> $CURDIR/docker-compose.yaml
        done
      fi
    else
      #if [ ! -d "$CURDIR/${relative_directory}/${build_path}" ]; then
      if [[ ${build_path} = /* ]]; then
        echo "    build: ${build_path}" >> $CURDIR/docker-compose.yaml
      else
        echo "    build: ${relative_directory}/${build_path}" >> $CURDIR/docker-compose.yaml
      fi
    fi

    # Process image name used
    if [ ! -f ${workink_directory}/build/Dockerfile ]; then
      echo "    image: ${image_name}" >> $CURDIR/docker-compose.yaml
    fi

    # Process environment configuration
    if [ -n "${environment_variables}" ]; then
      echo "    environment:" >> $CURDIR/docker-compose.yaml
      envarray=(${environment_variables//-e/ })
      for envnum in "${!envarray[@]}"
      do
        echo "      - \"${envarray[envnum]//[[:space:]]/}\"" >> $CURDIR/docker-compose.yaml
      done
    fi

    # Process exposed ports mapping configuration
    if [ -n "${exposed_ports}" ]; then
      echo "    ports:" >> $CURDIR/docker-compose.yaml
      portsarray=(${exposed_ports//-p/ })
      for portnum in "${!portsarray[@]}"
      do
        echo "      - \"${portsarray[portnum]//[[:space:]]/}\"" >> $CURDIR/docker-compose.yaml
      done
    fi

    # Process exposed ports configuration
    # TODO find a way to activate it
    # if [ -n "${exposed_ports}" ]; then
    #   echo "    expose:" >> $CURDIR/docker-compose.yaml
    #   portsarray=(${exposed_ports//-p/ })
    #   for portnum in "${!portsarray[@]}"
    #   do
    #     exposed_port=$(echo ${portsarray[portnum]//[[:space:]]/}|cut -d ':' -f1)
    #     echo "      - \"${exposed_port}\"" >> $CURDIR/docker-compose.yaml
    #   done
    # fi

    # Process shared volumes configuration
    if [ -n "${shared_volumes}" ]; then
      echo "    volumes:" >> $CURDIR/docker-compose.yaml
      volumesarray=(${shared_volumes//-v/ })
      for volumenum in "${!volumesarray[@]}"
      do
        volumepath=$(echo ${volumesarray[volumenum]//[[:space:]]/}|cut -d ':' -f1)
        #if [ ! -d "$CURDIR/${relative_directory}/${volumepath}" ]; then
        if [[ ${volumepath} = /* ]]; then
          echo "      - ${volumesarray[volumenum]//[[:space:]]/}" >> $CURDIR/docker-compose.yaml
        else
          echo "      - ${relative_directory}/${volumesarray[volumenum]//[[:space:]]/}" >> $CURDIR/docker-compose.yaml
        fi
      done
    fi

    # Process linked containers configuration
    # if [ -n "${linked_containers}" ]; then
    #   echo "    depends_on:" >> $CURDIR/docker-compose.yaml
    #   linkedarray=(${linked_containers//--link/ })
    #   for linknum in "${!linkedarray[@]}"
    #   do
    #     echo "      - $(echo ${linkedarray[linknum]//[[:space:]]/}|cut -d ':' -f1)" >> $CURDIR/docker-compose.yaml
    #   done
    # fi

    # Process linked containers configuration
    if [ -n "${linked_containers}" ]; then
      echo "    links:" >> $CURDIR/docker-compose.yaml
      linkedarray=(${linked_containers//--link/ })
      for linknum in "${!linkedarray[@]}"
      do
        echo "      - ${linkedarray[linknum]//[[:space:]]/}" >> $CURDIR/docker-compose.yaml
      done
    fi

    # Process linked containers configuration
    if [ -n "${command_run}" ]; then
      echo "    command: ${command_run}" >> $CURDIR/docker-compose.yaml
    fi

    # Process network configuration
    # TODO to be finished
    if [ -n "${network_settings}" ]; then
      if [[ "${network_settings}" =~ .*(--net [A-Za-z]*).* ]]; then
        netmode=(${BASH_REMATCH[1]//--net/})
        echo "    network_mode: \"${netmode//[[:space:]]/}\"" >> $CURDIR/docker-compose.yaml
      fi
    fi

    # TODO defined Logging configuration for the service.
    # echo "  logging:" >> $CURDIR/docker-compose.yaml
    # echo "  driver: syslog" >> $CURDIR/docker-compose.yaml
    # echo "  options: syslog" >> $CURDIR/docker-compose.yaml
    # echo "    syslog-address: "tcp://192.168.0.42:123"" >> $CURDIR/docker-compose.yaml
    echo "" >> $CURDIR/docker-compose.yaml
    cd $CURDIR
  done
}

if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
  usage $0 compose
else
  if [ -f $CURDIR/docker-compose.yaml ]; then
    echo -e "edocker:WARNING $CURDIR/docker-compose.yaml already available, do you want to override it (y/n) ?"
    read response
    if [ "y" = "$response" ]; then
      create_compose
    fi
  else
    create_compose
  fi
fi

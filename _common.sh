#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : _common.sh
# DESCRIPTION      : common scripts for edocker scripts
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : source _common.sh
# ----------------------------------------------------

function dockerbasicimage()
{
  command="$1"
  comment="$2"
 
  if [ "$1" = "--help" ] || [ "$1" = "-help" ] || [ "$1" = "-h" ]; then
    source {edockerpath}/help.sh  
    usage_${command}
  else
    if [ ! -f edocker.cfg ]; then
      echo -e "edocker:ERROR No edocker.cfg available, use \"<edockerinit>\" command to initialize one in this directory"
    else
      source edocker.cfg
      echo "${comment} $(echo ${image_name} | cut -d ':' -f1)..."
      docker ${command} | grep $(echo ${image_name} | cut -d ':' -f1)
    fi
  fi
}

function dockerbasiccontainer()
{
  command="$1"
  comment="$2"
  initidx="$3"

  if [ "$1" = "--help" ] || [ "$1" = "-help" ] || [ "$1" = "-h" ]; then
    source {edockerpath}/help.sh  
    usage_${command}
  else
    if [ ! -f edocker.cfg ]; then
      echo -e "edocker:ERROR No edocker.cfg available, use \"<edockerinit>\" command to initialize one in this directory"
    else
      source edocker.cfg
      echo "${comment} ${ct}..."
      if [ "${initidx}" != "-1" ]; then
        idx=$(echo "$(docker ps | grep ${image_name} | wc -l)+${initidx}" | bc)
        ct=${container_name}_${idx}
        docker ${command} ${ct}
      else
        ct=${container_name}
        docker ${command} | grep ${ct}
      fi
    fi
  fi
}


function checkconfig()
{
 
  if [ ! -f edocker.cfg ]; then
    echo -e "edocker:ERROR No edocker.cfg available, use \"<edockerinit>\" command to initialize one in this directory"
  else
    source edocker.cfg
    checkparameter "image_name"
    checkparameter "build_path"
    checkparameter "build_args"
    checkparameter "container_name"
    checkparameter "exposed_ports"
    checkparameter "shared_volumes"
    checkparameter "volumes_from"
    checkparameter "environment_variables"
    checkparameter "linked_containers"
    checkparameter "force_rmi"
    checkparameter "command_run"
    if [ "$?" = "-1" ]; then
      return -1
    fi
  fi
}


function checkparameter()
{
  parameter="$1"
  
  check_${parameter}=$(cat edocker.cfg|grep "${parameter}")
  if [ -z "check_${parameter}" ]; then
    echo "Parameter: ${parameter} is missing in edocker.cfg !!!"
    return -1
  fi
}

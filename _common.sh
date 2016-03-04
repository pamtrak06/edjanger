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
      if [ "${initidx}" != "-1" ]; then
        idx=$(echo "$(docker ps -a | grep ${image_name} | wc -l)+${initidx}" | bc)
        ct=${container_name}_${idx}
        echo "${comment} ${ct}..."
        docker ${command} ${ct}
      else
        ct=${container_name}
        echo "${comment} ${ct}..."$
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
    local res
    checkparameter "image_name";            if [ "$?" = "255" ]; then res=255; fi
    checkparameter "build_path";            if [ "$?" = "255" ]; then res=255; fi
    checkparameter "build_args";            if [ "$?" = "255" ]; then res=255; fi
    checkparameter "container_name";        if [ "$?" = "255" ]; then res=255; fi
    checkparameter "exposed_ports";         if [ "$?" = "255" ]; then res=255; fi
    checkparameter "shared_volumes";        if [ "$?" = "255" ]; then res=255; fi
    checkparameter "volumes_from";          if [ "$?" = "255" ]; then res=255; fi
    checkparameter "environment_variables"; if [ "$?" = "255" ]; then res=255; fi
    checkparameter "linked_containers";     if [ "$?" = "255" ]; then res=255; fi
    checkparameter "force_rmi";             if [ "$?" = "255" ]; then res=255; fi
    checkparameter "command_run";           if [ "$?" = "255" ]; then res=255; fi
    if [ "$res" = "255" ]; then
      return 255
    fi
  fi
}


function checkparameter()
{
  parameter="$1"
  
  export check=$(cat edocker.cfg|grep -v "#"|grep "${parameter}"|cut -d '=' -f1)
  if [ -z ${check} ]; then
    echo "  - parameter: \"${parameter}\" is missing !!!"
    return 255
  fi
}

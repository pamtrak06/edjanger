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
      if [ "true" = "${docker_command}" ]; then
          echo -e "> Executed docker command:"
          echo -e "> docker ${command} | grep $(echo ${image_name} | cut -d ':' -f1)"
      fi
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
        if [ "true" = "${docker_command}" ]; then
          echo -e "> Executed docker command:"
          echo -e "> docker ${command} ${ct}"
        fi
      else
        ct=${container_name}
        echo "${comment} ${ct}..."$
        docker ${command} | grep ${ct}
        if [ "true" = "${docker_command}" ]; then
          echo -e "> Executed docker command:"
          echo -e "> docker ${command} | grep ${ct}"
        fi
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
    
    parameters=$(cat {edockerpath}/edocker.cfg.sample|grep -v "#"|grep "="|cut -d '=' -f1)

    local res
    for p in ${parameters}; do
    
      echo -e "  - check \"${p}\""
      checkparameter "${p}"; if [ "$?" = "255" ]; then res=255; fi
      
    done

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
    #echo "    ERROR:     parameter: \"${parameter}\" is missing !!!"
    echo "    ERROR: parameter is missing !!!"
    return 255
  fi
}

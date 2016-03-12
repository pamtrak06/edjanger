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

function checkparameter()
{
  parameter="$1"
  
  # grep parameter found in edocker.cfg
  export check=$(cat edocker.cfg|grep -v "#"|grep "${parameter}"|cut -d '=' -f1)
  if [ -z ${check} ]; then
    echo "    ERROR: parameter is missing !!!"
    return 255
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

function usage_command()
{

  script=$1
  command=$2

  # list all *.sh scripts from edocker path
  scripts=$(ls {edockerpath}/*.sh | grep -v -e "${script}" -e "help" -e "\_")
  
  for s in ${scripts}; do

    base=$(basename ${s})
    
    found=$(grep -e ${command} ${s})
    
    if [ -n "${found}" ]; then
      echo -e "      - command: \"edocker${base%.sh}\""
    fi
  
  done
  
}

function usage_list()
{

  script=$1

  # list all *.sh scripts from edocker path
  scripts=$(ls {edockerpath}/*.sh | grep -v -e "\_")
  
  echo -e "Help must have one argument in list:"
  echo -e "  command: config"
  
  for s in ${scripts}; do

    base=$(basename ${s})
    
    echo -e "  command: ${base%.sh}"
  
  done

}

function usage_config()
{
  script=$1

  echo -e "Parameters in edocker.cfg configuration file"
 
  parameters=$(cat {edockerpath}/edocker.cfg.sample|grep -v "#"|grep "="|cut -d '=' -f1)

  for p in ${parameters}; do
    
    comment=$(cat {edockerpath}/edocker.cfg.sample|grep -e "#${p}"|cut -d ':' -f2)
    echo -e ""
    echo -e "  - ${p}: ${comment}, used by:"
    usage_command "${script}" "${p}"

  done

}

function usage()
{

  commands=()

  script=$1
  command=$2

  if [ -z "${command}" ]; then
  
    usage_list ${script}

  else
    
    found=false
    
    scripts=$(ls {edockerpath}/*.sh | grep -v -e "\_")

    for s in ${scripts}; do

      base=$(basename ${s})
    
      edalias=${prefix}${base%.sh}
      
      if [ "$2" = "${edalias}" ]; then
      
        if [ -f {edockerpath}/${edalias}.man ]; then
          source {edockerpath}/${edalias}.man
        else
          echo "ERROR: no help file for ${edalias}"
        fi
        
        found=true
        
      fi
      
    done
    
    if [ "$2" = "config" ]; then
    
      usage_config "${script}"
    
      found=true
      
    fi
    
    if [ "${found}" != "true" ]; then
      usage_list ${script}
    fi
    
  fi
}

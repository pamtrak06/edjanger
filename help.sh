#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : copy.sh
# DESCRIPTION      :help script for edocker command
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : alias edockerhelp <shord docker command name>
# ----------------------------------------------------

function usage_command()
{

  script=$1
  command=$2

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

  # list all *.sh scripts from edocker path
  script=$1

  scripts=$(ls {edockerpath}/*.sh | grep -v -e "${script}" -e "\_")
  
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

  if [ -z "$2" ]; then
  
    usage_list ${script}

  else
    
    found=false
    
    scripts=$(ls {edockerpath}/*.sh | grep -v -e "${script}" -e "\_")

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

usage $0 $1


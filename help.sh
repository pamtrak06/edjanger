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

function usage_alias()
{
  echo -e "-- edockeralias --"
  echo -e "  # Purpose"
  echo -e "     Show all edocker alias"
  echo -e "  # Usage"
  echo -e "     edockeralias"
  echo -e "  # Configuration"
  echo -e "     No parameters in edocker.cfg"
}

function usage_build()
{
  echo -e "-- edockerbuild --"
  echo -e "  # Purpose"
  echo -e "     Build image \"image_name\" from Dockerfile in \"build_path\" with arguments \"build_args\""
  echo -e "  # Usage"
  echo -e "     edockerbuild"
  echo -e "  # Configuration"
  echo -e "     Parameters in edocker.cfg:"
  echo -e "       - image_name: name of image to be build"
  echo -e "       - build_args: arguments give to building image"
  echo -e "       - build_path: path where to find Dockerfile and his context"
}

function usage_check()
{
  echo -e "-- edockercheck --"
  echo -e "  # Purpose"
  echo -e "     Check if no parameters are missing in edocker.cfg configuration file"
  echo -e "  # Usage"
  echo -e "     edockercheck"
  echo -e "  # Configuration"
  echo -e "     No parameters in edocker.cfg"
}

function usage_clean()
{
  echo -e "-- edockerclean --"
  echo -e "  # Purpose"
  echo -e "     Clean all images with \"none\" attribute"
  echo -e "  # Usage"
  echo -e "     edockerclean"
  echo -e "  # Configuration"
  echo -e "     No parameters in edocker.cfg"
}

function usage_copy {
  echo -e "-- edockercopy --"
  echo -e "  # Purpose"
  echo -e "     Copy file from host to container or from container to host"
  echo -e "  # Usage"
  echo -e "     edockercopy <order from host to container (h), from container to host (c)> <path from h or c> <path from c or h>"
  echo -e "     If argument 1=h, arg2=filename from host,    arg3=container path"
  echo -e "     If argument 1=c, arg2=filename in container, arg3=host path"
  echo -e "  # Configuration"
  echo -e "     No parameters in edocker.cfg"
}

function usage_exec()
{
  echo -e "-- edockerexec --"
  echo -e "  # Purpose"
  echo -e "     Enter in a container or execute a command in a container"
  echo -e "  # Usage"
  echo -e "     edockerexec <command to execute in container>"
  echo -e "  # Configuration"
  echo -e "     Parameters in edocker.cfg:"
  echo -e "       - container_name: name of the container"
}

function usage_images()
{
  echo -e "-- edockerimages --"
  echo -e "  # Purpose"
  echo -e "     List images with name specified in configuration"
  echo -e "  # Usage"
  echo -e "     edockerimage"
  echo -e "  # Configuration"
  echo -e "     Parameters in edocker.cfg:"
  echo -e "       - image_name: name of the image"
}

function usage_init()
{
  echo -e "-- edockerinit --"
  echo -e "  # Purpose"
  echo -e "     Initialize a configuration file edocker.cfg in curretn directory"
  echo -e "  # Usage"
  echo -e "     edockerinit"
  echo -e "  # Configuration"
    echo -e "     No parameters in edocker.cfg"
}

function usage_basic()
{
  command="$1"
  
  echo -e "-- edocker${command} --"
  echo -e "  # Purpose"
  echo -e "     Command docker ${command} in the container with name specified in configuration"
  echo -e "  # Usage"
  echo -e "     edocker${command}"
  echo -e "  # Configuration"
  echo -e "     Parameters in edocker.cfg:"
  echo -e "       - container_name: name of the container"
}

function usage_inspect()
{
  usage_basic "inspect"
}

function usage_logs()
{
  usage_basic "logs"
}

function usage_ps()
{
  usage_basic "ps"
}

function usage_psa()
{
  usage_basic "psa"
}

function usage_rm()
{
  usage_basic "rm"
}

function usage_run()
{
  usage_basic "run"
}

function usage_start()
{
  usage_basic "start"
}

function usage_stop()
{
  usage_basic "stop"
}

function usage()
{
  commands=()

  # list all *.sh scripts from edocker path
  scripts=$(ls $edockerpath/*.sh | grep -v $(basename $0) -e "\_")

  for s in ${scripts}; do

    base=$(basename ${s})
    
    commands+=("${base}")
  
  done
  
  if [ -z "$1" ]; then
    echo "Help must have one argument in list: ${commands}"
  else
  
    for s in ${scripts}; do

      base=$(basename ${s})
    
      edalias=${prefix}${base%.sh}
      
      if [ "$1" = "${edalias}" ]; then
      
        usage_${edalias}
        
        find=true
        
      fi
      
    done
    
    if [ "${founded}" != "true" ]; then
      echo -e "help for edocker, please enter a short docker command like: build, clean, copy"
    fi
    
  fi
}

usage $1


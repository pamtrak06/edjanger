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

function usage()
{
  if [ -z "$1" ]; then
    echo "Help must have one argument in list: build, clean"
  elif [ "$1" = "build" ]; then
    usage_build
  elif [ "$1" = "copy" ]; then
    usage_copy
  elif [ "$1" = "clean" ]; then
    usage_clean
  else
    echo -e "help for edocker, please enter a short docker command like: build, clean, copy"
  fi
}

usage $1


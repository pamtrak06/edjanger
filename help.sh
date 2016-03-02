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

function usage()
{
  if [ -z "$1" ]; then
    echo "Help must have one argument in list: build, clean"
  elif [ "$1" = "build" ]; then
    usage_build
  elif [ "$1" = "clean" ]; then
    usage_clean
  fi
}

usage $1


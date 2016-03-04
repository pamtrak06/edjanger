#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : build.sh
# DESCRIPTION      : docker build script (read parameters from edocker.cfg)
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : alias edockerbuild
# ----------------------------------------------------
if [ "$1" = "--help" ] || [ "$1" = "-help" ] || [ "$1" = "-h" ]; then
  source {edockerpath}/help.sh  
  usage_build
else
  if [ ! -f edocker.cfg ]; then
    echo -e "edocker:ERROR No edocker.cfg available, use \"<edockerinit>\" command to initialize one in this directory"
  else
    source edocker.cfg
    echo build image_name: ${image_name}...
    if [ ! -d ${build_path} ]; then
      echo "Build path must exist and be a folder, configure variable build_path in edocker.cfg"
    else
      . {edockerpath}/_proxy.sh
      build_arguments="${proxy_args} ${build_args}"
      docker build -t "${image_name}" ${build_arguments} ${build_path}
      build_arguments=""
      . {edockerpath}/_proxy_reset.sh
    fi
  fi
fi

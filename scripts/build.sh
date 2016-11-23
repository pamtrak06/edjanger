#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : build.sh
# ALIAS            : edjangerbuild
# DESCRIPTION      : run command "docker build" with parameters readed from local edjanger.properties
#   PARAMETER      : image_name
#   PARAMETER      : proxy_args
#   PARAMETER      : build_args
#   PARAMETER      : build_forcerm
#   PARAMETER      : build_nocache
#   PARAMETER      : build_file
#   PARAMETER      : build_path
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : edjangerbuild
# ----------------------------------------------------
source {edjangerpath}/_common.sh

if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
  usage $0 build
else
  rename_edocker_properties
  if [ ! -f edjanger.${config_extension} ]; then
    echo -e "edjanger:ERROR No edjanger.${config_extension} available, use \"<edjangerinit>\" command to initialize one in this directory"
  else
    read_app_properties
    echo build image_name: ${image_name}...
    if [ ! -d ${build_path} ]; then
      echo "Build path must exist and be a folder, configure variable build_path in edjanger.${config_extension}"
    else
      . {edjangerpath}/_proxy.sh
      build_arguments="${proxy_args} ${build_args}"
      docker build -t "${image_name}" ${build_arguments} ${build_forcerm} ${build_rm} ${build_nocache} ${build_file} ${build_path}
      if [ "true" = "${docker_command}" ]; then
        echo -e "> Executed docker command:"
        echo -e "> docker build -t \"${image_name}\" ${build_arguments} ${build_forcerm} ${build_rm} ${build_nocache} ${build_file} ${build_path}"
      fi
      build_arguments=""
      . {edjangerpath}/_proxy_reset.sh
    fi
  fi
fi

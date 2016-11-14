#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : _proxy.sh
# DESCRIPTION      : set proxy env. var. from unarchive proxy.zip wich contain proxy.${config_extension}
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : _proxy.sh
# ----------------------------------------------------
source {edockerpath}/_common.sh
if [ -f {edockerpath}/proxy.zip ]; then
  if [ ! -f edocker.${config_extension} ]; then
    echo -e "edocker:ERROR No edocker.${config_extension} available, use \"<edockerinit>\" command to initialize one in this directory"
  else
    read_edockerproperties
    echo -e "Initialize proxy parameters..."
    unzip {edockerpath}/proxy.zip -d {edockerpath}/
    source {edockerpath}/proxy.${config_extension}
    rm -f {edockerpath}/proxy.${config_extension}
    proxy_args="--build-arg http_proxy=$http_proxy --build-arg https_proxy=$https_proxy"
  fi
else
  if [ -n "$HTTPS_PROXY" ]; then
    proxy_args="--build-arg HTTPS_PROXY=$HTTPS_PROXY"
  fi
  if [ -n "$HTTP_PROXY" ]; then
     proxy_args="--build-arg HTTP_PROXY=$HTTP_PROXY ${proxy_args}"$
  fi
  if [ -n "$https_proxy" ]; then
    proxy_args="--build-arg https_proxy=$https_proxy ${proxy_args}"
  fi
  if [ -n "$http_proxy" ]; then
    proxy_args="--build-arg http_proxy=$http_proxy ${proxy_args}"
  fi
fi

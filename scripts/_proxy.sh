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
source {edjangerpath}/_common.sh
if [ -f {edjangerpath}/proxy.zip ]; then
  if [ ! -f edjanger.${config_extension} ]; then
    echo -e "edjanger:ERROR No edjanger.${config_extension} available, use \"<edjangerinit>\" command to initialize one in this directory"
  else
    read_app_properties
    echo -e "Initialize proxy parameters..."
    unzip {edjangerpath}/proxy.zip -d {edjangerpath}/
    source {edjangerpath}/proxy.${config_extension}
    rm -f {edjangerpath}/proxy.${config_extension}
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

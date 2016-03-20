#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : _encrypt.sh
# DESCRIPTION      : encrypt proxy.cfg file with zip --encrypt
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : ./_encrypt.sh
# ----------------------------------------------------
source {edockerpath}/_common.sh
if [ ! -f "{edockerpath}/proxy.cfg" ]; then
  echo -e "edocker:ERROR {edockerpath}/proxy.cfg must exist and does container proxy parameters:"
  echo -e "  - http_proxy=..."
  echo -e "  - https_proxy=..."
  echo -e "  - HTTP_PROXY=..."
  echo -e "  - HTTPS_PROXY=..."
else
  if [ ! -f edocker.cfg ]; then
    echo -e "edocker:ERROR No edocker.cfg available, use \"<edockerinit>\" command to initialize one in this directory"
  else
    read_config
    echo "Encrypt {edockerpath}/proxy.cfg..."
    zip --encrypt {edockerpath}/proxy.zip {edockerpath}/proxy.cfg
    rm -f {edockerpath}/proxy.cfg
  fi
fi

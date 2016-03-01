#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------

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
    source edocker.cfg
    echo Encrypt {edockerpath}/proxy.cfg...
    zip --encrypt {edockerpath}/proxy.zip {edockerpath}/proxy.cfg
    rm -f {edockerpath}/proxy.cfg
  fi
fi

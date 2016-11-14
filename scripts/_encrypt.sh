#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : _encrypt.sh
# DESCRIPTION      : encrypt proxy.${config_extension} file with zip --encrypt
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : ./_encrypt.sh
# ----------------------------------------------------
source {edockerpath}/_common.sh
if [ ! -f "{edockerpath}/proxy.${config_extension}" ]; then
  echo -e "edocker:ERROR {edockerpath}/proxy.${config_extension} must exist and does container proxy parameters:"
  echo -e "  - http_proxy=..."
  echo -e "  - https_proxy=..."
  echo -e "  - HTTP_PROXY=..."
  echo -e "  - HTTPS_PROXY=..."
else
  if [ ! -f edocker.${config_extension} ]; then
    echo -e "edocker:ERROR No edocker.${config_extension} available, use \"<edockerinit>\" command to initialize one in this directory"
  else
    read_edockerproperties
    echo "Encrypt {edockerpath}/proxy.${config_extension}..."
    zip --encrypt {edockerpath}/proxy.zip {edockerpath}/proxy.${config_extension}
    rm -f {edockerpath}/proxy.${config_extension}
  fi
fi

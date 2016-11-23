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
source {edjangerpath}/_common.sh
if [ ! -f "{edjangerpath}/proxy.${config_extension}" ]; then
  echo -e "edjanger:ERROR {edjangerpath}/proxy.${config_extension} must exist and does container proxy parameters:"
  echo -e "  - http_proxy=..."
  echo -e "  - https_proxy=..."
  echo -e "  - HTTP_PROXY=..."
  echo -e "  - HTTPS_PROXY=..."
else
  rename_edocker_properties
  if [ ! -f edjanger.${config_extension} ]; then
    echo -e "edjanger:ERROR No edjanger.${config_extension} available, use \"<edjangerinit>\" command to initialize one in this directory"
  else
    read_app_properties
    echo "Encrypt {edjangerpath}/proxy.${config_extension}..."
    zip --encrypt {edjangerpath}/proxy.zip {edjangerpath}/proxy.${config_extension}
    rm -f {edjangerpath}/proxy.${config_extension}
  fi
fi

#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : check.sh
# ALIAS            : edockercheck
# DESCRIPTION      : check missing parameters in edocker.cfg
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : alias edockercheck
# ----------------------------------------------------
. {edockerpath}/_common.sh
if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
  usage $0 check
else
  if [ -f "edocker.cfg" ] && [ "{edockerpath}" != "$PWD" ]; then
    echo -e "Check edocker.cfg..."
    checkconfig
    if [ "$?" != "255" ]; then
      echo -e "  -> configuration is OK"
    else
      echo -e "  -> configuration is NOK"
    fi
  fi
fi

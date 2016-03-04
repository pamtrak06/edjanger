#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : check.sh
# DESCRIPTION      : validate a edocker.cfg file
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : alias edockercheck
# ----------------------------------------------------
if [ "$1" = "--help" ] || [ "$1" = "-help" ] || [ "$1" = "-h" ]; then
  source {edockerpath}/help.sh  
  usage_check
else
  if [ -f "edocker.cfg" ] && [ "{edockerpath}" != "$PWD" ]; then
    source {edockerpath}/_common.sh
    echo -e "Check edocker.cfg..."
    checkconfig
    if [ "$?" != "255" ]; then
      echo -e "  -> configuration is OK"
    fi
  fi
fi

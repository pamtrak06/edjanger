#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : init.sh
# ALIAS            : edockerinit
# DESCRIPTION      : create a edocker.${config_extension} file
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : edockerinit
# ----------------------------------------------------
source {edockerpath}/_common.sh
if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
  usage $0 init
else
  if [ ! -f "edocker.${config_extension}" ] && [ "{edockerpath}" != "$PWD" ]; then
    cp {edockerpath}/edocker_template.${config_extension} ./edocker.${config_extension}
  else
    source {edockerpath}/_common.sh
    echo -e "File edocker.${config_extension} is already in your current directory !"
    checkconfig
  fi
fi

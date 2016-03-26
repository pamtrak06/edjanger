#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : unalias.sh
# ALIAS            : edockerunalias
# DESCRIPTION      : unalias all edocker aliases
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : edockerunalias
# ----------------------------------------------------
source {edockerpath}/_common.sh

if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
  source {edockerpath}/help.sh  
  usage $0 unalias
else
  unalias $(alias|grep edocker|cut -d '=' -f1|cut -d ' ' -f2)
fi

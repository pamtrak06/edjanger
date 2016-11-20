#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : unalias.sh
# ALIAS            : edjangerunalias
# DESCRIPTION      : unalias all edjanger aliases
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : edjangerunalias
# ----------------------------------------------------
source {edjangerpath}/_common.sh

if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
  source {edjangerpath}/help.sh  
  usage $0 unalias
else
  unalias $(alias|grep edjanger|cut -d '=' -f1|cut -d ' ' -f2)
fi

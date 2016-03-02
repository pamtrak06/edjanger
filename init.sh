#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : init.sh
# DESCRIPTION      : initailize a edocker.cfg file
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : alias edockerinit
# ----------------------------------------------------

if [ ! -f "edocker.cfg" ] && [ "{edockerpath}" != "$PWD" ]; then
  cp {edockerpath}/edocker.cfg.sample ./edocker.cfg
else
  echo -e "File edocker.cfg is already in your current directory !"
fi

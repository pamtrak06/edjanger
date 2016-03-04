#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : psa.sh
# DESCRIPTION      : docker ps -a script (read parameters from edocker.cfg)
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : alias edockerpsa
# ----------------------------------------------------
source {edockerpath}/_common.sh
dockerbasiccontainer "ps -a" "State of containers with name like: " "-1"

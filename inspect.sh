#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : inspect.sh
# DESCRIPTION      : docker inspect script (read parameters from edocker.cfg)
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : alias edockerinspect
# ----------------------------------------------------

source {edockerpath}/_common.sh
dockerbasiccontainer "inspect" "Inspection of container: " "0"

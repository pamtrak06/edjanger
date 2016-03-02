#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : logs.sh
# DESCRIPTION      : docker logs script (read parameters from edocker.cfg)
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : alias edockerlogs
# ----------------------------------------------------

source {edockerpath}/_common.sh
dockerbasiccontainer "logs" "Logs of container: " "0"

#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : images.sh
# ALIAS            : edockerps
# DESCRIPTION      : run command "docker images" with parameters readed from local edocker.cfg
#   PARAMETER      : image_name
#   PARAMETER      : docker_command
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : alias edockerimages
# ----------------------------------------------------
source {edockerpath}/_common.sh
dockerbasicimage "images" "List image which name name contains: "

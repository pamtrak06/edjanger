#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : images.sh
# ALIAS            : edockerimages
# DESCRIPTION      : run command "docker images" with parameters readed from local edocker.${config_extension}
#   PARAMETER      : image_name
#   PARAMETER      : docker_command
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : edockerimages
# ----------------------------------------------------
source {edockerpath}/_common.sh
if [ -n "$1" ]; then
  dockerbasicimage "help" "images"
else
  dockerbasicimage "images" "List image which name contains: "
fi


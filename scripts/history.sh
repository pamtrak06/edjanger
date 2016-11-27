#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : images.sh
# ALIAS            : edjangerimages
# DESCRIPTION      : run command "docker images" with parameters readed from local edjanger.properties
#   PARAMETER      : image_name
#   PARAMETER      : docker_command
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : edjangerimages
# ----------------------------------------------------
source {edjangerpath}/_common.sh

dockerbasicimage "--command=\"history\";--commandcomment=\"Show the history of images which name contains: {image_name}...\";$@"


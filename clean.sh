#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : clean.sh
# DESCRIPTION      : clean all images with none attribute
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : alias edockerclean
# ----------------------------------------------------

echo "Images with \"none\" name will be deleted, is it ok for you (y/n) ?"
read response
if [ "y" = "$response" ]; then
  echo "Delete images with attribute \"none\"..."
  docker rmi ${force_rmi} $(docker images | grep none| awk '{print $3}')
elif [ "n" != "$response" ]; then
  echo "Response must be \"y\" or \"n\""
fi

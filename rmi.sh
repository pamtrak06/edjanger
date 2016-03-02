#!/bin/bash
# --------------------------------
# SCRIPT           : rmi.sh
# DESCRIPTION      : docker rmi script (read parameters from edocker.cfg)
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : alias edockerrmi
# --------------------------------
source edocker.cfg
echo "delete images with \"none\" attribute..."
docker rmi ${force_rmi} $(docker images | grep none| awk '{print $3}')

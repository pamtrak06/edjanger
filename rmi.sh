#!/bin/bash
# --------------------------------
# SCRIPT           : rmi.sh
# DESCRIPTION      : docker rmi script (read parameters from config.cfg)
# CREATOR          : jp.janecek@akka.eu
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-02-26
# COMMENT          : creation
# --------------------------------
# USAGE            : alias "d[docker working folder]rmi"
# --------------------------------
source config.cfg
echo delete images with none...
docker rmi ${force_rmi} $(docker images | grep none| awk '{print $3}')

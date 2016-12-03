#!/bin/bash
# ------------------------------------------------------------------------------
##  Description: check missing parameters in edjanger.properties from existing in template
##  templates/edjanger.template
##  
##  Usage:
##     @script.name
##  
##  edjanger, The MIT License (MIT)
##  Copyright (c) 2016 copyright pamtrak06@gmail.com
##  
# ------------------------------------------------------------------------------
checkinstall=$(cat $0|grep {edjangerpath})
[ -n "$checkinstall" ]             && echo "edjanger:ERROR: Bad edjanger configuration, please run ./edjangerinstall.sh --alias from edjanger path" && exit -1
source {edjangerpath}/_common.sh

if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
  usage $0 check
else
  if [ -f "edjanger.${config_extension}" ] && [ "{edjangerpath}" != "$PWD" ]; then
    echo -e "Check edjanger.${config_extension}..."
    checkconfig
    if [ "$?" != "255" ]; then
      echo -e "  => STATUS of configuration is: OK"
    else
      echo -e "  => STATUS of configuration is: some parameters are undefined"
    fi
  fi
fi

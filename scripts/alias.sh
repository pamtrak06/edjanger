#!/bin/bash
# ------------------------------------------------------------------------------
##  Description: print edjanger aliases
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
  printHeader $0
else
  alias | grep edjanger
fi

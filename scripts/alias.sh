#!/bin/bash
# ------------------------------------------------------------------------------
##  Print edjanger aliases
##  
##  Usage:
##     edjangeralias
##  
##  edjanger, The MIT License (MIT)
##  Copyright (c) 2016 copyright pamtrak06@gmail.com
##  
# ------------------------------------------------------------------------------
source {edjangerpath}/_common.sh

if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
  usage $0 alias
else
  alias | grep edjanger
fi

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
source {edjangerpath}/_common.sh

if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
  printHeader $0
else
  alias | grep edjanger
fi

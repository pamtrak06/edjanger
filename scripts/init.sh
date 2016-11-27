#!/bin/bash
##  Create a edjanger project with following files
##  - edjanger.properties
##  - build/Dockerfile
##  
##  Usage:
##     @script.name [option]
##  
##  Options:
##     -h, --help                     print this documentation
##  
##  edjanger, The MIT License (MIT)
##  Copyright (c) 2016 copyright pamtrak06@gmail.com
##  
# ------------------------------------------------------------------------------
source {edjangerpath}/_common.sh

if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
  printHeader $0
else
  if [ ! -f "edjanger.${config_extension}" ] && [ "{edjangerpath}" != "$PWD" ]; then
    echo -e "> Initialize edjanger configuration file: edjanger.${config_extension} ..."
    cp {edjangerpath}/templates/edjanger_template.${config_extension} ./edjanger.${config_extension}
  else
    source {edjangerpath}/_common.sh
    echo -e "File edjanger.${config_extension} is already in your current directory !"
    checkconfig
  fi
  if [ ! -d "build" ] && [ "{edjangerpath}" != "$PWD" ]; then
    echo -e "> Initialize edjanger build folder for Dockerfile: /build ..."
    mkdir build/
  fi
  if [ ! -f "build/Dockerfile" ] && [ "{edjangerpath}" != "$PWD" ]; then
    echo -e "> Initialize Dockerfile: build/Dockerfile ..."
    touch build/Dockerfile
  fi
fi

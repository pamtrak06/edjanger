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
  echo -e "> Initialize edjanger project ..."
  if [ ! -f "edjanger.template" ] && [ "{edjangerpath}" != "$PWD" ]; then
    echo -e "  . Initialize edjanger template file example: edjanger.template ..."
    cp {edjangerpath}/templates/edjanger.template .
  else
    source {edjangerpath}/_common.sh
    echo -e "  . File edjanger.template is already in your current directory !"
  fi
  if [ ! -f "configuration.${config_extension}" ] && [ "{edjangerpath}" != "$PWD" ]; then
    echo -e "  . Initialize edjanger configuration file example: configuration.${config_extension} ..."
    cp {edjangerpath}/templates/configuration.${config_extension} .
  else
    source {edjangerpath}/_common.sh
    echo -e "  . File configuration.${config_extension} is already in your current directory !"
  fi
  if [ ! -f "edjanger.${config_extension}" ] && [ "{edjangerpath}" != "$PWD" ]; then
    echo -e "  . Initialize edjanger.properties file from template edjanger.template ..."
    . {edjangerpath}/template.sh --properties=configuration.properties
  else
    source {edjangerpath}/_common.sh
    echo -e "  . File edjanger.${config_extension} is already in your current directory !"
    checkconfig
  fi
  if [ ! -d "build" ] && [ "{edjangerpath}" != "$PWD" ]; then
    echo -e "  . Initialize edjanger build folder for Dockerfile: /build ..."
    mkdir build/
  fi
  if [ ! -f "build/Dockerfile" ] && [ "{edjangerpath}" != "$PWD" ]; then
    echo -e "  . Initialize Dockerfile: build/Dockerfile ..."
    touch build/Dockerfile
  fi
fi

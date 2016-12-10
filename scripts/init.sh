#!/bin/bash
##  Description: create a edjanger project with following files
##  - edjanger.template (example)
##  - configuration.properties (example)
##  - build/Dockerfile (empty example)
##  File edjanger.properties is build with previous template and configuration files
##  with followinf command :
##  - edjangertemplate properties=configuration
##  
##  Usage:
##     @script.name [option]
##  
##  Options:
##     -h, --help                     print this documentation
##  
##         --template=TEMPLATE-NAME   initialize with the name of the template which could be chozen from the --templatelist option
##  
##         --templatelist             list of all available templates
##  
##  edjanger, The MIT License (MIT)
##  Copyright (c) 2016 copyright pamtrak06@gmail.com
##  
# ------------------------------------------------------------------------------
checkinstall=$(cat $0|grep -v checkinstall|grep "edjangerpath")
[ -n "$checkinstall" ]             && echo "edjanger:ERROR: Bad edjanger configuration, please run ./edjangerinstall.sh --alias from edjanger path" && exit -1

source {edjangerpath}/_common.sh

[[ -n "$@" ]]                      && externaloptions=$(echo $@ | sed "s|[[:space:]](.*)=(.*)|;$1=$2|g") \
                                   && externaloptions=$(echo $externaloptions | sed "s|[[:space:]]--|;--|g") \
                                   && externaloptions=$(echo $externaloptions | sed "s|[[:space:]]-|;-|g")

function initialize() 
{
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
  if [ ! -d "volumes" ] && [ "{edjangerpath}" != "$PWD" ]; then
    echo -e "  . Initialize edjanger shared volumes folder for Dockerfile: /volumes ..."
    mkdir volumes/
  fi
}

evalOptionsParameters $*

if [ -n "${help}" ]; then
  
  printHeader $0
  
else

  if [ -n "${template}" ]; then

    init_new_template ${template}
    
  elif [ -n "${templatelist}" ]; then
    
    print_template_list
    
  else
    
    if [ "$(ls -A .)" ]; then
      echo "edjanger:WARNING: directory is not empty" 
      exit 1 
    else
      initialize
    fi
    
  fi

fi

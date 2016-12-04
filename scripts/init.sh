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
##         --template=httpd           initialize with a "httpd" template
##  
##  edjanger, The MIT License (MIT)
##  Copyright (c) 2016 copyright pamtrak06@gmail.com
##  
# ------------------------------------------------------------------------------
checkinstall=$(cat $0|grep -v checkinstall|grep "edjangerpath")
[ -n "$checkinstall" ]             && echo "edjanger:ERROR: Bad edjanger configuration, please run ./edjangerinstall.sh --alias from edjanger path" && exit -1

source {edjangerpath}/_common.sh

[[ -n "$@" ]]                       && externaloptions=$(echo $@)

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
}

function templateHttpd() 
{
  echo "FROM httpd" > build/Dockerfile
  sed -e "s/\(image_name=\).*/\1\"test\/webserver\"/" configuration.properties > configuration.tmp  && mv configuration.tmp configuration.properties
  sed -e "s/\(container_name=\).*/\1\"webtest\"/" configuration.properties > configuration.tmp  && mv configuration.tmp configuration.properties
  sed -e "s/\(export app_exposed_ports=\)\".*\"/\1\"-p 80:80 -p 443:443\"/" configuration.properties > configuration.tmp  && mv configuration.tmp configuration.properties
  sed -e "s/\(export app_shared_volumes=\)\".*\"/\1\"-v \\\$PWD\/volumes\/html:\/usr\/local\/apache2\/htdocs -v \\\$PWD\/volumes\/logs:\/usr\/local\/apache2\/logs\"/" configuration.properties > configuration.tmp  && mv configuration.tmp configuration.properties
  sed -e "s/\(export app_environment_variables=\.*\)/#\1/" configuration.properties > configuration.tmp  && mv configuration.tmp configuration.properties
  sed -e "s/\(container_hostname=\.*\)/#\1/" edjanger.template > edjanger.template.tmp  && mv edjanger.template.tmp edjanger.template
  sed -e "s/\(environment_variables=\.*\)/#\1/" edjanger.template > edjanger.template.tmp  && mv edjanger.template.tmp edjanger.template
  . {edjangerpath}/template.sh --properties=configuration.properties
}

if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
  printHeader $0
else
  initialize
  if [[ "${externaloptions}" == *"template=httpd"* ]]; then
    templateHttpd
  fi
fi

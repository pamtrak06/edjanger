#!/bin/bash
##  Rename a container. File edjanger.properties must be present in path.
##  By default rename last container if no index specified.
##  
##  Usage:
##     @script.name [option]
##  
##  Options:
##     -h, --help                     print this documentation
##  
##         --index=INDEX              index of the container name
##  
##         --name=NAME                new name of the container.
##  
##  Parameters (edjanger.properties):
##     container_name                 container name
##     docker_command                 show docker command when edjanger is used
##     rename_options                 \"docker rename\" options to a running container
##  
##  edjanger, The MIT License (MIT)
##  Copyright (c) 2016 copyright pamtrak06@gmail.com
##  
# ------------------------------------------------------------------------------
###
### External options:
###    -h, --help                     print this documentation
###
###        --index=INDEX              index of the container name
###
### Internal options:
###
###        --scriptname=SCRIPT        name of the main script
###
###        --commandline=COMMAND      name of the docker command to execute
###
###        --commandcomment=COMMAND   printed comment of the command to execute
###
###        --commandoptions=OPTIONS   options read in the edjanger.properties
###
# ------------------------------------------------------------------------------
source {edjangerpath}/_common.sh

read_app_properties

# check required configuration
[ -z "${container_name}" ]          && echo "Container name must be filled, configure variable container_name in edjanger.${config_extension}" && exit -1

[ -n "${rename_options}" ]          && commandoptions="${commandoptions} ${rename_options}"
[ -n "${commandoptions}" ]          && commandoptions="--commandoptions=\"${commandoptions}\""
confirm_question="Container \"{container_name}\" will be renamed, do you want to continue (y/n) ?"
dockerbasiccontainer "--scriptname=\"$0\";--commandline=\"rename {container_name}\";--commandcomment=\"Renaming container: {container_name}...\";${commandoptions};--confirm;--confirmquestion=\"$confirm_question\";$@"


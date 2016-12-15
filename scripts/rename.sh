#!/bin/bash
##  Description
##     Rename a container.
#      
##     Filtered by edjanger.properties$container_name.
##     File edjanger.properties must be present in path.
##     By default executed on last container if no index specified.
##  
##  Usage
##    @script.name[option]
##  
##  Options
##     -h, --help
##            Display help.
##  
##         --index=INDEX
##            Index of the container name.
##  
##         --name=NAME
##            New name of the container.
##  
##  Parameters (edjanger.properties):
##     container_name
##            Container name.
##  
##     docker_command
##            Display docker command.
##  
##     rename_options
##            Options of "docker rename" for a running container (see docker 
##            rename --help).
##  
##  Licence & authors
##     edjanger, The MIT License (MIT)
##     Copyright (c) 2016 copyright pamtrak06@gmail.com
##  
# ------------------------------------------------------------------------------
###
### External options:
##     -h, --help
##            Display help.
###
###        --index=INDEX
###            Index of the container name.
###
### Internal options:
###
###        --scriptname=SCRIPT
###            Name of the main script.
###
###        --commandline=COMMAND
###            Name of the docker command to execute.
###
###        --commandcomment=COMMAND
###            Printed comment of the command to execute.
###
###        --commandoptions=OPTIONS
###            Options read in the edjanger.properties.
###
# ------------------------------------------------------------------------------
source {edjangerpath}/_common.sh

read_app_properties

# check required configuration
[ -z "${container_name}" ]          && echo "Container name must be filled, configure variable container_name in edjanger.${config_extension}" && exit -1

[ -n "${rename_options}" ]          && commandoptions="${commandoptions} ${rename_options}"
[ -n "${container_name}" ]          && commandoptions="${commandoptions} {container_name}"
[ -n "${commandoptions}" ]          && commandoptions="--commandoptions=\"${commandoptions}\""
confirm_question="Container \"{container_name}\" will be renamed, do you want to continue (y/n) ?"
dockerbasiccontainer "--scriptname=\"$0\";--commandline=\"rename\";--commandcomment=\"Renaming container: {container_name}...\";${commandoptions};--confirm;--confirmquestion=\"$confirm_question\";$@"


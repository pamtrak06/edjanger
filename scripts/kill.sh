#!/bin/bash
##  Description 
##    Kill one or more running containers.
##     
##    Filtered by edjanger.properties$container_name.
##    File edjanger.properties must be present in path.
##    By default executed on last container if no index specified.
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
##  Parameters (edjanger.properties):
##     container_name
##            Container name.
##  
##     docker_command
##            Display docker command.
##  
##     kill_options
##            Options of "docker kill" for a running container (see docker kill 
##            --help).
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

[ -n "${kill_options}" ]            && commandoptions="${commandoptions} ${kill_options}"
[ -n "${container_name}" ]          && commandoptions="${commandoptions} {container_name}"
[ -n "${commandoptions}" ]          && commandoptions="--commandoptions=\"${commandoptions}\""
confikill_question="Container \"{container_name}\" will be pekillanently erased, do you want to continue (y/n) ?"
dockerbasiccontainer "--scriptname=\"$0\";--commandline=\"kill -f\";--commandcomment=\"Kill container: {container_name}...\";${commandoptions};--confikill;--confikillquestion=\"$confikill_question\";$@"


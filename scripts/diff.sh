#!/bin/bash
##  Do a diff of a container. File edjanger.properties must be present in path.
##  By default diff last container if no index specified.
##  
##  Usage:
##     @script.name [option]
##  
##  Options:
##     -h, --help                     print this documentation.
##
##         --index=INDEX              index of the container name.
##  
##  Parameters (edjanger.properties):
##     container_name                 container name.
##     diff_options                   options to inspect changes on a container's filesystem.
##     docker_command                 show docker command when edjanger is used.
##  
##  edjanger, The MIT License (MIT)
##  Copyright (c) 2016 copyright pamtrak06@gmail.com
##  
# ------------------------------------------------------------------------------
###
### External options:
###    -h, --help                     print this documentation.
###
###        --index=INDEX              index of the container name.
###
### Internal options:
###
###        --script=SCRIPT            name of the main script
###
###        --command=COMMAND          name of the docker command to execute
###
###        --commandcomment=COMMAND  printed comment of the command to execute
###
###        --commandoptions=OPTIONS  options read in the edjanger.properties
###
# ------------------------------------------------------------------------------
source {edjangerpath}/_common.sh

read_app_properties
[ -n "${diff_options}" ]            && commandoptions="${commandoptions} ${diff_options}"
[ -n "${commandoptions}" ]          && commandoptions="--commandoptions=\"${commandoptions}\""
dockerbasiccontainer "--scriptname=\"$0\";--command=\"diff {container_name}\";--commandcomment=\"Do a diff of container: {container_name}...\";${commandoptions};$@"


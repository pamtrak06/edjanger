#!/bin/bash
##  Kill a container. File edjanger.properties must be present in path.
##  By default delete last container if no index specified.
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
##     kill_options                   other kill options.
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

[ -n "${kill_options}" ]            && commandoptions="${commandoptions} ${kill_options}"
[ -n "${commandoptions}" ]          && commandoptions="--commandoptions=\"${commandoptions}\""
confikill_question="Container \"{container_name}\" will be pekillanently erased, do you want to continue (y/n) ?"
dockerbasiccontainer "--scriptname=\"$0\";--command=\"kill -f {container_name}\";--commandcomment=\"Kill container: {container_name}...\";${commandoptions};--confikill;--confikillquestion=\"$confikill_question\";$@"


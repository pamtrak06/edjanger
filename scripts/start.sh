#!/bin/bash
##  Start a container. File edjanger.properties must be present in path.
##  By default start last container if no index specified.
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
##     start_options                  other start options.
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

# if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
#   dockerbasiccontainer --help --command="start"
# else
#   index=$([ -n "$1" ] && echo -e "$1")
#   [ "$index" != *"index"* ] && echo -e "edocker:ERROR: argument must be --index=[container index number]" && return -1
#   commandoptions=$([ -n "${start_options}" ] && echo -e "--command-options=\"${start_options}\"")
#   dockerbasiccontainer --script="$0" --command="start" --command-comment="Starting container: " ${commandoptions} ${index}
# fi
# extract script name
#scriptname=$(echo $*|$SED_REGEX -n 's/^.*--scriptname=(.+)\s*.*/\1/p'|cut -d ' ' -f1)
#[ -z "$scriptname " ] && echo -e "edjanger:ERROR: script filename unidentified" && return -1
#shift

# # parse options
# unset index
# . {edjangerpath}/_options.sh $0 $* || return -1
# echo "index2: $index"
# unset index
# echo "index1: $index"

#dockerbasiccontainer --scriptname="$0" --command="start" --commandcomment='Starting-container:-' ${commandoptions} $@
commandoptions=$([ -n "${start_options}" ] && echo -e "--commandoptions=\"${start_options}\"")
dockerbasiccontainer "--scriptname=\"$0\";--command=\"start {container_name}\";--commandcomment=\"Start container: {container_name}...\";--commandoptions=\"${start_options}\";$@"
#dockerbasiccontainer "--scriptname=$0;--command=start;--commandcomment=Starting container: ;--commandoptions=${start_options};$@"

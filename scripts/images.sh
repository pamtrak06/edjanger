#!/bin/bash
# ------------------------------------------------------------------------------
##  Description: list images. Filtered by $image_name
##  File edjanger.properties must be present in path.
##  By default executed on last container if no index specified.
##  
##  Usage:
##     @script.name [option]
##  
##  Options:
##     -h, --help                     print this documentation
##  
##  Parameters (edjanger.properties):
##     docker_command                 print docker command
##     image_name                     image name
##     images_options                 "docker images" options to a running container (see docker images --help)
##  
##  edjanger, The MIT License (MIT)
##  Copyright (c) 2016 copyright pamtrak06@gmail.com
##  
# ------------------------------------------------------------------------------
###
### External options:
###    -h, --help                     print this documentation
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
checkinstall=$(cat $0|grep -v checkinstall|grep "edjangerpath")
[ -n "$checkinstall" ]             && echo "edjanger:ERROR: Bad edjanger configuration, please run ./edjangerinstall.sh --alias from edjanger path" && exit -1

source {edjangerpath}/_common.sh

read_app_properties

# check required configuration
[ -z "${image_name}" ]              && echo "Image name must be filled, configure variable image_name in edjanger.${config_extension}" && exit -1

[ -n "${images_options}" ]          && commandoptions="${commandoptions} ${images_options}"
[ -n "${image_name}" ]              && commandoptions="${commandoptions} ${image_name}"
[ -n "${commandoptions}" ]          && commandoptions="--commandoptions=\"${commandoptions}\""
[ -n "$@" ]                         && externaloptions=$(echo $@ | sed "s|[[:space:]](.*)=(.*)|;$1=$2|g") \
                                    && externaloptions=$(echo $externaloptions | sed "s|[[:space:]]--|;--|g") \
                                    && externaloptions=$(echo $externaloptions | sed "s|[[:space:]]-|;-|g")
dockerbasicimage "--scriptname=\"$0\";--commandline=\"images\";--commandcomment=\"List image which name contains: {image_name}...\";${commandoptions};${externaloptions}"


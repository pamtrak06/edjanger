#!/bin/bash
##  Tag an image with repository/tag syntax expecteds.
##  File edjanger.properties must be present in path.
##  
##  Usage:
##     @script.name [option]
##  
##  Options:
##     -h, --help                     print this documentation
##  
##         --tag=TAG                  index of the container name
##  
##  Parameters (edjanger.properties):
##     container_name                 container name
##     tag_options                    \"docker tag\" options to a running container
##     docker_command                 show docker command when edjanger is used
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
[ -z "${image_name}" ]                         && echo "Image name must be filled, configure variable image_name in edjanger.${config_extension}" && exit -1

[ -n "${tag_options}" ]             && commandoptions="${commandoptions} ${tag_options}"
#[ -n "${image_name}" ]              && commandoptions="${commandoptions} ${image_name}"
[ -n "$@" ]                         && externaloptions=$(echo $@ | sed "s|[[:space:]]--|;--|g") \
                                    && externaloptions=$(echo $@ | sed "s|[[:space:]]-|;-|g")
confirm_question="Image \"{image_name}\" will be tagged, do you want to continue (y/n) ?"
dockerbasicimage "--scriptname=\"$0\";--commandline=\"tag {image_name}\";--commandcomment=\"Tag image: {image_name}...\";${commandoptions};--confirm;--confirmquestion=\"$confirm_question\";${externaloptions}"


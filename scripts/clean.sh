#!/bin/bash
# ------------------------------------------------------------------------------
##  Run command "docker rmi" with parameters read from edjanger.properties
##  Delete images: with attribute name=\"none\"
##  
##  Usage:
##     @script.name [option]
##  
##  Options:
##     -h, --help                     print this documentation
##  
##  Parameters (edjanger.properties):
##     force_rmi                      path where is found Dockerfile and its dependencies
##     image_name                     image name
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
source {edjangerpath}/_common.sh

read_app_properties

# check required configuration
[ -z "${image_name}" ]                         && echo "edjanger:ERROR: Image name must be filled, configure variable image_name in edjanger.${config_extension}" && exit -1
imagesnone=$(docker images --format="{{.Repository}} {{.ID}}" | grep -e '.none..[a-zA-Z0-9_].*'| awk '{print $2}')
[ -z "${imagesnone}" ]                         && echo "edjanger:WARN: No images with attribute name=\"none\" to delete" && exit 0

[ -n "${force_rmi}" ]                          && commandoptions="${commandoptions} ${force_rmi}"
[ -n "${imagesnone}" ]                         && commandoptions=${commandoptions} ${imagesnone}
[ -n "${commandoptions}" ]                     && commandoptions="--commandoptions=\"${commandoptions}\""
echo "commandoptions:${commandoptions}"
[ -n "$@" ]                                    && externaloptions=$(echo $@ | sed "s|[[:space:]](.*)=(.*)|;$1=$2|g") \
                                               && externaloptions=$(echo $externaloptions | sed "s|[[:space:]]--|;--|g") \
                                               && externaloptions=$(echo $externaloptions | sed "s|[[:space:]]-|;-|g")
confirm_question="Image with attribute name=\"none\" will be permanently erased, do you want to continue (y/n) ?"
dockerbasicimage "--scriptname=\"$0\";--commandline=\"rmi\";--commandcomment=\"Delete images: with attribute name=\"none\"...\";${commandoptions};--confirm;--confirmquestion=\"$confirm_question\";${externaloptions}"


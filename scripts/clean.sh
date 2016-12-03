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
##         --force                    force to delete images
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
###        --confirm                  ask for a confirmation before execute
###  
###        --confirmquestion=QUESTION question for the execution's confirmation
###  
###        --noneedsofproperties      no needs of edjanger.properties in path
###  
# ------------------------------------------------------------------------------
source {edjangerpath}/_common.sh

# check required configuration
imagesnone=$(docker images --format="{{.Repository}} {{.ID}}" | grep -e '.none..[a-zA-Z0-9_].*'| awk '{print $2}')
[ -z "${imagesnone}" ]                         && echo "edjanger:WARN: No images with attribute name=\"none\" to delete" && exit 0

[ -n "${imagesnone}" ]                         && commandoptions=${commandoptions} ${imagesnone}
[ -n "${commandoptions}" ]                     && commandoptions="--commandoptions=\"${commandoptions}\""
[ -n "$@" ]                                    && externaloptions=$(echo $@ | sed "s|[[:space:]](.*)=(.*)|;$1=$2|g") \
                                               && externaloptions=$(echo $externaloptions | sed "s|[[:space:]]--|;--|g") \
                                               && externaloptions=$(echo $externaloptions | sed "s|[[:space:]]-|;-|g")
confirm_question="Image with attribute name=\"none\" will be permanently erased, do you want to continue (y/n) ?"
dockerbasicimage "--scriptname=\"$0\";--noneedsofproperties;--commandline=\"rmi\";--commandcomment=\"Delete images: with attribute name=\"none\"...\";${commandoptions};--confirm;--confirmquestion=\"$confirm_question\";${externaloptions}"


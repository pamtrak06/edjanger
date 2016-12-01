#!/bin/bash
# ------------------------------------------------------------------------------
##  Run command "docker build" with parameters read from edjanger.properties
##  
##  Usage:
##     @script.name [option]
##  
##  Options:
##     -h, --help                     print this documentation
##  
##  Parameters (edjanger.properties):
##     build_args                     build arguments
##     build_forcerm                  always remove intermediate containers
##     build_rm                       remove intermediate containers after a successful build
##     build_nocache                  do not use cache when building the image
##     build_file                     name of the Dockerfile (Default is 'CURRENT PATH/Dockerfile')
##     build_path                     path where is found Dockerfile and its dependencies
##     docker_command                 show docker command when edjanger is used
##     image_name                     image name
##  
##  Environement:
##     proxy_args                     proxy variables (HTTP_PROXY,HTTPS_PROXY,http_proxy,https_proxy) read from proxy.zip or environment
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
[ ! -d "${build_path}" ]                       && echo "Build path must exist and be a folder, configure variable build_path in edjanger.${config_extension}" && exit -1
[ -z "${image_name}" ]                         && echo "Image name must be filled, configure variable image_name in edjanger.${config_extension}" && exit -1

. {edjangerpath}/_proxy.sh
build_arguments="${proxy_args} ${build_args}"

[ -n "${build_arguments}" ]                    && commandoptions="${commandoptions} ${build_arguments}"
[ -n "${build_forcerm}" ]                      && commandoptions="${commandoptions} ${build_forcerm}"
[ -n "${build_rm}" ]                           && commandoptions="${commandoptions} ${build_rm}"
[ -n "${build_nocache}" ]                      && commandoptions="${commandoptions} ${build_nocache}"
[ -n "${build_file}" ]                         && commandoptions="${commandoptions} ${build_file}"
[ -n "${build_path}" ]                         && commandoptions="${commandoptions} ${build_path}"
[ -n "${commandoptions}" ]                     && commandoptions="--commandoptions=\"${commandoptions}\""
[ -n "$@" ]                                    && externaloptions=$(echo $@ | sed "s|[[:space:]]--|;--|g") \
                                               && externaloptions=$(echo $@ | sed "s|[[:space:]]-|;-|g")
dockerbasicimage "--scriptname=\"$0\";--commandline=\"build -t {image_name}\";--commandcomment=\"Build image: {image_name}...\";${commandoptions};${externaloptions}"

build_arguments=""
. {edjangerpath}/_proxy_reset.sh


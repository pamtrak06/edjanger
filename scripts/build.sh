#!/bin/bash
# ------------------------------------------------------------------------------
##  Description Build an image from a Dockerfile. Use $image_name and $container_name.
##     File edjanger.properties must be present in path.
##
##  Usage
##    @script.name[option]
##  
##  Options
##     -h, --help
##            Display help.
##  
##  Parameters (edjanger.properties):
##     build_args
##            Build arguments.
##  
##     build_forcerm
##            Always remove intermediate containers.
##  
##     build_rm
##            Remove intermediate containers after a successful build.
##  
##     build_nocache
##            Do not use cache when building the image.
##  
##     build_file
##            Name of the Dockerfile (Default is 'CURRENT PATH/Dockerfile').
##  
##     build_path
##            Path where is found Dockerfile and its dependencies.
##  
##     build_options
##            All the other build build options (see docker build --help).
##  
##     docker_command
##            Display docker command.
##  
##     image_name
##            Image name.
##  
##  Environement:
##     proxy_args
##            Get proxy variables (HTTP_PROXY,HTTPS_PROXY,http_proxy,https_proxy) 
##            from environment or read it from proxy.zip.
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
checkinstall=$(cat $0|grep -v checkinstall|grep "edjangerpath")
[ -n "$checkinstall" ]                        && echo "edjanger:ERROR: Bad edjanger configuration, please run ./edjangerinstall.sh --alias from edjanger path" && exit -1

source {edjangerpath}/_common.sh

read_app_properties

# check required configuration
[ -n "${build_path}" ] && \
  [ ! -d "${build_path}" ]                     && echo "Build path must exist and be a folder, configure variable build_path in edjanger.${config_extension}" && exit -1
[ -z "${build_path}" ]                         && build_path="."
[ -z "${image_name}" ]                         && echo "Image name must be filled, configure variable image_name in edjanger.${config_extension}" && exit -1

. {edjangerpath}/_proxy.sh
build_arguments="${proxy_args} ${build_args}"

[ -n "${build_arguments}" ]                    && commandoptions="${commandoptions} ${build_arguments}"
[ -n "${build_forcerm}" ]                      && commandoptions="${commandoptions} ${build_forcerm}"
[ -n "${build_rm}" ]                           && commandoptions="${commandoptions} ${build_rm}"
[ -n "${build_nocache}" ]                      && commandoptions="${commandoptions} ${build_nocache}"
[ -n "${build_file}" ]                         && commandoptions="${commandoptions} ${build_file}"
[ -n "${build_path}" ]                         && commandoptions="${commandoptions} ${build_path}"
[ -n "${build_options}" ]                      && commandoptions="${commandoptions} ${build_options}"
[ -n "${commandoptions}" ]                     && commandoptions="--commandoptions=\"${commandoptions}\""
[[ -n "$@" ]]                                  && externaloptions=$(echo $@ | sed "s|[[:space:]](.*)=(.*)|;$1=$2|g") \
                                               && externaloptions=$(echo $externaloptions | sed "s|[[:space:]]--|;--|g") \
                                               && externaloptions=$(echo $externaloptions | sed "s|[[:space:]]-|;-|g")
dockerbasicimage "--scriptname=\"$0\";--commandline=\"build -t {image_name}\";--commandcomment=\"Build image: {image_name}...\";${commandoptions};${externaloptions}"

build_arguments=""
. {edjangerpath}/_proxy_reset.sh


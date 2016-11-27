#!/bin/bash
# ------------------------------------------------------------------------------
##  Run command "docker build" with parameters read from edjanger.properties
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
##     image_name                     image name
##     proxy_args                     proxy variables (HTTP_PROXY,HTTPS_PROXY,http_proxy,https_proxy) read from proxy.zip or environment
##     build_args                     build arguments
##     build_forcerm                  always remove intermediate containers
##     build_rm                       remove intermediate containers after a successful build
##     build_nocache                  do not use cache when building the image
##     build_file                     name of the Dockerfile (Default is 'CURRENT PATH/Dockerfile')
##     build_path                     path where is found Dockerfile and its dependencies
##  
##  edjanger, The MIT License (MIT)
##  Copyright (c) 2016 copyright pamtrak06@gmail.com
##  
# ------------------------------------------------------------------------------
source {edjangerpath}/_common.sh

if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
  #usage $0 build
  printHeader $0
else
  rename_edocker_properties
  if [ ! -f edjanger.${config_extension} ]; then
    echo -e "edjanger:ERROR No edjanger.${config_extension} available, use \"<edjangerinit>\" command to initialize one in this directory"
  else
    read_app_properties
    echo build image_name: ${image_name}...
    if [ ! -d ${build_path} ]; then
      echo "Build path must exist and be a folder, configure variable build_path in edjanger.${config_extension}"
    else
      . {edjangerpath}/_proxy.sh
      build_arguments="${proxy_args} ${build_args}"
      docker build -t "${image_name}" ${build_arguments} ${build_forcerm} ${build_rm} ${build_nocache} ${build_file} ${build_path}
      if [ "true" = "${docker_command}" ]; then
        echo -e "> Executed docker command:"
        echo -e "> docker build -t \"${image_name}\" ${build_arguments} ${build_forcerm} ${build_rm} ${build_nocache} ${build_file} ${build_path}"
      fi
      build_arguments=""
      . {edjangerpath}/_proxy_reset.sh
    fi
  fi
fi

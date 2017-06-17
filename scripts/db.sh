#!/bin/bash
##  Description
##   Manage edjanger projects localization (build, list).
##  
##  Usage
##    @script.name[option]
##  
##  Options
##     -h, --help
##            Display help.
##  
##         --build
##            Find edjanger.properties in current path and update
##            a kv database in folder {edjangerpath}/.kv-bash.
##  
##         --clear
##            Clear database. Must be used with option --build.
##  
##         --path=PATH_TO_PROCESS
##            Path where to find edjanger.properties files. Must be used with 
##            option --build.
##  
##         --list
##            Print list of kv database wich contains edjanger.properties paths
##  
##  Licence & authors
##     edjanger, The MIT License (MIT)
##     Copyright (c) 2016 copyright pamtrak06@gmail.com
##  
# ------------------------------------------------------------------------------
source {edjangerpath}/_common.sh
source {edjangerpath}/_kvbash.sh

if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then

  printHeader $0
  
else
  
  [[ -n "$@" ]]                                  && externaloptions=$(echo $@ | sed "s|[[:space:]](.*)=(.*)|;$1=$2|g") \
                                                 && externaloptions=$(echo $externaloptions | sed "s|[[:space:]]--|;--|g") \
                                                 && externaloptions=$(echo $externaloptions | sed "s|[[:space:]]-|;-|g")
  
  evalOptionsParameters $externaloptions
  
  if [ -z "${build}" ] && [ -z "${list}" ]; then
    
    echo -e "edjanger:ERROR option \"build\" or \"list\" must be defined, usage:"
    printHeader $0
    exit 1
    
  fi

  if [ -n "${build}" ]; then
    
    [ -z "${path}" ]  && path=$PWD
    [ -n "${clear}" ] && kvclear
    
    echo -e "Process path: $path, key would be [root folder name]---[image name]---[container name]---[CRC+CKPATH]\n"
    
    listedj=$(find ${path} -name "edjanger.properties")
    
    for edj in ${listedj}; do
      
      edj=${edj//\/\//\/}
      
      image=$(cat $edj | grep -v "#" | grep "image_name")
      image=${image#*=}
      image=${image%\"}
      image=${image#\"}
      image=${image//\//\_}
      
      container=$(cat $edj | grep -v "#" | grep "container_name")
      container=${container#*=}
      container=${container%\"}
      container=${container#\"}
      
      proj=$(basename $(dirname $edj))

      crc=$(cksum $edj)
      crc=$(echo $crc | awk '{print $1$2}')
      echo $edj > $TMPDIR/edjanger.tmp; 
      ckpath=$(cksum $TMPDIR/edjanger.tmp)
      rm -f $TMPDIR/edjanger.tmp;
      ckpath=$(echo $ckpath | awk '{print $1$2}')
      crc=$(echo $crc-$ckpath)
      #crc=${crc// /}
      key=$(echo "${proj}---${image}---${container}---${crc}")

      unset -v value
      value=$(kvget ${key})
      
      echo "Process key: $key with path: $edj..."
      
      if [ -z "$value" ]; then
        
        [ "$debug" = "true" ] \
          && echo -e "  edjanger:INFO: update key: $key..."
          
        kvset ${key} ${edj}
        
      else
        
        echo -e "  edjanger:WARNING: key $key already exist"
        
      fi
      
    done
    
  elif [ -n "${list}" ]; then
    
    echo -e "Key format is [root folder name]---[image name]---[container name]---[CRC+CKPATH]\n"
    kvlist
    
  fi
  
fi


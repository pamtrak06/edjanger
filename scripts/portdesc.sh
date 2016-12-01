#!/bin/bash
# ------------------------------------------------------------------------------
##  Description of network port numbers for a given port number parameter
##  
##  Usage:
##     @script.name [option]
##  
##  Options:
##     -h, --help                       print this documentation
##  
##         --port=PORT                  index number of the port
##  
##  edjanger, The MIT License (MIT)
##  Copyright (c) 2016 copyright pamtrak06@gmail.com
##  
# ------------------------------------------------------------------------------
source {edjangerpath}/_common.sh

if [ -n "$1" ]; then
  if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
    printHeader $0
  else
    port=$1
    if [[ "${port}" = "--port="* ]]; then
      #echo "Eval parameter:${index#--}"
      eval "${port#--}"
      #port=${port#--}
    elif [[ "${port}" = "-port="* ]]; then
      #echo "Eval parameter:${index#-}"
      eval "${port#-}"
      #port=${port#-}
    elif [[ "${port}" = "port="* ]]; then
      #echo "Eval parameter:${index}"
      eval "${port}"
      #port=${port}
    else
      echo -e "edocker:ERROR: index parameter is required"
      printHeader $0
      exit -1
    fi
    #portvar=${port%%=*}
    #portval=${port##*=}
    #if [ "${portval}" -eq "${portval}" ]; then
    #  eval ${portvar}=\{portval}
    #else
    #  echo -e "edocker:ERROR: port port parameter must be an integer"
    #  printHeader $0
    #  return 1
    #fi
    echo -e "--- Port ${port} description"
    title="Service Name,Port Number,Transport Protocol,Description,Assignee,Contact,Registration Date,Modification Date,Reference,Service Code,Known Unauthorized Uses,Assignment Notes"
    ports=$(cat {edjangerpath}/service-names-port-numbers.csv | grep ",${port},")
    if [ -n "$ports" ]; then
      echo -e $title
      REFIFS=$IFS
      IFS=$'\n'
      for p in $ports; do
        echo "  $p"
      done
      IFS=$REFIFS
    else
      echo -e "  none"
    fi
  fi
else
  echo -e "Please set a port number with like --index=port"
fi

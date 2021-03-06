#!/bin/bash
# ------------------------------------------------------------------------------
##  Description
##    Print list of all available edjanger commands. 
##    Running command : "edjangerhelp"
##  
##    With parameter "config" or "parameters", print parameters read in 
##    edjanger.properties and used by each edjanger commands.
##    Running command : "edjangerhelp config"
##  
##    With parameter "[edjanger short command]", print help for this command. 
##    Examples : 
##      "edjangerhelp run"            => give help for edjangerrun
##      "edjangerhelp build"          => give help for edjangerbuild
##      ...
##  
##       "edjangerhelp edjangerrun"   => give help for edjangerrun
##       "edjangerhelp edjangerbuild" => give help for edjangerbuild
##      ...
##  
##  Usage
##    @script.name [option] [config | parameters]
##  
##  Options
##    config
##            Print parameters used by edjanger commands.
##  
##    [edjanger short command]
##            Print help for this edjanger command.
##  
##    -h, --help
##            Display help.
##  
##  Licence & authors
##     edjanger, The MIT License (MIT)
##     Copyright (c) 2016 copyright pamtrak06@gmail.com
##  
# ------------------------------------------------------------------------------
checkinstall=$(cat $0|grep -v checkinstall|grep "edjangerpath")
[ -n "$checkinstall" ]             && echo "edjanger:ERROR: Bad edjanger configuration, please run ./edjangerinstall.sh --alias from edjanger path" && exit -1

source {edjangerpath}/_common.sh

if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
  printHeader $0
else
  aliascmd=$1
  usage $0 ${aliascmd#edjanger}
fi

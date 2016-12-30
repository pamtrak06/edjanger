#!/bin/bash
##  Description
##    create a edjanger project with following files
##      - edjanger.template (example)
##      - configuration.properties (example)
##      - build/Dockerfile (empty example)
##  
##    File edjanger.properties is build with previous template and configuration 
##    files with following command :
##      - edjangertemplate configure=configuration
##  
##  Usage
##    @script.name[option]
##  
##  Options
##     -h, --help
##            Display help.
##  
##         --template=TEMPLATE-NAME
##            Initialize with the name of the template which could be chozen 
##            from the --templatelist option.
##  
##         --fromcommand
##            Initialize edjanger repositories and create *.properties from 
##            *.docker commands files present in path. 
##  
##         --templatelist
##            Display a comapct list of all available templates.
##  
##         --templatelistinfo
##            Display a list of all available templates with details.
##  
##  Command lines example:
##  
##  Help:
##     edjangerinit --help
##            Dispay help.
##
##  Initialize a new template from local archive:
##     edjangerinit --template=demo_httpd
##            initialize a new template from the archive given by option --init.
##  
##  Initialize a new template from run file:
##     edjangerinit --fromcommand=demo_httpd
##            Initialize a new template from the all *.run files at current path,
##            which contains single docker run command : 
##              type=dockerfile,build=[dockerfile git repository]),
##            or contains compose file :
##              type=compose,build=[dockerfile git repository]
##  
##  Print templates list:
##     edjangerinit --templatelist
##            Print the list off all stored templates with short name only.
##  
##  Print templates list:
##     edjangerinit --templatelistinfo
##            Print the list off all stored templates with detailed informations.
##  
##  Licence & authors
##     edjanger, The MIT License (MIT)
##     Copyright (c) 2016 copyright pamtrak06@gmail.com
##  
# ------------------------------------------------------------------------------
checkinstall=$(cat $0|grep -v checkinstall|grep "edjangerpath")
[ -n "$checkinstall" ]             && echo "edjanger:ERROR: Bad edjanger configuration, please run ./edjangerinstall.sh --alias from edjanger path" && exit -1

source {edjangerpath}/_common.sh

[[ -n "$@" ]]                      && externaloptions=$(echo $@ | sed "s|[[:space:]](.*)=(.*)|;$1=$2|g") \
                                   && externaloptions=$(echo $externaloptions | sed "s|[[:space:]]--|;--|g") \
                                   && externaloptions=$(echo $externaloptions | sed "s|[[:space:]]-|;-|g")

evalOptionsParameters $*

if [ -n "${help}" ]; then
  
  printHeader $0
  
else
  
  if [ -n "${template}" ]; then

    init_new_template ${template}
    
  elif [ -n "${fromcommand}" ]; then
    
    init_new_template_from_command
    
  elif [ -n "${templatelist}" ]; then
    
    print_template_list false
    
  elif [ -n "${templatelistinfo}" ]; then
    
    print_template_list true
    
  else
    
    if [ "$(ls -A .)" ]; then
      
      echo "edjanger:WARNING: directory is not empty" 
      exit 1
      
    else
      
      initialize
      
    fi
    
  fi

fi

#!/bin/bash
# ------------------------------------------------------------------------------
##  Description: generate edjanger.poperties from edjanger.template
##  
##  Usage:
##     @script.name [option]
##  
##  Options:
##     -h, --help                     print this documentation
##  
##         --properties=CONFIG        properties file containing variables to be replaced in edjanger.template to create edjanger.properties
##  
##  edjanger, The MIT License (MIT)
##  Copyright (c) 2016 copyright pamtrak06@gmail.com
##  
# ------------------------------------------------------------------------------
checkinstall=$(cat $0|grep -v checkinstall|grep "edjangerpath")
[ -n "$checkinstall" ]             && echo "edjanger:ERROR: Bad edjanger configuration, please run ./edjangerinstall.sh --alias from edjanger path" && exit -1

source {edjangerpath}/_common.sh

function check_export_presence_from_properties()
{
  local properties=$1

  nbvar=$(cat $properties |grep "="| wc -l)
  nbexp=$(cat $properties |grep "export"| wc -l)

  if [ "$nbvar" = "$nbexp" ]; then
    check_export_presence_from_properties=true;
  else
    echo -e "edjanger:ERROR one or several \"export\" command are absent(s) in the previous properties, please fix it"
    echo -e "  - variable declaration must have this form: \"export <variable name>=<value>\""
    echo -e "  - content of the previous properties:"
    while read line; do echo -e "\t\t$line"; done < $properties
    check_export_presence_from_properties=false;
  fi
}

function create_edjanger_properties()
{
  # command=$1

  unsetOptionsParameters
  evalOptionsParameters "$*"

  if [ -n "${help}" ]; then
    printHeader $0
  else

  # if [[ ! "$command" == *"properties="* ]]; then
  #   echo -e "edjanger:ERROR no properties argument setted, usage:"
  #   printHeader $0
  #   return 1
  # else
  #   if [[ "${command}" = "--"*"="* ]]; then
  #     configuration=${command##--properties=}
  #   elif [[ "${command}" = "-"*"="* ]]; then
  #     configuration=${command##-properties=}
  #   elif [[ "${command}" = *"="* ]]; then
  #     configuration=${command##properties=}
  #   else
  #     echo -e "edjanger:ERROR properties argument incorrectly setted, usage:"
  #     printHeader $0
  #     return 1
  #   fi
  # fi
  
    if [ -z "${properties}" ]; then
      echo -e "edjanger:ERROR properties must not be empty, usage:"
      printHeader $0
      return 1
    fi
    
    if [[ ! "${properties##*.}" == *"properties" ]]; then
      properties=${properties}.properties
    fi

    if [ "${properties}" = "edjanger" ]; then
      echo -e "edjanger:ERROR this name could not be used for this purpose. Please choose another one."
      return -1
    fi
    
    echo -e "> Initialize edjanger.properties from template and configuration file (${properties})..."

    # Retrieve all edjanger configuration files from current directory
    listconf=$(find . -name "edjanger.template")
    if [ -z "$listconf" ]; then
      echo -e "edjanger:ERROR No edjanger.template available recursively in this directory"
      return 1
    fi

    for template in ${listconf[@]}
    do

      echo -e "  . process template: \"${template}\"  ..."

      continueprocess=true

      working_directory=$(dirname ${template})
      propertieslocal=${working_directory}/${properties}

      # one main configuration file
      if [ -f "${properties}" ]; then

        echo -e "  . use main configuration file: \"${properties}\"  ..."
        check_export_presence_from_properties "${properties}"
        continueprocess=$?

      # one configuration file by edjanger.template
      elif [ -f "${propertieslocal}" ]; then

        echo -e "  . use local configuration file: \"${propertieslocal}\"  ..."
        check_export_presence_from_properties "${propertieslocal}"
        continueprocess=$?

      else

        continueprocess=false
        echo -e "edjanger:ERROR File configuration name must exist and be set as argument"

      fi

      if [ ${continueprocess} ]; then

        # replace variable from configuration file in template
        # if configuration file exist (global or local)
        if [ -f "${propertieslocal}" ]; then

          edjangerproperties=${template%.template}.properties

          # check if edjanger.properties exist
          if [ -f "${edjangerproperties}" ]; then

            echo -e "edjanger:WARNING edjanger properties file \"${edjangerproperties}\" already exist, do you want to replace it (y/n) ?"
            read response

            if [ "y" = "${response}" ]; then
              date_time=$(date +"%Y%m%d_%H%M%S")
              cp ${edjangerproperties} ${template%.template}_${date_time}.bak
              echo -e "  . create \"${edjangerproperties}\" file from template \"${template}\" and configuration file \"${propertieslocal}\""
              . ${propertieslocal} && envsubst < "${template}" | tee "${edjangerproperties}" > /dev/null
            fi

          # else create edjanger.properties
          else

            echo -e "  . create \"${edjangerproperties}\" file from template \"${template}\" and configuration file \"${propertieslocal}\""
            . ${propertieslocal} && envsubst < "${template}" | tee "${edjangerproperties}" > /dev/null

          fi
        # else configuration file doe not exist
        else
          echo -e "edjanger:ERROR properties file (${propertieslocal}) does not exist for template ${template}, edjanger.properties could not be created"
        fi

      else
        echo -e "edjanger:ERROR templating aborted, see previous reported errors"
      fi
    
    done
    
  fi
}

# if [[ "$1" =~ ^[-]*h[a-z]* ]] || [ "$1" = "-h" ]; then
#   printHeader $0
# else
  create_edjanger_properties $*
# fi

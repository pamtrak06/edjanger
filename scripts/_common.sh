#!/bin/bash
# ------------------------------------------------------------------------------
##  Description
##    Commons functions.
##  
##  Usage
##     source _common.sh
##  
##  Licence & authors
##     edjanger, The MIT License (MIT)
##     Copyright (c) 2016 copyright pamtrak06@gmail.com
##  
# ------------------------------------------------------------------------------
source {edjangerpath}/_options.sh
source {edjangerpath}/prefs.properties

config_extension=properties
app_name=edjanger
debug=false

if [[ "$OSTYPE" == "linux-gnu" ]]; then
        SED_REGEX="sed -r"
        ARCHIVE="tar -cf"
        ARCHIVE_APPEND="tar -rf"
elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
        SED_REGEX="sed -E"
        ARCHIVE="tar -cf"
        ARCHIVE_APPEND="tar -rf"
elif [[ "$OSTYPE" == "cygwin" ]]; then
        # POSIX compatibility layer and Linux environment emulation for Windows
        SED_REGEX="sed -r"
        ARCHIVE="tar -cf"
        ARCHIVE_APPEND="tar -rf"
elif [[ "$OSTYPE" == "msys" ]]; then
        # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
        SED_REGEX="sed -r"
        ARCHIVE="tar -cf"
        ARCHIVE_APPEND="tar -rf"
elif [[ "$OSTYPE" == "win32" ]]; then
        # I'm not sure this can happen.
        SED_REGEX="sed -r"
        ARCHIVE="tar -cf"
        ARCHIVE_APPEND="tar -rf"
elif [[ "$OSTYPE" == "freebsd"* ]]; then
        # ...
        SED_REGEX="sed -r"
        ARCHIVE="tar -cf"
        ARCHIVE_APPEND="tar -rf"
else
        # Unknown.
        SED_REGEX="sed -r"
        ARCHIVE="tar -cf"
        ARCHIVE_APPEND="tar -rf"
fi

# unset variables valid only if script is running in a subprocess (executed with bash)
function unsetOptionsParameters()
{
  parameterslist=$*
  IFS=';' read -ra parameters <<< "$parameterslist"
  for parameter in "${parameters[@]}"; do
    [[ "$debug" = "true" ]] && \
      echo "edjanger:DEBUG: Unset parameters from option:${parameter}"
    if [[ "${parameter}" = "--"*"="* ]]; then
      parameter=${parameter#--}
      [[ "$debug" = "true" ]] && \
        echo "edjanger:DEBUG: Unset parameter starting with \"--\": \"${parameter%%=*}\""
      unset -v "${parameter%%=*}"
    elif [[ "${parameter}" = "-"*"="* ]]; then
      parameter=${parameter#-}
      [[ "$debug" = "true" ]] && \
        echo "edjanger:DEBUG: Unset parameter starting with \"-\": \"${parameter%%=*}\""
      unset -v "${parameter%%=*}"
    elif [[ "${parameter}" = *"="* ]]; then
      [[ "$debug" = "true" ]] && \
        echo "edjanger:DEBUG: Unset parameter without prefix: \"${parameter%%=*}\""
      unset -v "${parameter%%=*}"
    elif [[ "$parameter" =~ ^[-]*help[a-z]* ]] || [ "$parameter" = "-h" ]; then
      unset -v help
    else
      if [ -n "${parameter#--}" ]; then
        parameter=${parameter#--}
        [[ "$debug" = "true" ]] && \
          echo "edjanger:DEBUG: Unset parameter starting with \"--\": \"${parameter%%=*}\""
        unset -v "${parameter%%=*}"
      elif [ -n "${parameter#-}" ]; then
        parameter=${parameter#-}
        [[ "$debug" = "true" ]] && \
          echo "edjanger:DEBUG: Unset parameter starting with \"-\": \"${parameter%%=*}\""
        unset -v "${parameter%%=*}"
      elif [ -n "${parameter}" ]; then
        [[ "$debug" = "true" ]] && \
          echo "edjanger:DEBUG: Unset parameter witout prefix: \"${parameter}\""
        unset -v "${parameter}"
      fi
    fi
  done
}

# eval parameters from all parametters given as argument of function
function evalOptionsParameters()
{
  unsetOptionsParameters $*
  # scriptname=$(echo $* | $SED_REGEX "s|.*--scriptname=\"(.+\.sh)\";.*|\1|g")
  # 
  # # Parse known options from documentation
  # if [[ -z ${options+defined} ]]; then
  #     parse_specifications $scriptname
  #     while read -r line; do
  #         case "$line" in
  #             "-h, --help"*)  continue ;;
  #             "--help, -h"*)  continue ;;
  #             -*," "--*)      option=$(echo "$line" | awk -F'(^-|, --| )'  '{ print $2"="$3 }') ;;
  #             --*," "-*)      option=$(echo "$line" | awk -F'(--|, -| )'   '{ print $3"="$2 }') ;;
  #             --*=*)          option=$(echo "$line" | awk -F'(--|=| )'     '{ print $2"=?" }') ;;
  #             --*" "*)        option=$(echo "$line" | awk -F'(--| )'       '{ print $2 }') ;;
  #             *)              continue ;;
  #         esac
  #         options+=("$option")
  #         echo "option:$option"
  #     done <<< "$specifications"
  # fi
  # 
  # options+=(h=help)
  # 
  # # tranform user input from -- to ;--,so it could be parsed
  # # only for options specified in header which begin with "###"
  # parameterslist=$*
  # IFS=';' read -ra parameters <<< "$parameterslist"
  # for parameter in "${parameters[@]}"; do
  #   for option in "${options[@]}"; do
  #     if [[ "${parameter#--}" = *"${option%?}"* ]]; then
  #       arguments+=("${!index}")
  #       parameterslist2=$(echo ${parameterslist2} | sed "s|[[:space:]]--|;--|g")
  #     fi
  #   done
  # done
  
  # TODO authorize only presents in header specification and documentation
  parameterslist=$*
  #parameterslist=$(echo ${parameterslist} | sed "s|[[:space:]]--|;--|g")
  #echo "parameterslist:${parameterslist}"
  
  IFS=';' read -ra parameters <<< "$parameterslist"
  for parameter in "${parameters[@]}"; do
      [[ "$debug" = "true" ]] && \
        echo "edjanger:DEBUG: parameter:${parameter}"
      if [[ "${parameter}" = *"rm[[:space:]]"* ]]; then
        #echo "edocker:ERROR: parameter rm evaluation not allowed: ${parameter} !!!"
        exit -1
      elif [[ "${parameter}" = "--"*"="* ]]; then
        [[ "$debug" = "true" ]] && \
          echo "edjanger:DEBUG: Eval parameter starting with \"--\": \"${parameter#--}\""
        eval "${parameter#--}"
        #parameter=${parameter#--}
      elif [[ "${parameter}" = "-"*"="* ]]; then
        [[ "$debug" = "true" ]] && \
          echo "edjanger:DEBUG: Eval parameter starting with \"-\": \"${parameter#-}\""
        eval "${parameter#-}"
        #parameter=${parameter#-}
      elif [[ "${parameter}" = *"="* ]]; then
        [[ "$debug" = "true" ]] && \
          echo "edjanger:DEBUG: Eval parameter without prefix: \"${parameter}\""
        eval "${parameter}"
        #parameter=${parameter}
      elif [[ "$parameter" =~ ^[-]*help[a-z]* ]] || [ "$parameter" = "-h" ]; then
        help=true
      else
        if [ -n "${parameter#--}" ]; then
          [[ "$debug" = "true" ]] && \
            echo "edjanger:DEBUG: Set parameter \"${parameter#--}\" starting with \"--\" to true"
          eval "${parameter#--}=true" 
        elif [ -n "${parameter#-}" ]; then
          [[ "$debug" = "true" ]] && \
            echo "edjanger:DEBUG: Set parameter \"${parameter#-}\" starting with \"-\" to true"
          eval "${parameter#-}=true" 
        elif [ -n "${parameter}" ]; then
          [[ "$debug" = "true" ]] && \
            echo "edjanger:DEBUG: Set parameter \"${parameter}\" without prefix to true"
          eval "${parameter}=true" 
        fi
      fi
      #paramvar=${parameter%%=*}
      #paramval=${parameter##*=}
      #paramval=${paramval##\"}
      #paramval=${paramval%%\"}
      #echo "eval : paramvar:${paramvar}"
      #echo "eval : paramval:${paramval}"
      #eval "${paramvar}=${paramval}"
      
  done
}

# create a regex
function build_find_pattern()
{
  pattern=$1
  pattern=$(echo $pattern | tr -d ' ')
  pattern=$(echo $pattern | sed 's/[[:space:]]*,[[:space:]]*/\" -o -name \"/g')
  pattern=$(echo $pattern | sed 's/[[:space:]]*;[[:space:]]*/\" -o -name \"/g')
  pattern="\( -name \"$pattern\" \)"
}

function update_metadata_start()
{
  infofile=$1
  echo "configurations:" >> $infofile
}


function update_metadata_header()
{
  echo "# Writing metadata ..."
  
  infofile=$1
  echo "metadata:" >> $infofile
  echo -e "    timestamp:        $(date)" >> $infofile
  echo -e "    ostype:           $OSTYPE" >> $infofile
  echo -e "    kernel:           $(uname -r)" >> $infofile
  
  if [ "$(command -v lsb_release)" ]; then
    distribution=$(lsb_release -a 2> /dev/null | grep Description|awk -F ":" '{ print $2 }')
  fi
  if [[ -n "$distribution" ]]; then
    echo -e "    distribution:     $distribution" >> $infofile
  else
    [[ -f "/etc/debian_version" ]] \
      && distribution=$(cat /etc/debian_version) \
      && [[ -n "$distribution" ]] \
        && echo -e "    distribution:     $distribution" >> $infofile
    [[ -f "/etc/redhat-release" ]] \
      && [[ -z "$distribution" ]] \
      && distribution=$(cat /etc/redhat-release) \
      && echo -e "    distribution:     $distribution" >> $infofile
  fi
  
  echo "versions:" >> $infofile
  
  dockerversion=$(docker info | grep "Server Version:" | awk -F  ":" '{ printf $2}' | tr -d ' ')
  if [[ -n "$dockerversion" ]]; then
    echo -e "    docker:           $dockerversion" >> $infofile
  else
    echo -e "    docker:           undefined" >> $infofile
  fi
  
  dockermachineversion=$(docker-machine version)
  if [[ -n "$dockermachineversion" ]]; then
    dockermachineversion=$(echo ${dockermachineversion}| awk '{ printf $3" "$4}')
    dockermachineversion=$(echo ${dockermachineversion}| sed 's/^ *//;s/ *$//')
    echo -e "    docker-machine:   $dockermachineversion" >> $infofile
  else
    echo -e "    docker-machine:   undefined" >> $infofile
  fi
  
  dockercomposeversion=$(docker-compose version)
  if [[ -n "$dockercomposeversion" ]]; then
    
    composeversion=$(docker-compose version|grep "docker-compose version")
    composeversion=$(echo ${composeversion}| awk '{ printf $3" "$4" "$5}')
    composeversion=$(echo ${composeversion}| sed 's/^ *//;s/ *$//')
    echo -e "    docker-compose:   $composeversion" >> $infofile
    
    dockerpyversion=$(docker-compose version|grep "docker-py version")
    dockerpyversion=$(echo ${dockerpyversion}| awk -F  ":" '{ printf $2}')
    dockerpyversion=$(echo ${dockerpyversion}| sed 's/^ *//;s/ *$//')
    echo -e "    docker-py:        $dockerpyversion" >> $infofile
    
    cpythonversion=$(docker-compose version|grep "CPython version")
    cpythonversion=$(echo ${cpythonversion}| awk -F  ":" '{ printf $2}')
    cpythonversion=$(echo ${cpythonversion}| sed 's/^ *//;s/ *$//')
    echo -e "    cpython:          $cpythonversion" >> $infofile
    
    opensslversion=$(docker-compose version|grep "OpenSSL version")
    opensslversion=$(echo ${opensslversion}| awk -F  ":" '{ printf $2}')
    opensslversion=$(echo ${opensslversion}| sed 's/^ *//;s/ *$//')
    echo -e "    openssl:          $opensslversion" >> $infofile
    
  else
    echo -e "    docker-compose-version:    undefined" >> $infofile
  fi
  
}

function print_template_list()
{
  detailed=$1
  
  listzip=$(find $templates_path -name "*.zip")
  for zip in ${listzip[@]}
  do
    
    zipbase=$(basename ${zip})
    zipid=${zipbase%.*}
    echo "# Template \"${zipid}\""
    
    if $detailed; then
      unzip -c ${zip} $zipid.yaml | grep -v "Archive:" | grep -v "inflating:"
    else
      unzip -c ${zip} $zipid.yaml | grep -v "Archive:" | grep -v "inflating:" | grep "# Template" 
    fi
    
  done
}

function delete_template()
{
  template=$1
  
  zipfile=$templates_path/${template}.zip
  
  [ ! -f $zipfile ] \
      && echo "Template ${template}.zip does not exist in path \"$templates_path\"" \
      && exit 1
  
  zipbase=$(basename ${zipfile})
  zipid=${zipbase%.*}

  echo -e "${app_name}:WARNING template \"${template}\", will be definitively removed from database, do you confirm deletion (y/n)?"
  read response
  if [ "y" = "$response" ]; then
    rm -f $zipfile
  fi

}

function initialize() 
{
  echo -e "> Initialize edjanger project ..."
  if [ ! -f "edjanger.template" ] && [ "{edjangerpath}" != "$PWD" ]; then
    echo -e "  . Initialize edjanger template file example: edjanger.template ..."
    cp {edjangerpath}/templates/edjanger.template .
  else
    echo -e "  . File edjanger.template is already in your current directory !"
  fi
  if [ ! -f "configuration.${config_extension}" ] && [ "{edjangerpath}" != "$PWD" ]; then
    echo -e "  . Initialize edjanger configuration file example: configuration.${config_extension} ..."
    cp {edjangerpath}/templates/configuration.${config_extension} .
  else
    echo -e "  . File configuration.${config_extension} is already in your current directory !"
  fi
  if [ ! -f "edjanger.${config_extension}" ] && [ "{edjangerpath}" != "$PWD" ]; then
    echo -e "  . Initialize edjanger.properties file from template edjanger.template ..."
    . {edjangerpath}/template.sh --configure=configuration.properties
  else
    echo -e "  . File edjanger.${config_extension} is already in your current directory !"
    checkconfig
  fi
  if [ ! -d "build" ] && [ "{edjangerpath}" != "$PWD" ]; then
    echo -e "  . Initialize edjanger build folder for Dockerfile: /build ..."
    mkdir build/
  fi
  if [ ! -f "build/Dockerfile" ] && [ "{edjangerpath}" != "$PWD" ]; then
    echo -e "  . Initialize Dockerfile: build/Dockerfile ..."
    touch build/Dockerfile
  fi
  if [ ! -d "volumes" ] && [ "{edjangerpath}" != "$PWD" ]; then
    echo -e "  . Initialize edjanger shared volumes folder for Dockerfile: /volumes ..."
    mkdir volumes/
  fi
}

# if key value is space separated, retrieve the next item element
function retrieve_key_value_space_separated()
{
  key1=$1
  key2=$2

  flag=$element
  current=$element
  
  # if element not like key=value
  if [[ ! $element = *"="* ]]; then
  
    # get next element from command line
    next=$(echo "$cmdonline" | awk '{ printf $1 }')
    
    #if [[ ! $next = "-"* ]]; then
    if [[ ! $next = *"$key1="* ]] && [[ ! $next = *"$key2="* ]]; then

      [[ "$debug" = "true" ]] && \
        idelt=$(( $idelt + 1 )) && \
        echo -e "edjanger:DEBUG: second element $idelt:$next"
                                
      # remove next element from command line
      cmdonline=${cmdonline#*${next}}
      
      if [[ $current = "--"* ]]; then
      
        element="$flag="$next
        
      elif [[ $current = "-"* ]]; then
      
        element="$flag "$next
        
      fi
      
    else
    
      element=$current
      
    fi
    
  fi
}

function init_new_template_from_command()
{

  # retrieve files only in first level folder
  commands=$(find $current_path -maxdepth 1 -name "*${init_docker_extension}" -prune -type f)

  [ -z "${commands}" ] \
      && echo -e "edjanger:WARNING: No file *${init_docker_extension} present to be processed" \
      && return 1
  
  for command in ${commands[@]}
  do
    
    root_cmd=${command%${init_docker_extension}}
    
    if [ -d $root_cmd ]; then
    
      echo -e "edjanger:WARNING: directory ${root_cmd} already exist"
      
    else
      
      check=$(cat ${command} | grep "run")
      
      [ -z "$check" ] \
        && echo -e "edjanger:WARNING: file ${command} does not contain docker run command" \
        && return 1
      
      currentpath=$PWD
      command=$PWD/${command#\.\/}
      
      echo -e "Process ${command}..."
      
      mkdir $root_cmd && cd $root_cmd
      
      initialize
      
      unset -v shared_volumes
      unset -v volumes_from
      unset -v environment_variables
      unset -v exposed_ports
      unset -v published_ports
      unset -v run_other_options
      unset -v linked_containers
      unset -v container_name
      unset -v container_hostname
      unset -v image_name
      unset -v imagefound
      unset -v command_run
        
      cmdonline=$(cat ${command})
      [[ "$debug" = "true" ]] && \
        echo -e "edjanger:DEBUG: command raw:\n$cmdonline"
      cmdonline=$(echo ${cmdonline} | tr -d '\\' | tr "\r\n" " ")
      cmdonline=${cmdonline#*run -d}
      cmdonline=${cmdonline#*run -it}
      cmdonline=${cmdonline#*run -ti}
      cmdonline=${cmdonline#*run -i -t}
      cmdonline=${cmdonline#*run -t -i}
      cmdonline=${cmdonline#*run -i}
      cmdonline=${cmdonline#*run -t}
      cmdonline=${cmdonline#* -d }
      cmdonline=${cmdonline#* -i }
      cmdonline=${cmdonline#* -t }
      #cmdonline=${cmdonline#*run}
      [[ "$debug" = "true" ]] && \
        echo -e "edjanger:DEBUG: cmdonline one line:$cmdonline"
      
      # extract first element
      element=$(echo "$cmdonline" | awk '{ printf $1 }')
      cmdonline=${cmdonline#*${element}}
      
      nbelement=$(echo "$cmdonline" | awk '{ printf NF }')
      nbelement=$(( $nbelement + 1 ))
      [[ "$debug" = "true" ]] && \
        echo -e "edjanger:DEBUG: nb elements:$nbelement"
      idelt=$(( 1 ))

#      [[ "$debug" = "true" ]] && \
#        cmdonlineref=$cmdonline && \
#        while [ -n "$element" ]; do
#          [[ "$debug" = "true" ]] && \
#            echo -e "edjanger:DEBUG: element $idelt:$element"
#          element=$(echo "$cmdonline" | awk '{ printf $1 }')
#          idelt=$(( $idelt + 1 ))
#          cmdonline=${cmdonline#*${element}}
#        done && cmdonline=$cmdonlineref
      
      imagefound=false
      while [ -n "$element" ]; do
      
        [[ "$debug" = "true" ]] && \
          echo -e "edjanger:DEBUG: first element $idelt:$element"
      
        if [[ $element = *"--volume"* ]] || [[ $element = *"-v"* ]]; then
          retrieve_key_value_space_separated "--volume" "-v"
          shared_volumes+=$element" "
          [[ "$debug" = "true" ]] && \
            echo -e "edjanger:DEBUG: shared_volumes:$shared_volumes"
        elif [[ $element = *"--volumes-from"* ]]; then
          retrieve_key_value_space_separated "--volumes-from" ""
          volumes_from+=$element" "
          [[ "$debug" = "true" ]] && \
            echo -e "edjanger:DEBUG: volumes_from:$volumes_from"
        elif [[ $element = *"--link"* ]]; then
          retrieve_key_value_space_separated "--link" ""
          linked_containers+=$element" "
          [[ "$debug" = "true" ]] && \
            echo -e "edjanger:DEBUG: linked_containers:$linked_containers"
        elif [[ $element = *"--expose"* ]]; then
          retrieve_key_value_space_separated "--expose"
          exposed_ports+=$element" "
          [[ "$debug" = "true" ]] && \
            echo -e "edjanger:DEBUG: exposed_ports:$exposed_ports"
        elif [[ $element = *"--publish"* ]] || [[ $element = "-p"* ]]; then
          retrieve_key_value_space_separated "--publish" "-p"
          published_ports+=$element" "
          [[ "$debug" = "true" ]] && \
            echo -e "edjanger:DEBUG: published_ports:$published_ports"
        elif [[ $element = *"--env"* ]] || [[ $element = "-e"* ]]; then
          # for env, variable could contain equal : e.g.: -e "GF_SERVER_ROOT_URL=http://grafana.server.name"
          retrieve_key_value_space_separated "--env" "-e"
          environment_variables+=$element" "
          [[ "$debug" = "true" ]] && \
            echo -e "edjanger:DEBUG: environment_variables:$environment_variables"
        elif [[ $element = *"--name"* ]]; then
          retrieve_key_value_space_separated "--name" ""
          container_name=$(echo ${element##*=} | tr -d ' ')
          [[ "$debug" = "true" ]] && \
            echo -e "edjanger:DEBUG: container_name:$container_name"
        elif [[ $element = "--hostname"* ]] || [[ $element = "-h"* ]]; then
          retrieve_key_value_space_separated "--hostname" "-h"
          container_hostname=$(echo ${element##*=} | tr -d ' ')
          [[ "$debug" = "true" ]] && \
            echo -e "edjanger:DEBUG: container_hostname:$container_hostname"
        elif [[ $element = "-"* ]] && [[ "$imagefound" = "false" ]]; then
          retrieve_key_value_space_separated "" ""
          run_other_options+=$element" "
          [[ "$debug" = "true" ]] && \
            echo -e "edjanger:DEBUG: run_other_options:$run_other_options"
        elif [[ ! $element = "-"* ]] && [[ "$imagefound" = "false" ]]; then
          image_name=$(echo $element | tr -d ' ')
          imagefound=true
          [[ "$debug" = "true" ]] && \
            echo -e "edjanger:DEBUG: image_name:$image_name"
        else
          command_run+=$(echo $element | tr -d ' ')
          command_run+=" "
          [[ "$debug" = "true" ]] && \
            echo -e "edjanger:DEBUG: command_run:$command_run"
        fi
        
        element=$(echo "$cmdonline" | awk '{ printf $1 }')
        idelt=$(( $idelt + 1 ))
        cmdonline=${cmdonline#*${element}}
        
      done

      # replace in configuration.properties
      [[ "$debug" = "true" ]] && \
        echo -e "edjanger:DEBUG: container_name=$container_name"
      sed -e "s/\(container_name=\).*/\1\"${container_name}\"/g" configuration.properties > configuration.tmp \
                                                  && mv configuration.tmp configuration.properties
      [[ "$debug" = "true" ]] && \
        echo -e "edjanger:DEBUG: container_hostname=$container_hostname"
      sed -e "s/\(container_hostname=\).*/\1\"${container_remove}\"/g" configuration.properties > configuration.tmp \
                                                  && mv configuration.tmp configuration.properties
      [[ "$debug" = "true" ]] && \
        echo -e "edjanger:DEBUG: container_remove=$container_remove"
      sed -e "s/\(container_remove=\).*/\1\"${container_remove}\"/g" configuration.properties > configuration.tmp \
                                                  && mv configuration.tmp configuration.properties
      [[ "$debug" = "true" ]] && \
        echo -e "edjanger:DEBUG: image_name=$image_name"
      sed -e "s/\(image_name=\).*/\1\"${image_name//\//\\/}\"/g" configuration.properties > configuration.tmp \
                                                  && mv configuration.tmp configuration.properties
      [[ "$debug" = "true" ]] && \
        echo -e "edjanger:DEBUG: exposed_ports=$exposed_ports"
      sed -e "s/\(exposed_ports=\).*/\1\"${exposed_ports}\"/g" configuration.properties > configuration.tmp \
                                                  && mv configuration.tmp configuration.properties
      [[ "$debug" = "true" ]] && \
        echo -e "edjanger:DEBUG: published_ports=$published_ports"
      sed -e "s/\(published_ports=\).*/\1\"${published_ports}\"/g" configuration.properties > configuration.tmp \
                                                  && mv configuration.tmp configuration.properties
      shared_volumes=${shared_volumes//\//\\/}
      [[ "$debug" = "true" ]] && \
        echo -e "edjanger:DEBUG: shared_volumes=$shared_volumes"
      sed -e "s/\(shared_volumes=\).*/\1\"${shared_volumes}\"/g" configuration.properties > configuration.tmp \
                                                        && mv configuration.tmp configuration.properties
      [[ -n $environment_variables ]] \
        && environment_variables=${environment_variables//\//\\/} \
        && environment_variables=$(echo ${environment_variables} | sed 's/\"/\\\"/g')
      [[ "$debug" = "true" ]] && \
        echo -e "edjanger:DEBUG: environment_variables=$environment_variables"
      sed -e "s/\(environment_variables=\).*/\1\"${environment_variables}\"/g" configuration.properties > configuration.tmp \
                                                  && mv configuration.tmp configuration.properties
      sed -e "s/env=\"/env=\\\\\"/g"  configuration.properties > configuration.tmp \
                                                  && mv configuration.tmp configuration.properties
      sed -e "s/\" \-\-env=/\\\\\" \-\-env=/g"  configuration.properties > configuration.tmp \
                                                  && mv configuration.tmp configuration.properties
      sed -e "s/\"\"/\\\\\"\"/g"  configuration.properties > configuration.tmp \
                                                  && mv configuration.tmp configuration.properties
      # TODO following to correct not so good regex, to be improved
      sed -e "s/=\\\\\"\"/=\"\"/g"  configuration.properties > configuration.tmp \
                                                  && mv configuration.tmp configuration.properties
      volumesfrom=${volumesfrom//\//\\/}
      [[ "$debug" = "true" ]] && \
        echo -e "edjanger:DEBUG: volumes_from=$volumes_from"
      sed -e "s/\(volumes_from=\).*/\1\"${volumes_from}\"/g" configuration.properties > configuration.tmp \
                                                  && mv configuration.tmp configuration.properties
      linked_containers=${linked_containers//\//\\/}
      [[ "$debug" = "true" ]] && \
        echo -e "edjanger:DEBUG: linked_containers=$linked_containers"
      sed -e "s/\(linked_containers=\).*/\1\"${linked_containers}\"/g" configuration.properties > configuration.tmp \
                                                  && mv configuration.tmp configuration.properties
      run_other_options=${run_other_options//\//\\/}
      [[ "$debug" = "true" ]] && \
        echo -e "edjanger:DEBUG: run_other_options=$run_other_options"
      sed -e "s/\(run_other_options=\).*/\1\"${run_other_options}\"/g" configuration.properties > configuration.tmp \
                                                  && mv configuration.tmp configuration.properties
      [[ -n $command_run ]] \
        && command_run=${command_run//\//\\/} \
        && command_run=$(echo ${command_run} | sed 's/\"/\\\"/g')
      [[ "$debug" = "true" ]] && \
        echo -e "edjanger:DEBUG: command_run=$command_run"
      sed -e "s/\(command_run=\).*/\1\"${command_run}\"/g" configuration.properties > configuration.tmp \
                                                  && mv configuration.tmp configuration.properties
                                           
      # enable variables in edjanger.template
      unset -v comment && [[ -z $image_name ]] && comment="#" 
      unset -v header  && [[ -n $image_name ]] && header="#"
      sed -e "s/${header}\(image_name=\.*\)/${comment}\1/" edjanger.template > edjanger.tmp \
                                                  && mv edjanger.tmp edjanger.template
      unset -v comment && [[ -z $container_name ]] && comment="#"
      unset -v header  && [[ -n $container_name ]] && header="#"
      sed -e "s/${header}\(container_name=\.*\)/${comment}\1/" edjanger.template > edjanger.tmp \
                                                  && mv edjanger.tmp edjanger.template
      unset -v comment && [[ -z $container_hostname ]] && comment="#"
      unset -v header  && [[ -n $container_hostname ]] && header="#"
      sed -e "s/${header}\(container_hostname=\.*\)/${comment}\1/" edjanger.template > edjanger.tmp \
                                                  && mv edjanger.tmp edjanger.template
      unset -v comment && [[ -z $container_remove ]] && comment="#"
      unset -v header  && [[ -n $container_remove ]] && header="#"
      sed -e "s/${header}\(container_remove=\.*\)/${comment}\1/" edjanger.template > edjanger.tmp \
                                                  && mv edjanger.tmp edjanger.template
      unset -v comment && [[ -z $exposed_ports ]] && comment="#"
      unset -v header  && [[ -n $exposed_ports ]] && header="#"
      sed -e "s/${header}\(exposed_ports=\.*\)/${comment}\1/" edjanger.template > edjanger.tmp \
                                                  && mv edjanger.tmp edjanger.template
      unset -v comment && [[ -z $published_ports ]] && comment="#"
      unset -v header  && [[ -n $published_ports ]] && header="#"
      sed -e "s/${header}\(published_ports=\.*\)/${comment}\1/" edjanger.template > edjanger.tmp \
                                                  && mv edjanger.tmp edjanger.template
      unset -v comment && [[ -z $shared_volumes ]] && comment="#"
      unset -v header  && [[ -n $shared_volumes ]] && header="#"
      sed -e "s/${header}\(shared_volumes=\.*\)/${comment}\1/" edjanger.template > edjanger.tmp \
                                                  && mv edjanger.tmp edjanger.template
      unset -v comment && [[ -z $environment_variables ]] && comment="#"
      unset -v header  && [[ -n $environment_variables ]] && header="#" 
      sed -e "s/${header}\(environment_variables=\.*\)/${comment}\1/" edjanger.template > edjanger.tmp \
                                                  && mv edjanger.tmp edjanger.template                
      unset -v comment && [[ -z $volumes_from ]] && comment="#"
      unset -v header  && [[ -n $volumes_from ]] && header="#"
      sed -e "s/${header}\(volumes_from=\.*\)/${comment}\1/" edjanger.template > edjanger.tmp \
                                                  && mv edjanger.tmp edjanger.template
      unset -v comment && [[ -z $linked_containers ]] && comment="#"
      unset -v header  && [[ -n $linked_containers ]] && header="#"
      sed -e "s/${header}\(linked_containers=\.*\)/${comment}\1/" edjanger.template > edjanger.tmp \
                                                  && mv edjanger.tmp edjanger.template
      unset -v comment && [[ -z $run_other_options ]] && comment="#"
      unset -v header  && [[ -n $run_other_options ]] && header="#"
      sed -e "s/${header}\(run_other_options=\.*\)/${comment}\1/" edjanger.template > edjanger.tmp \
                                                  && mv edjanger.tmp edjanger.template
      unset -v comment && [[ -z $command_run ]] && comment="#"
      unset -v header  && [[ -n $command_run ]] && header="#"
      sed -e "s/${header}\(command_run=\.*\)/${comment}\1/" edjanger.template > edjanger.tmp \
                                                  && mv edjanger.tmp edjanger.template
      
      # TODO following to correct not so good regex, to be improved                                            
      cat edjanger.template | sed 's/^##/#/g' > edjanger.tmp && mv edjanger.tmp edjanger.template
      
      # update build/Dockerfile
      echo -e "FROM ${image_name}" > build/Dockerfile 

      # replace in template
      yes | . {edjangerpath}/template.sh --configure=configuration
      
      # TODO following to correct not so good regex, to be improved
      # envsubst must conserve escaping double quotes
      sed -e "s/\(environment_variables=\).*/\1\"${environment_variables}\"/g" edjanger.properties > edjanger.tmp \
                                                  && mv edjanger.tmp edjanger.properties
      sed -e "s/env=\"/env=\\\\\"/g"  edjanger.properties > edjanger.tmp \
                                                  && mv edjanger.tmp edjanger.properties
      sed -e "s/\" \-\-env=/\\\\\" \-\-env=/g"  edjanger.properties > edjanger.tmp \
                                                  && mv edjanger.tmp edjanger.properties
      sed -e "s/\"\"/\\\\\"\"/g"  edjanger.properties > edjanger.tmp \
                                                  && mv edjanger.tmp edjanger.properties
      #sed -e "s/\//\\\\\//g"  edjanger.properties > edjanger.tmp \
      #                                            && mv edjanger.tmp edjanger.properties
      # TODO following to correct not so good regex, to be improved
      sed -e "s/=\\\\\"\"/=\"\"/g"  edjanger.properties > edjanger.tmp \
                                                  && mv edjanger.tmp edjanger.properties
      
      cd $currentpath
     
    fi
    
  done
  
}

function init_new_template()
{
  template=$1
  
  [ "$(ls -A .)" ] \
      && echo "edjanger:WARNING: directory is not empty" \
      && return 1 
  
  zipfile=$templates_path/${template}.zip
  
  [ ! -f $zipfile ] \
      && echo "Template ${template}.zip does not exist in path \"$templates_path\"" \
      && exit 1
  
  zipbase=$(basename ${zipfile})
  zipid=${zipbase%.*}
  
  unzip $zipfile -d $PWD
  tar -xvf $zipid.tar
  
  rm -f $zipid.tar
  rm -f $zipid.yaml
  
}

# check if a linux binary is installed
function is_exec_present()
{
  execname="$1"
  exepath=$(command -v $execname)
  if [ -z "$exepath" ]; then
    echo -e "${app_name}:ERROR: $execname is not present (result: $exepath), please install it, installation aborted"
    return 1;
  else
    return 0;
  fi
}

# detect and rename old edocker.properties to edjanger.properties
function rename_edocker_properties()
{
  if [ -f edocker.${config_extension} ] || [ -f edocker.cfg ] ; then
    if [ -f edocker.${config_extension} ]; then older_config=edocker.${config_extension}; fi
    if [ -f edocker.cfg ]; then older_config=edocker.cfg; fi
    echo -e "${app_name}:WARNING found ${older_config}, do you want to rename it to ${app_name}.${config_extension} (y/n)?"
    read response
    if [ "y" = "$response" ]; then
      mv ${older_config} ${app_name}.${config_extension}
    else
      return 1;
    fi
  fi
}

# read edjanger.properties variables
function read_app_properties()
{
  rename_edocker_properties
  if [ ! -f ${app_name}.${config_extension} ]; then
    echo -e "${app_name}:ERROR No ${app_name}.${config_extension} available, use \"<${app_name}init>\" command to initialize one in this directory"
  else
    parameters=$(cat {edjangerpath}/templates/${app_name}.template|grep "="|cut -d '=' -f1|cut -d '#' -f2)

    for p in ${parameters}; do
      unset -v ${p}
    done

    source ${app_name}.${config_extension}

  fi

}

# print header of script
function parseHeader()
{
  scriptname=$1
  parse_documentation $scriptname
  basename=$(basename "${scriptname}")
  commandname=edjanger${basename%.sh}
  header=$(echo "$documentation" | $SED_REGEX "s/@script.name/${commandname}/g")
}

# print header of script
function printHeader()
{
  parseHeader $1
  echo "$header"
}

# primitive function for docker image commands
function dockerbasicimage()
{

  evalOptionsParameters "$*"

  if [ -n "$help" ]; then
    printHeader $scriptname
  else
    rename_edocker_properties
    if [ -z ${noneedsofproperties} ] && [ ! -f ${app_name}.${config_extension} ]; then
      echo -e "${app_name}:ERROR No ${app_name}.${config_extension} available, use \"<${app_name}init>\" command to initialize one in this directory"
    else
      
      if [ -n "$confirm" ]; then
        confirmquestion=${confirmquestion/\{image_name\}/${image_name}}
        echo "$confirmquestion"
        read response
      else
        response=y
      fi
      if [ "y" = "$response" ]; then
      
        read_app_properties
        
        # echo comment for running command
        commandcomment=${commandcomment/\{image_name\}/${image_name}}
        echo "> ${commandcomment}"
        
        # replace image name in commandline and commandoptions
        commandline=${commandline/\{image_name\}/${image_name}}
        if [[ "${commandoptions}" == *"{image_name}"* ]]; then
          commandoptions=${commandoptions/\{image_name\}/${image_name}}
        fi
        
        if [[ ${commandline} == tag* ]]; then
          # check required
          [ -z "${tag}" ]             && echo -e " ${app_name}:ERROR: arguments --tag is required" \
                                      && printHeader $scriptname && exit -1
          # set options
          [ -n "${tag}" ]             && commandoptions="${commandoptions} ${tag}"
        elif [[ ${commandline} == clean* ]]; then
          # set options
          [ -n "${force}" ]           && commandoptions="${commandoptions} ${force}"
          [ -n "${no-prune}" ]        && commandoptions="${commandoptions} ${no-prune}"
        fi
        
        docker ${commandline} ${commandoptions}
        if [ "true" = "${docker_command}" ]; then
            echo -e "> Executed docker command:"
            echo -e "> docker ${commandline} ${commandoptions}"
        fi
      fi
    fi
  fi
}

# compute container name last index for docker container commands
function computeContainerIndexFromLast()
{
  container_name=$1
  container_idx=$(docker ps -a --format '{{.Names}}' --filter="name=${container_name}_[0-9]+"| sed -E "s/.*\_([0-9]+)/\1/g"|sort -nr | head -n1)
  return $container_idx
}

# compute container name index for docker container commands
function computeContainerIndexFromTotal()
{
  container_name=$1
  container_idx=$(($(docker ps -a --format="{{.Names}}" --filter="name=${container_name}_[0-9]+"|wc -l)))
  return $container_idx
}

# primitive function for docker container commands
function dockerbasiccontainer()
{
  
  evalOptionsParameters "$*"
  
  if [ -n "$help" ]; then
    printHeader $scriptname
  else
    rename_edocker_properties
    if [ ! -f ${app_name}.${config_extension} ]; then
      echo -e "${app_name}:ERROR No ${app_name}.${config_extension} available, use \"<${app_name}init>\" command to initialize one in this directory"
    else
      read_app_properties
      if [ -z "$index" ]; then
        if [[ "$commandline" == *"run"* ]]; then
          #computeContainerIndexFromTotal ${container_name}; idx=$?; idx=$(($idx + 1))
          computeContainerIndexFromLast ${container_name}; idx=$?; idx=$(($idx + 1))
        else
          computeContainerIndexFromLast ${container_name};
          idx=$? 
        fi
      else
        idx=$index
      fi

      if [ $idx -le 0 ]; then
        echo -e "${app_name}:INFO No container available for root name \"${container_name}\""
        exit -1
      fi

      # list of containers
      if [[ ${commandline} == "rm"* ]] && [[ -n ${all} ]]; then
        containers_list=$(docker ps -a --format '{{.Names}}' --filter="name=${container_name}_[0-9]+")
      fi
      
      # set container name and comment
      if [[ ${commandline} == "rm"* ]] && [[ -n ${all} ]]; then
        # ... without index
        container_name=${container_name}
        #commandcomment=${commandcomment/\{container_name\}/${containers_list}}
      else
        # ... with index
        container_name=${container_name}_${idx}
        commandcomment=${commandcomment/\{container_name\}/${container_name}}
      fi
      
      if [ -n "$confirm" ]; then
        if [[ ${commandline} == "rm"* ]] && [[ -n ${all} ]]; then
          confirmquestion=${confirmquestion/Container /Following container\(s\)}
          confirmquestion=${confirmquestion/\{container_name\}/}
          confirmquestion="${confirmquestion}\n${containers_list}\n"
        else
          confirmquestion=${confirmquestion/\{container_name\}/${container_name}}
        fi
        printf "$confirmquestion"
        read response
      else
        response=y
      fi
      if [ "y" = "$response" ]; then
        
        # TODO : to beconfirmed duplicate code
        # # echo comment for running commandline
        # if [[ ${commandline} != "ps"* ]]; then
        #   commandcomment=${commandcomment/\{container_name\}/${container_name}}
        # fi
        echo "> ${commandcomment}"
        
        # following valid for exec
        if [[ ${commandline} == "exec"* ]]; then
          # set options
          [ -n "${shellcommand}" ]    && commandoptions="${commandoptions} -c \"${shellcommand}\""
        # following valid for rm and all
        elif [[ ${commandline} == "rm"* ]]; then
          # set options
          [ -n "${all}" ]             && containers_list=$(echo ${containers_list} | tr '\n' ' ') \
                                      && commandoptions=${commandoptions/\{container_name\}/${containers_list}}
        # following valid for rename
      elif [[ ${commandline} == "rename"* ]]; then
          # check required
          [ -z "${name}" ]            && printHeader $scriptname && exit -1
          # set options
          [ -n "${name}" ]            && commandoptions="${commandoptions} ${name}"
        # following valid for commit
      elif [[ ${commandline} == "commit"* ]]; then
          # check required
          [ -z "${commitname}" ]      && printHeader $scriptname && exit -1
          # set options
          [ -n "${commitauthor}" ]    && commandoptions="--author ${commitauthor} ${commandoptions}"
          [ -n "${commitmessage}" ]   && commandoptions="--message ${commitmessage} ${commandoptions}"
          [ -n "${commitchange}" ]    && commandoptions="--change ${commitchange} ${commandoptions}"
          [ -n "${commitname}" ]      && commandoptions="${commitname} ${commandoptions}"
        # following valid for copy
      elif [[ ${commandline} == "cp"* ]]; then
          # check required
          [ -z "${fromcontainer}" -a -z "${fromhost}" ] &&  echo -e " ${app_name}:ERROR: arguments --fromcontainer or --fromhost are required" \
                                      && printHeader $scriptname && exit -1
          [ -z "${sourcepath}" ]      && echo -e " ${app_name}:ERROR: arguments --sourcepath is required" \
                                      && doexit=true
          [ -z "${destinationpath}" ] && echo -e " ${app_name}:ERROR: arguments --destinationpath is required" \
                                      && doexit=true
          [ "${doexit}" ]             && printHeader $scriptname && exit -1
                    
          [ -d "${destinationpath}/$(basename ${sourcepath})" ] \
                                      && echo -e " ${app_name}:ERROR: destination folder \"${destinationpath}/$(basename ${sourcepath})\" exist !" \
                                      && exit -1
          [ -f "${destinationpath}/$(basename ${sourcepath})" ] \
                                      && echo -e " ${app_name}:ERROR: destination file \"${destinationpath}/$(basename ${sourcepath})\" exist !" \
                                      && exit -1
                                      
          # set options
          [ -n "${fromcontainer}" ]   && commandoptions="${commandoptions} ${container_name}:${sourcepath} ${destinationpath}"
          [ -n "${fromhost}" ]        && commandoptions="${commandoptions} ${sourcepath} ${container_name}:${destinationpath}"
          
        fi
        
        # replace container name in commandline and commandoptions
        commandline=${commandline/\{container_name\}/${container_name}}
        commandoptions=${commandoptions/\{container_name\}/${container_name}}
        
        # run docker commandline
        if [ "true" = "${docker_command}" ]; then
          echo -e "> Executed docker command:"
          echo -e "> docker ${commandline} ${commandoptions}"
        fi
        docker ${commandline} ${commandoptions}
        
      fi

    fi
  fi
}

# check edjanger.properties parameters
function checkparameter()
{
  parameter="$1"

  # grep parameter found in ${app_name}.${config_extension}
  export check=$(cat ${app_name}.${config_extension}|grep -v "#"|grep "${parameter}"|cut -d '=' -f1)
  if [ -z ${check} ]; then
    echo "    WARNING: parameter is missing !!!"
    return 255
  fi
}

function checkconfig()
{
  rename_edocker_properties
  if [ ! -f ${app_name}.${config_extension} ]; then
    echo -e "${app_name}:ERROR No ${app_name}.${config_extension} available, use \"<${app_name}init>\" command to initialize one in this directory"
  else
    
    echo -e "> Check configuration variables from ${app_name}.${config_extension}..."
    
    read_app_properties

    parameters=$(cat {edjangerpath}/templates/${app_name}.template|grep -v "#"|grep "="|cut -d '=' -f1)

    local res
    for p in ${parameters}; do

      echo -e "  . check \"${p}\""
      checkparameter "${p}"; if [ "$?" = "255" ]; then res=255; fi

    done

    if [ "$res" = "255" ]; then
      return 255
    fi
  fi
}

function usage_command()
{

  script=$1
  command=$2

  # list all *.sh scripts from ${app_name} path
  scripts=$(ls {edjangerpath}/*.sh | grep -v -e "${script}" -e "help" -e "\_")

  for s in ${scripts}; do

    base=$(basename ${s})

    found=$(grep -e ${command} ${s})

    if [ -n "${found}" ]; then
      echo -e "      - command: \"${app_name}${base%.sh}\""
    fi

  done

}

function usage_list()
{

  script=$1

  # list all *.sh scripts from ${app_name} path
  scripts=$(ls {edjangerpath}/*.sh | grep -v -e "\_")

  echo -e "Help must have one argument in list:\n"
  echo -e "  print parameters used by edjanger commands:\t=> edjangerhelp config\n"

  for s in ${scripts}; do

    base=$(basename ${s})
    
    TABN="\t\t"
    aliascmd=${app_name}${base%.sh}
    if [ "${#aliascmd}" -le 12 ]; then
      TABN="\t\t\t"
    elif [ "${#aliascmd}" -ge 20 ]; then
      TABN="\t"
    fi
    echo -e "  help on command: ${aliascmd}$TABN=> edjangerhelp ${base%.sh}"

  done

}

# print list of parameters and whiwh command are using it
function usage_config()
{
  script=$1

  echo -e "Parameters in ${app_name}.${config_extension} configuration file"

  parameters=$(cat {edjangerpath}/templates/${app_name}.template|grep -v "#"|grep "="|cut -d '=' -f1)

  for p in ${parameters}; do

    comment=$(cat {edjangerpath}/templates/${app_name}.template|grep -e "#${p}"|cut -d ':' -f2)
    echo -e ""
    echo -e "  - ${p}: ${comment}, used by:"
    usage_command "${script}" "${p}"

  done

}

# TODO : deprecated, to be removed
# older usage, update headers for all scripts
function usage()
{

  commands=()

  script=$1
  command=$2

  if [ -z "${command}" ]; then

    usage_list ${script}

  else

    found=false

    scripts=$(ls {edjangerpath}/*.sh | grep -v -e "\_")

    for s in ${scripts}; do

      base=$(basename ${s})

      edalias=${prefix}${base%.sh}

      if [ "$2" = "${edalias}" ]; then
        
        printHeader ${s}
        # alias_txt=$(grep "ALIAS" ${s}|cut -d ':' -f2)
        # echo -e "Usage       :"$alias_txt
        # 
        # desc_txt=$(grep "DESCRIPTION" ${s}|cut -d ':' -f2)
        # echo -e "\nDescription :"$desc_txt
        # 
        # SAVEIFS=$IFS
        # IFS=$'\n'
        # args=$(grep "ARGUMENT" ${s})
        # echo -e "\nArgument(s) of command "
        # echo -e "  - help"
        # for arg in $args; do
        #   val=$(echo $arg|cut -d ':' -f2)
        #   echo -e "  - $val"
        # done
        # IFS=$SAVEIFS
        # 
        
        # TODO to be reactivated
        # params=$(grep "PARAMETER" ${s}|cut -d ":" -f2)
        # if [ -n "$params" ]; then
        #   echo -e "\nParameter(s) in edjanger.properties "
        #   for p in $params; do
        #     echo -e "  - $(echo $p)"
        #   done
        # fi

        found=true

      fi

    done

    if [ "$2" = "config" ]; then

      usage_config "${script}"

      found=true

    fi

    if [ "${found}" != "true" ]; then
      usage_list ${script}
    fi

  fi
}


# Build path aliases files
function buildPathAliases() 
{

  working_path=$1
  base_path=$(basename $1)

  # ${app_name} alias/unalias files
  pathaliasFile=${working_path}/${base_path}.alias
  pathunaliasFile=${working_path}/${base_path}.unalias

  # list all *.sh scripts from ${app_name} path
  scripts=$(ls $working_path)

  # delete all previous aliases files path
  rm -f ${pathaliasFile} ${pathunaliasFile}

  #echo -e "\n--- Build aliases for subfolders of directory $working_path..."

  # create aliases files (*.alias and *.unalias)
  for s in ${scripts}; do

    base=$(basename ${s})

    if [ -d $working_path/${s} ]; then

      pathalias=cd${base}

      #echo -e "  - updating path aliases ${pathalias} in files..."

      echo "alias ${pathalias}=\"cd ${working_path}/${base}; pwd\"" >> ${pathaliasFile}

      echo "unalias ${pathalias}" >> ${pathunaliasFile}

    fi

  done

  echo $pathaliasFile

}

# update help header in markdown for edjanger web site
function buildApiMarkdown() 
{
  outputpath=$1
  
  # list all *.sh scripts from edjanger path
  scripts=$(ls {edjangerpath}/*.sh)
  
  # create aliases files (*.alias and *.unalias)
  for script in ${scripts}; do

    base=$(basename ${script})

    if [[ ! "$base" =~ [_]{1}.* ]]; then
      echo -e "Process api edjanger-${base%.sh} in path \"${outputpath}\""
      parseHeader ${script}
      header=$(echo -e "$header" | $SED_REGEX "s/#\!\/bin\/bash//g")
      header=$(echo -e "\`\`\`bash\n${header}\n\`\`\`")
      #echo -e "$header" > ${outputpath}/${base%.sh}.md
      echo -e "## Command ${app_name}${base%.sh}" >> ${outputpath}/api.md
      echo -e "$header" >> ${outputpath}/api.md
      echo -e "Note: help for this command could be retrieve by typing:" >> ${outputpath}/api.md
      echo -e "\`\`\`bash\n${app_name}${base%.sh} --help\n\`\`\`" >> ${outputpath}/api.md
    fi
    
  done
  
}

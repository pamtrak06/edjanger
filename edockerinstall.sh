#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : copy.sh
# DESCRIPTION      : install edocker
#   PARAMETER      : (dev) provide contribution mode to upload to github
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : ./edockerinstall <dev>
# ----------------------------------------------------

# global edocker
debug=false
edockerpath=$PWD/scripts
aliaspath=$PWD
prefix=edocker
mode=release
source scripts/_common.sh

# Replace absolute paths of edocker in all scripts
function updatePaths() {
  script="$1"
  mode="$2"
  debug=$3

  if [ "${mode}" = "release" ]; then
    if $debug ; then
      echo -e "  - update script: $script, replace \"{edockerpath}\" to \"${edockerpath}\""
    fi
    if [ "$(uname)" = "Linux" ]; then
      sed -i "s|{edockerpath}|${edockerpath}|g" ${script}
    elif [ "$(uname)" = "Darwin" ]; then
      sed -i '' "s|{edockerpath}|${edockerpath}|g" ${script}
    fi
  elif [ "${mode}" = "development" ]; then
    if $debug ; then
      echo -e "  - update script: $script, replace \"${edockerpath}\" to \"{edockerpath}\""
    fi
    if [ "$(uname)" = "Linux" ]; then
      # reverse for github uploading
      sed -i "s|${edockerpath}|{edockerpath}|g" ${script}
    elif [ "$(uname)" = "Darwin" ]; then
      sed -i '' "s|{edockerpath}|${edockerpath}|g" ${script}
      # reverse for github uploading
      sed -i '' "s|${edockerpath}|{edockerpath}|g" ${script}
    fi
  else
    echo "edocker:WARNING: unidentified mode: ${mode}"
  fi
}

# Build aliases files
function checkPrerequisities() {
  status=0;
  is_exec_present "bc"
  if [ $? = -1 ]; then
    status=-1;
  else
    echo -e "  - bc is present: $exepath"
  fi
  is_exec_present "envsubst"
  if [ $? = -1 ]; then
    status=-1;
  else
    echo -e "  - envsubst is present: $exepath"
  fi
  return $status
}

# update templates
function updateTemplates() {

  mode=$1

  listtmpl=$(find ${edockerpath}/templates -name "*.sh")

  for t in ${listtmpl}; do

    updatePaths "${t}" "${mode}" ${debug}

  done

}

# update scripts
function updateScripts() {

  mode=$1

  scripts=$(ls ${edockerpath}/*.sh)

  for s in ${scripts}; do

    updatePaths "${s}" "${mode}" ${debug}

  done

}

# swith to dev mode to push to github
function swith2devMode() {
  mode=$1
  echo -e "\n--- PROCESSING: update scripts paths in mode \"$mode\"..."
  updateScripts $mode
  echo -e "\n--- PROCESSING: update templates paths in mode \"$mode\"...\n"
  updateTemplates $mode
}

# configuration of docker project
function printConfiguration() {

  echo -e "\n"
  echo -e "----------------------------"
  echo -e "- edocker / use cases      -"
  echo -e "----------------------------"
  echo -e "\n# INITIALIZE AN EDOCKER PROJECT"
  echo -e "Do following actions in your favorite docker working directory:"
  echo -e "  - call \"<edockerinit>\" within your docker working directory,"
  echo -e "    it copy template edocker_template.${config_extension} in your docker working directory with name edocker.${config_extension}"
  echo -e "  - configure parameters inside edocker.${config_extension}, most important: image_name and container_name"
  echo -e "  - try an edocker command, like edockerbuild...\n"
  echo -e "\n# BUILD DOCKER-COMPOSE.YAML FROM EDOCKER.PROPERTIES"
  echo -e "  - New: see how to create docker-compose.yaml from edocker.properties with edockercompose !"
  echo -e "\n# START OR RUN CONTAINER(S) AT REBOOT"
  echo -e "  - New: take a look at cron capabilities at https://github.com/pamtrak06/edocker#configure-automatic-container-restart-at-boot !"
  echo -e "\n# MULTIPLE TARGET CONFIGURATIONS WITH TEMPLATE CAPABILITIES"
  echo -e "  - New: take a look at edockertemplate to make yours edocker.properties highly configurable !"
}

function printContribution()
{
  echo -e "----------------------------"
  echo -e "- edocker / contribution   -"
  echo -e "----------------------------"
  echo -e " Absolute paths (${edockerpath}) are replaced by {edockerpath} in all scripts."
  echo -e " After, you could upload your modify source code and upload it to github."
  echo -e " Execute: \"git status\" and read INSTALL.md for contribution part..."
}

# Build symbolic links
#TODO: SymbolicLinks WORK IN PROGRESS
function buildSymbolicLinks() {

  mode=$1
  echo "TARGET:$2"
  if [ -n "$2" ]; then
    echo "TARGET1"
    target=$2
  else
    echo "TARGET2"
    target=$(dirname ${edockerpath})
  fi

  echo -e "----------------------------"
  echo -e "- edocker / installation   -"
  echo -e "----------------------------"

  echo -e "\n--- Check prerequisities..."
  checkPrerequisities
  if [ $? = -1 ]; then
    echo -e "edocker:ERROR: cheking prerequisities, installation aborted"
    return -1;
  fi

  echo -e "\n--- PROCESSING: create target $target if not exist"
  if [ ! -d "$target" ]; then
    mkdir -p $target
    if [ $? = -1 ]; then
      echo -e "\nCreating directory $target failed, trying to install aliases method"
      buildAliases ${mode}
      return -1;
    fi
  fi

  symblnklist=$(ls -A $target/edocker*| grep -v sh | grep -v alias)

  echo -e "\n--- PROCESSING: remove symbolic links from $target if exists"
  if [ -n "$symblnklist" ]; then
   for s in $symblnklist; do
     if [ -L "$s" ]; then
       rm -f $s
    fi
   done
  fi

  echo -e "\n--- PROCESSING: Creation of symbolic links command in $target..."
  if [ -z "$symblnklist" ]; then

    for s in $(ls ${edockerpath}/*.sh); do

      base=$(basename $s)
      aliasname=$target/edocker${base%.*}
      echo "  - linking $s in alias $aliasname..."
      ln -s $s ${aliasname}

      # update paths in scripts
      updatePaths "${s}" "${mode}" ${debug}

    done

  else
    echo -e "  - folder \"$target\" already exist"
  fi

  echo -e "\n--- PROCESSING: Replace paths in templates scripts from folder ${edockerpath}/template..."
  updateTemplates ${mode}

  echo -e "\n--- PROCESSING: Activating path to symbolinc links for this session (export PATH=\$PATH:\$target)..."
  export PATH=$PATH:$target

  # check if alias are activated
  echo -e "\n--- PROCESSING: Checking if symbolic links are available in the current session"
  symblnklist=$(ls -A $target/edocker*| grep -v sh | grep -v alias)
  if [ -z "$symblnklist" ]; then
    echo -e "edocker:ERROR: symbolic links are undefined!!"
  fi

  echo -e "\n-> edocker installation: done"

  printConfiguration

}

# Build aliases files
function buildAliases() {

  mode=$1

  # edocker alias/unalias files
  edaliasFile=${aliaspath}/${prefix}.alias
  edunaliasFile=${aliaspath}/${prefix}.unalias

  echo -e "----------------------------"
  echo -e "- edocker / installation   -"
  echo -e "----------------------------"

  echo -e "\n--- Check prerequisities..."
  checkPrerequisities
  if [ $? = -1 ]; then
    echo -e "edocker:ERROR: cheking prerequisities, installation aborted"
    return -1;
  fi

  # list all *.sh scripts from edocker path
  scripts=$(ls ${edockerpath}/*.sh)

  # delete all previous aliases files in edocker path
  rm -f ${edaliasFile} ${edunaliasFile}

  echo -e "\n--- PROCESSING: Write aliases in files:"
  echo -e "  - ${edaliasFile}, containing all edocker alias..."
  echo -e "  - ${edunaliasFile}, containing all edocker unalias..."
  echo -e "\n--- PROCESSING: Replace paths in shell scripts from folder ${edockerpath}..."

  # create aliases files (*.alias and *.unalias)
  for s in ${scripts}; do

    updatePaths "${s}" "${mode}" ${debug}

    base=$(basename ${s})

    if [[ ! "$base" =~ [_]{1}.* ]]; then

      edalias=${prefix}${base%.sh}

      if $debug ; then
        echo -e "  - updating aliases ${edalias} in files ${edaliasFile} and ${edunaliasFile}..."
      fi

      echo "alias ${edalias}=\"source ${edockerpath}/${base}\"" >> ${edaliasFile}

      echo "unalias ${edalias}" >> ${edunaliasFile}

    fi

  done

  echo -e "\n--- PROCESSING: Replace paths in templates scripts from folder ${edockerpath}/template..."
  updateTemplates $mode

  echo -e "\n--- INFORMATION: Aliases files created. Run commands for (un)activation:"
  echo -e "  - \"source ${aliaspath}/${prefix}.alias\"   => aliases ${prefix}[docker command] are added"
  echo -e "  - \"source ${aliaspath}/${prefix}.unalias\" => aliases ${prefix}[docker command] are removed"

  echo -e "\n--- PROCESSING: Activating aliases for this session..."
  . ${aliaspath}/${prefix}.alias

  # check if alias are activated
  echo -e "\n--- PROCESSING: Checking if aliases are activated or removed in your session by running:"
  echo -e "  - \"<alias|grep ${prefix}>\""
  activation=$(echo -e $(alias)|grep ${prefix})
  if [ -z "$activation" ]; then
    echo -e "edocker:ERROR: aliases are undefined!!"
  fi

  echo -e "\n-> edocker installation: done"

  echo -e "\n  !!! WARNING : THINK TO CONFIGURE ENVIRONEMENT TO LOAD ${aliaspath}/${prefix}.alias !!!"
  echo -e "  This could be done here: /etc/profile, /etc/environment, ..."
  echo -e "  This could be done here: ~/.bashrc, ~/.bash_aliases, ..."
  echo -e "  This could be done here: ~/.bash_profile, ~/.bash_login, ..."
  echo -e "  This could be done here: ~/.profile, ~/.login, ~/.zshrc, ..."

  printConfiguration

}

function usage()
{
  echo "usage: $0 [--help|-h] ([--debug|-d] || ( ([--contribution|-c]) || ( ( [--alias|-a] ) || ( [--symboliclink|-s] || [--symboliclink[=]<path>]|-s[=]<path> ) ) ) )" >&2
  echo -e "  [-help|-h] : print help" >&2
  echo -e "  [-debug|-d] : print debug informations (could be combined with -a -s -s=*)" >&2
  echo -e "  [-alias|-a] : initialize edocker from aliases file creation" >&2
  echo -e "  [-symboliclink|-s<] : initialize edocker from symbolic links creation" >&2
  echo -e "  [-symboliclink=<path>-s[=]<path>] : initialize edocker from symbolic links creation with a specified path" >&2
  echo -e "\n  Examples:" >&2
  echo -e "\n    print help" >&2
  echo -e "      - $0 --help" >&2
  echo -e "      - $0 -h" >&2
  echo -e "\n    initialize edocker with alias " >&2
  echo -e "      - $0 --alias" >&2
  echo -e "      - $0 -a" >&2
  echo -e "\n    initialize edocker with alias in debug mode" >&2
  echo -e "      - $0 --debug --alias" >&2
  echo -e "      - $0 -d -a" >&2
  echo -e "\n    initialize edocker with symbolic links and default path" >&2
  echo -e "      - $0 --symboliclink" >&2
  echo -e "      - $0 -s" >&2
  echo -e "\n    initialize edocker with symbolic links and default path in debug mode" >&2
  echo -e "      - $0 --debug --symboliclink" >&2
  echo -e "      - $0 -d -s" >&2
  echo -e "\n    initialize edocker with symbolic links and specified path" >&2
  echo -e "      - $0 --symboliclink=/usr/local/bin/edocker" >&2
  echo -e "      - $0 -s=/usr/local/bin/edocker" >&2
  echo -e "\n    initialize edocker with symbolic links and specified path in debug mode" >&2
  echo -e "      - $0 --debug --symboliclink=/usr/local/bin/edocker" >&2
  echo -e "      - $0 -d -s=/usr/local/bin/edocker" >&2
  echo -e "\n    switch to edocker contribution mode " >&2
  echo -e "      - $0 --contribution" >&2
  echo -e "      - $0 -c" >&2
  echo -e "\n    switch to edocker contribution mode in debug mode" >&2
  echo -e "      - $0 --debug --contribution" >&2
  echo -e "      - $0 -d -c" >&2
}

# -----------------------------------------
# MAIN
# -----------------------------------------
while getopts "hvdcas:-:" option; do
  case $option in
    -)
        case "${OPTARG}" in
            debug)
                #val="${!OPTIND}"; OPTIND=$(( $OPTIND + 1 ))
                #echo "Parsing option: '--${OPTARG}', value: '${val}'" >&2;
                debug=true
                ;;
            contribution)
                #val="${!OPTIND}"; OPTIND=$(( $OPTIND + 1 ))
                #echo "Parsing option: '--${OPTARG}', value: '${val}'" >&2;
                [ "$processing" = "install.aliases" ] && echo -e "edocker:ERROR: Cannot specify option \"alias\" after specifying option \"contribution\"" && exit -1
                [ "$processing" = "install.symbolic_links" ] && echo -e "edocker:ERROR: Cannot specify option \"symboliclink\" after specifying option \"contribution\"" && exit -1
                processing="config.contribution"
                ;;
            alias)
                #val="${!OPTIND}"; OPTIND=$(( $OPTIND + 1 ))
                #echo "Parsing option: '--${OPTARG}', value: '${val}'" >&2;
                [ "$processing" = "config.contribution" ] && echo -e "edocker:ERROR: Cannot specify option \"contribution\" after specifying option \"aliases\"" && exit -1
                [ "$processing" = "install.symbolic_links" ] && echo -e "edocker:ERROR: Cannot specify option \"symboliclink\" after specifying option \"aliases\"" && exit -1
                processing="install.aliases"
                ;;
            symboliclink)
                #val="${!OPTIND}"; OPTIND=$(( $OPTIND + 1 ))
                #echo "Parsing option: '--${OPTARG}', value: '${val}'" >&2;
                [ "$processing" = "config.contribution" ] && echo -e "edocker:ERROR: Cannot specify option \"contribution\" after specifying option \"aliases\"" && exit -1
                [ "$processing" = "install.aliases" ] && echo -e "edocker:ERROR: Cannot specify option \"alias\" after specifying option \"symboliclink\"" && exit -1
                processing="install.symbolic_links"
                ;;
            symboliclink=*)
                #val=${OPTARG#*=}
                #opt=${OPTARG%=$val}
                #echo "Parsing option: '--${opt}', value: '${val}'" >&2
                [ "$processing" = "config.contribution" ] && echo -e "edocker:ERROR: Cannot specify option \"contribution\" after specifying option \"aliases\"" && exit -1
                [ "$processing" = "install.aliases" ] && echo -e "edocker:ERROR: Cannot specify option \"alias\" after specifying option \"symboliclink\"" && exit -1
                processing="install.symbolic_links"
                install.symbolic_links.path=${OPTARG#*=}
                ;;
            help)
                val=${OPTARG#*=}
                opt=${OPTARG%=$val}
                usage
                exit 2
                ;;
            *)
                if [ "$OPTERR" = 1 ] && [ "${optspec:0:1}" != ":" ]; then
                    echo "Unknown option --${OPTARG}" >&2
                fi
                ;;
        esac;;
    d)
      debug=true
      ;;
    c)
      [ "$processing" = "install.aliases" ] && echo -e "edocker:ERROR: Cannot specify option \"alias\" after specifying option \"contribution\"" && exit -1
      [ "$processing" = "install.symbolic_links" ] && echo -e "edocker:ERROR: Cannot specify option \"symboliclink\" after specifying option \"contribution\"" && exit -1
      processing="config.contribution"
      ;;
    a)
      [ "$processing" = "config.contribution" ] && echo -e "edocker:ERROR: Cannot specify option \"contribution\" after specifying option \"aliases\"" && exit -1
      [ "$processing" = "install.symbolic_links" ] && echo -e "edocker:ERROR: Cannot specify option \"symboliclink\" after specifying option \"aliases\"" && exit -1
      processing="install.aliases"
      ;;
    #TODO: SymbolicLinks WORK IN PROGRESS
    # s)
    #   echo -e "(s), symbolic links mode\n" >&2
    #   processing="install.symbolic_links"
    #   ;;
    # s=*)
    #   echo -e "(s), symbolic links mode\n" >&2
    #   processing="install.symbolic_links"
    #   ;;
    h)
      usage
      exit 2
      ;;
    \?)
      echo -e "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo -e "Option -$OPTARG requires an argument: " >&2
      echo -e "  -a : aliases mode, create file edocker.alias)." >&2
      echo -e "  -s : symbolic links mode, create symbolic links in given path)." >&2
      exit 1
      ;;
  esac
done

case $processing in
  config.contribution)
    printContribution
    swith2devMode "development"
    ;;
  install.aliases)
    buildAliases "release"
    ;;
  install.symbolic_links)
    #TODO: SymbolicLinks WORK IN PROGRESS
    #buildSymbolicLinks "release" $install.symbolic_links.path
    echo -e "edocker:WARNING: WORK IN PROGRESS, PLEASE USE option --alias/-a instead" >&2
    ;;
  \?)
    echo "Invalid processing argument: -$processing" >&2
    exit 1
    ;;
  :)
    echo "Processing must be one of followings : " >&2
    echo "  - config.contribution" >&2
    echo "  - install.aliases" >&2
    echo "  - install.symbolic_links" >&2
    exit 1
    ;;
esac

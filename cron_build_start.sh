#!/bin/bash
#shopt -s expand_aliases
source {edockerpath}/edocker.alias

cur_path=$PWD

function start() {
  echo $1
  #build
  cmd=$(alias edockerbuild|cut -d '=' -f2)
  cmd=${cmd//\'}
  cmd=${cmd#source}
  ( cd ${1} && bash $cmd )
  #rm
  cmd=$(alias edockerrm|cut -d '=' -f2)
  cmd=${cmd//\'}
  cmd=${cmd#source}
  ( cd ${1} && bash $cmd|yes)
  #run
  cmd=$(alias edockerrm|cut -d '=' -f2)
  cmd=${cmd//\'}
  cmd=${cmd#source}
  ( cd ${1} && bash $cmd|yes)
  #start
  cmd=$(alias edockerstart|cut -d '=' -f2)
  cmd=${cmd//\'}
  cmd=${cmd#source}
  ( cd ${1} && bash $cmd )
  #ps
  cmd=$(alias edockerps|cut -d '=' -f2)
  cmd=${cmd//\'}
  cmd=${cmd#source}
  ( cd ${1} && bash $cmd )
  cd $cur_path
}

if [ -n "$1" ] && [ -d "$1" ]; then
  for prop in $(find $1 -name edocker.properties); do
    active=$(cat $prop | grep -v "#" | grep "cron_start=true")
    if  [ -n "$active" ]; then
      dock_path=$(dirname $prop)
      start "$dock_path"
    fi
  done
else
  echo "ERROR: argument must be path of edocker.properties files"
fi

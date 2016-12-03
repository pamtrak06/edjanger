#!/bin/bash
#shopt -s expand_aliases

checkinstall=$(cat $0|grep -v checkinstall|grep "edjangerpath")
[ -n "$checkinstall" ]             && echo "edjanger:ERROR: Bad edjanger configuration, please run ./edjangerinstall.sh --alias from edjanger path" && exit -1

source {edjangerpath}/edjanger.alias

cur_path=$PWD

function start() {
  echo "path: $1"
  #start
  cmd=$(alias edjangerstart|cut -d '=' -f2)
  cmd=${cmd//\'}
  cmd=${cmd#source}
  ( cd ${1} && bash $cmd )
  #ps
  cmd=$(alias edjangerps|cut -d '=' -f2)
  cmd=${cmd//\'}
  cmd=${cmd#source}
  ( cd ${1} && bash $cmd )
}

if [ -n "$1" ] && [ -d "$1" ]; then
  for prop in $(find $1 -name edjanger.properties); do
    active=$(cat $prop | grep -v "#" | grep "cron_start=true")
    if  [ -n "$active" ]; then
      dock_path=$(dirname $prop)
      start "$dock_path"
    fi
  done
else
  echo "ERROR: argument must be path of edjanger.properties files"
fi

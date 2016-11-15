#!/usr/bin/env bats

@test "edockerinit test presence edocker.properties" {
  shopt -s expand_aliases
  . ../edocker.alias
  TMP=tmp_edockerinit
  mkdir $TMP
  cd $TMP
  . ../../scripts/init.sh
  result="$(ls edocker.properties)"
  [ -n "$result" ]
  cd ..
  rm -rf $TMP
}

@test "edockerinit test presence build/Dockerfile" {
  shopt -s expand_aliases
  . ../edocker.alias
  TMP=tmp_edockerinit
  mkdir $TMP
  cd $TMP
  . ../../scripts/init.sh
  result="$(ls build/Dockerfile)"
  [ -n "$result" ]
  cd ..
  rm -rf $TMP
}

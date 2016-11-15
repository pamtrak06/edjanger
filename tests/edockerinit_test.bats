#!/usr/bin/env bats

@test "edockerinit" {
  shopt -s expand_aliases
  source ../edocker.alias
  mkdir tmp_edockerinit
  cd tmp_dockerinit
  edockerinit
  result="$(ls edocker.properties)"
  [ -n "$result" ]
  cd ..
  rm -rf tmp_dockerinit
}

#!/usr/bin/env bats

@test "edockerinit" {
  shopt -s expand_aliases
  source /opt/edocker/edocker.alias
  mkdir /tmp/edocker_tests/edockerinit
  cd /tmp/edocker_tests/edockerinit
  edockerinit
  result="$(ls edocker.properties)"
  [ -n "$result" ]
}

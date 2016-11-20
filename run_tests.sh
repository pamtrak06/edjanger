#!/bin/bash
CURDIR=$PWD
./edjangerinstall.sh --alias
cd tests
/opt/bats/bin/bats edjanger_tests.bats
/opt/bats/bin/bats edjanger_platforms.bats
cd $CURDIR

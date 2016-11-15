#!/bin/bash
CURDIR=$PWD
cd tests
/opt/bats/bin/bats edocker_tests.bats
/opt/bats/bin/bats edocker_platforms.bats
cd $CURDIR

#!/bin/bash
# ------------------------------------------------------------------------------
##  Description
##    Run edjanger tests. Docker daemon must be alive.
##  
##  Usage
##    @script.name
##  
##  Command lines example:
##  
##  Help:
##     ./run_tests.sh
##            Run edjanger tests.
##  
##  Licence & authors
##     edjanger, The MIT License (MIT)
##     Copyright (c) 2016 copyright pamtrak06@gmail.com
##  
# ------------------------------------------------------------------------------
CURDIR=$PWD
./edjangerinstall.sh --alias
cd tests
/opt/bats/bin/bats edjanger_tests.bats
/opt/bats/bin/bats edjanger_platforms.bats
cd $CURDIR

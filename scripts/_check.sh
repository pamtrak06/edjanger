#!/bin/bash
# ------------------------------------------------------------------------------
##  Check path in edjanger scripts
##  
##  Usage:
##     ./_check.sh
##  
##  edjanger, The MIT License (MIT)
##  Copyright (c) 2016 copyright pamtrak06@gmail.com
##  
# ------------------------------------------------------------------------------
grep -nrw '.' -e "$PWD"

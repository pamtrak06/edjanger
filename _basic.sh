#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : _basic.sh
# DESCRIPTION      : scripts to create *.man files from docker basics commands (with no arguments)
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : . ./_basic.sh
# ----------------------------------------------------

sed "s/{command}/inspect/g" basic.man > inspect.man
sed "s/{command}/logs/g" basic.man > logs.man
sed "s/{command}/ps/g" basic.man > ps.man
sed "s/{command}/psa/g" basic.man > psa.man
sed "s/{command}/rm/g" basic.man > rm.man
sed "s/{command}/rmi/g" basic.man > rmi.man
sed "s/{command}/run/g" basic.man > run.man
sed "s/{command}/start/g" basic.man > start.man
sed "s/{command}/stop/g" basic.man > stop.man


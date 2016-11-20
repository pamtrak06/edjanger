#!/bin/bash
# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------
# SCRIPT           : _proxy_reset.sh
# DESCRIPTION      : unset proxy env. var.
# CREATOR          : pamtrak06@gmail.com
# --------------------------------
# VERSION          : 1.0
# DATE             : 2016-03-02
# COMMENT          : creation
# --------------------------------
# USAGE            : ./_proxy_reset.sh
# ----------------------------------------------------
if [ -f {edjangerpath}/edjanger.zip ]; then
  http_proxy=
  https_proxy=
  HTTP_PROXY=
  HTTPS_PROXY=
  proxy_args=
fi

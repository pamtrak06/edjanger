#!/bin/bash
# ------------------------------------------------------------------------------
##  Description
##    Unset proxy environment variables.
##  
##  Usage
##     ./_proxy_reset.sh
##  
##  Licence & authors
##     edjanger, The MIT License (MIT)
##     Copyright (c) 2016 copyright pamtrak06@gmail.com
##  
# ------------------------------------------------------------------------------

if [ -f {edjangerpath}/proxy.zip ]; then
  http_proxy=
  https_proxy=
  HTTP_PROXY=
  HTTPS_PROXY=
  proxy_args=
fi

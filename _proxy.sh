# ----------------------------------------------------
# The MIT License (MIT)
#
# Copyright (c) 2016 copyright pamtrak06@gmail.com
# ----------------------------------------------------

if [ -f "{edockerpath}/proxy.zip" ]; then
  if [ ! -f edocker.cfg ]; then
    echo -e "edocker:ERROR No edocker.cfg available, use \"<edockerinit>\" command to initialize one in this directory"
  else
    source edocker.cfg
    echo Initialize proxy parameters...
    unzip {edockerpath}/proxy.zip -d {edockerpath}/
    source {edockerpath}/proxy.cfg
    rm -f {edockerpath}/proxy.cfg
    proxy_args="--build-arg http_proxy=$http_proxy --build-arg https_proxy=$https_proxy"
  fi
else
  if [ -n "$HTTPS_PROXY" ]; then
    proxy_args="--build-arg HTTPS_PROXY=$HTTPS_PROXY"
  fi
  if [ -n "$HTTP_PROXY" ]; then
     proxy_args="--build-arg HTTP_PROXY=$HTTP_PROXY ${proxy_args}"$
  fi
  if [ -n "$https_proxy" ]; then
    proxy_args="--build-arg https_proxy=$https_proxy ${proxy_args}"
  fi
  if [ -n "$http_proxy" ]; then
    proxy_args="--build-arg http_proxy=$http_proxy ${proxy_args}"
  fi
fi

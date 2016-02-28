function usage_build()
{
  echo -e "-- edockerbuild --"
  echo -e "  # Configuration"
  echo -e "     - edocker.cfg parameters:"
  echo -e "       - image_name: name of image to be build"
  echo -e "       - build_args: arguments give to building image"
  echo -e "       - build_path: path where to find Dockerfile and his context"
  echo -e "   # Usage"
  echo -e "      edockerbuild"
}

function usage()
{
  if [ -z "$1" ]; then
    echo "Help must have one argument in list: build"
  elif [ "$1" = "build" ]; then
    usage_build
  fi
}

usage $1


function usage_build()
{
  echo -e "edockerbuild"
  echo -e "\n"
  echo -e "#configuration"
  echo -e "- edocker.cfg parameters:"
  echo -e "  - image_name: name of image to be build"
  echo -e "  - build_args: arguments give to building image"
  echo -e "  - build_path: path where to find Dockerfile and his context"
  echo -e "\n"$
  echo -e "#usage"
  echo -e "edockerbuild"
}

function usage()
{
  if [ "$1" = "build" ]; then
    usage_build
  fi
}

usage


if [ ! -f edocker.cfg ]; then
  echo -e "edocker:ERROR No edocker.cfg available, use \"<edockerinit>\" command to initialize one in this directory"
else
  source edocker.cfg
  echo "Images with \"none\" name will be deleted, is it ok for you (y/n) ?"
  read response
  if [ "y" = "$response" ]; then
    echo "Delete images with attribute \"none\"..."
    docker rmi ${force_rmi} $(docker images | grep none| awk '{print $3}')
  elif [ "n" != "$response" ]; then
    echo "Response must be \"y\" or \"n\""
  fi
fi
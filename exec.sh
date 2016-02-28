if [ ! -f edocker.cfg ]; then
  echo -e "edocker:ERROR No edocker.cfg available, use \"<edockerinit>\" command to initialize one in this directory"
else
  source edocker.cfg
  idx=$(echo "$(docker ps | grep ${image_name} | wc -l)+0" | bc)
  echo enter in container_name: ${container_name}_${idx}...
  if [ -n "$1" ]; then
    docker exec -t ${container_name}_${idx} bash -c "$1" 
  else
    docker exec -it ${container_name}_${idx} bash
  fi
fi

if [ ! -f edocker.cfg ]; then
  echo -e "edocker:ERROR No edocker.cfg available, use \"<edockerinit>\" command to initialize one in this directory"
else
  source edocker.cfg
  idx=$(echo "$(docker ps | grep ${image_name} | wc -l)+1" | bc)
  echo run container_name: ${container_name}_${idx}...
  docker run -dt --name ${container_name}_${idx} ${exposed_ports} ${shared_volumes} ${environment_variables} ${linked_containers} ${image_name}
fi

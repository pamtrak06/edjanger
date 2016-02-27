source edocker.cfg
idx=$(echo "$(docker ps | grep ${image_name} | wc -l)+0" | bc)
echo enter in container_name: ${container_name}_${idx}...
if [ -n "$1" ]; then
  docker exec -it ${container_name}_${idx} bash -c "$1" 
else
  docker exec -it ${container_name}_${idx} bash
fi

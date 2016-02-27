source edocker.cfg
idx=$(echo "$(docker ps | grep ${image_name} | wc -l)+0" | bc)
echo inspect container name:  ${container_name}_${idx}...
docker inspect ${container_name}_${idx}

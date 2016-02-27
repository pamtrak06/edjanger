source edocker.cfg
idx=$(echo "$(docker ps | grep ${image_name} | wc -l)+1" | bc)
echo start container name:  ${container_name}_${idx}...
docker start ${container_name}_${idx}

source edocker.cfg
idx=$(echo "$(docker ps | grep ${image_name} | wc -l)+0" | bc)
echo stop container name:  ${container_name}_${idx}...
docker stop ${container_name}_${idx}

source edocker.cfg
idx=$(echo "$(docker ps | grep ${image_name} | wc -l)+0" | bc)
echo rm container_name: ${container_name}_${idx}...
docker rm $(docker stop ${container_name}_${idx})

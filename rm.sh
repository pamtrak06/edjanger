if [ ! -f edocker.cfg ]; then
  echo -e "edocker:ERROR No edocker.cfg available, use \"<edockerinit>\" command to initialize one in this directory"
else
  source edocker.cfg
  idx=$(echo "$(docker ps -a|grep ${image_name}|wc -l)+0"|bc)
  if [ "0" = "${idx}" ]; then
    echo "No running or stopped container for image: \"${image_name}\" available"
  else
    echo "Container \"${container_name}_${idx}\" will be permanently erased, do you want to continue (y/n) ?"
    read response
    if [ "y" = "$response" ]; then
      if [ -n "$(docker ps -a|grep ${container_name}_${idx})" ]; then
        echo "Delete container: \"${container_name}_${idx}\"..."
        docker rm $(docker stop ${container_name}_${idx})
      else
        echo "Container \"${container_name}_${idx}\" does not exist"
      fi
    elif [ "n" != "$response" ]; then
      echo "Response must be \"y\" or \"n\""
    fi
  fi
fi
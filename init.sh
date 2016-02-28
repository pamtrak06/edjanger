if [ ! -f "edocker.cfg" ] && [ "{edockerpath}" != "$PWD" ]; then
  cp {edockerpath}/edocker.cfg.sample ./edocker.cfg
else
  echo -e "File edocker.cfg is already in your current directory !"
fi

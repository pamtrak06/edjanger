if [ ! -f "edocker.cfg" ] && [ "/usr/local/edocker" != "$PWD" ]; then
  cp /usr/local/edocker/edocker.cfg.sample ./edocker.cfg
else
  echo -e "File edocker.cfg is already in your current directory !"
fi

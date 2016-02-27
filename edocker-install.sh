edocker_path=/usr/local/edocker

source edocker.cfg

scripts=$(ls $edocker_path/*.sh | grep -v $(basename $0))
prefix=$(basename $curdir)
if [ -f $curdir/edocker.cfg ]; then
  echo -e "\n--- edocker: easy docker ---"
  echo -e "\n--- Installation for directory: [${prefix}]"
  echo -e "All parameters to configure commands are available in ${prefix}/edocker.cfg"
  rm -f ${prefix}.alias ${prefix}.unalias
  for s in $scripts; do
    base=$(basename $s)
    dalias=${prefix}${base%.sh}
    echo -e "  adding alias d${dalias} in \"aliases\" files..."
    echo "unalias d${dalias}" >> ${prefix}.unalias
    echo "alias d${dalias}=\". $edocker_path/$base\"" >> ${prefix}.alias
  done
  echo -e "\n--- Aliases files created. Run commands for (un)activation:"
  echo -e "  - \"<source ${prefix}.alias>\"   => aliases d${prefix}[docker command] are added"
  echo -e "  - \"<source ${prefix}.unalias>\" => aliases d${prefix}[docker command] are removed"
  echo -e "\n--- Check if aliases are activated or removed in your session by running:"
  echo -e "  - \"<alias|grep ${prefix}>\""
  if [ ! -f ~/.bash_aliases ] || [ -n "cat ~/.bash_aliases|grep ${prefix}.alias" ]; then
    echo -e "\n--- Updating aliases activation in ~/.bash_aliases for future sessions..."
    echo -e "source ${curdir}/${prefix}.alias" >> ~/.bash_aliases
    echo -e "\n"
  elif [ -f ~/.bash_aliases ] && [ -z "cat ~/.bash_aliases|grep ${prefix}.alias" ]; then
    echo -e "\n--- Bash configuration file ~/.bash_aliases already contain alias activation for ${prefix}.alias."
    echo -e "IF path must be updating, please change it in file ~/.bash_aliases."
    echo -e "Today's path definition:"
    echo -e "  - \"$(cat ~/.bash_aliases|grep ${prefix}.alias)\""
    echo -e "\n"
  fi
fi

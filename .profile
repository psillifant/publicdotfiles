# Determine type of host{{{
 if [[ "${HOME:1:1}" = 'U' ]]; then
   export hosttype=mac
 fi
# }}}

# Prompt {{{
 if [[ `basename $SHELL` -eq "bash" ]]; then
  export PS1="\e[0;34m(`echo ${SHELL:5:1}`) [\u@\h] \e[m \e[1;35m \W \e[m   >> "
 else
  export PS1="(`basename $SHELL`) [\$USER@] \$PWD  >> "
 fi
# }}}


# PATH {{{
  if [[ $hosttype = "mac" ]]; then   
    export PATH="$PATH:$HOME/.bin"
    export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home"
  else
    export PATH="$PATH:$HOME/bin"
  fi
# }}}

# Set default editor
  export EDITOR=/usr/bin/vim

# Aliases (Aliaii?)
  alias cp='cp -iv'           # Prompts if overwriting, and verbose output.
  alias mv='mv -iv'           # Prompts if overwriting, and verbose output.
  alias mkdir="mkdir -v"      # Verbose output.
  [[ "$hosttype" = "mac" ]] && alias which="type -all"     # Mirrors which functionality in Linux.
  alias ls="ls -p"


# Final echo to give some visual feedback that the profile has loaded.
  echo "Loaded default bash profile!"

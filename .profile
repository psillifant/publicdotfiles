# Prompt {{{
 if [[ `basename $SHELL` -eq "bash" ]]; then
  export PS1="\e[0;32m(`echo ${SHELL:5:1}`) [\u@\h] \e[m \e[1;35m \W \e[m   >> "
 else
  export PS1="(`basename $SHELL`) [\$USER@] \$PWD  >> "
 fi
# }}}


# PATH
  if [[ $hosttype = "mac" ]]; then   
    export PATH="$PATH:$HOME/.bin"
    export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home"
  else
    export PATH="$PATH:$HOME/bin"
  fi

# Set default editor
  export EDITOR=/usr/bin/vim

# Aliases (Aliaii?)
  alias cp='cp -iv'           # Prompts if overwriting, and verbose output.
  alias mv='mv -iv'           # Prompts if overwriting, and verbose output.
  alias mkdir="mkdir -v"      # Verbose output.
  alias which="type -all"     # Mirrors which functionality in Linux.
  alias ls="ls -p"
  alias aldur='ssh 192.168.1.100'
  alias belgarion='ssh 192.168.1.111'
  alias polgara='ssh 192.168.1.112'
  if [[ $hosttype = "mac" ]]; then
    alias gt_bin="cd /Users/k3st/GoogleDrive/Coding/git/bin"
  else
    alias gt_bin="cd /home/k3st/bin"
  fi

# Setup a function to edit the .profile quickly.
 if [[ $hosttype = "mac" ]]; then
   ed_profile(){
    export currdt=`date +"%Y%m%d__%H%M%S"`
    cp /Users/k3st/GoogleDrive/Coding/git/bin/k3st.profile /Users/k3st/GoogleDrive/Coding/git/bin/archive/k3st.profile.$currdt
    vi /Users/k3st/GoogleDrive/Coding/git/bin/k3st.profile
   }
 else
  ed_profile(){
   echo "Please edit on macbook and push to all hosts.  If you really need to edit the profile, it's /home/k3st/k3st.profile"
  }
 fi

# Setup a function to quickly reload the .profile if needed.
reload_profile(){
. ${profilepath}
}

# Setup a quick function to baseline a file.
orig(){
if [[ -f "$1" ]]; then
  cp -p "$1" "${1}.orig"
else
  echo "File $1, does not exist..."
fi
}

# Final echo to give some visual feedback that the profile has loaded.
  echo "Loaded default k3st bash profile!"

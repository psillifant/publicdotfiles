#! /bin/bash
[[ ! -z "${privatedotfiles}" ]] && installdir="$HOME/dotfiles" || installdir="$HOME"

export dt=`date +"%Y%m%d_%H%M%S"`

UsageStatement(){
    echo "install.sh (update)"
    echo ""
    echo "install.sh has a single argument accepted.  If the argument \"update\" is present, the script will first \
        update the git repository found at \$HOME/publicdotfiles."
}


if [[ ! -z "$1" ]]; then
    if [[ `echo ${1} | tr "[:upper:]" "[:lower:]"` = "terminal" ]]; then
        cp -p ~/Library/Preferences/com.apple.Terminal.plist ~/Library/Preferences/com.apple.Terminal.plist.${dt}
        cp ~/publicdotfiles/com.apple.Terminal ~/Library/Preferences/com.apple.Terminal.plist
        defaults read ~/Library/Preferences/com.apple.Terminal.plist
    else
        UsageStatement
        exit 3
    fi
fi

AddToProfile(){
    fileloc="$HOME/$1"
    [[ ! -f ${fileloc} ]] && return 1
    
    if [[ ! `grep 'Adding reference to standard .profile' ${fileloc}` ]]; then
        echo "# Adding reference to standard .profile" ${fileloc}
        echo ". $HOME/.profile.k3st" >> ${fileloc}
        addedtoprofile="true"
    fi
}

export source_dir="${installdir}/publicdotfiles"

UpdateLink(){
    source_file="${source_dir}/$1"
    target_file="$2/$1"


    if [[ "`readlink ${target_file}`" = "${source_file}" ]]; then
        echo "${target_file} already set to ${source_file}, taking no action."
        return 0
    elif [[ -f "${target_file}" ]]; then
        echo "${target_file} exists, and is not linked correctly to ${source_file}.  Taking no action"
        return 1
    else
        echo "${target_file} is not setup correctly.  Linking to ${source_file}"
        ln -s "${source_file}" "${target_file}"
    fi

    if [[ "$1" = ".profile.k3st" ]]; then
        addedtoprofile=""
        for fl in .bashrc .bash_profile .profile
        do
            echo "checking $fl"
            AddToProfile $fl
            [[ ! -z ${addedtoprofile} ]] && [[ "${addedtoprofile}" = "true" ]] && break
        done
    fi
}

UpdateLink ".profile.k3st" "$HOME"
UpdateLink ".vimrc" "$HOME"

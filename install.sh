#! /bin/bash

UsageStatement(){
    echo "install.sh (update)"
    echo ""
    echo "install.sh has a single argument accepted.  If the argument \"update\" is present, the script will first \
        update the git repository found at \$HOME/publicdotfiles."
}

if [[ "`echo $BASH_VERSION | cut -b 1`" -lt "4" ]]; then
    echo "Must be using Bash 4."
    exit 1
elif [[ "$#" -gt "0" ]]; then
    if [[ "${1,,}" = "update" ]]; then
        currdir="${pwd}"
        cd "$HOME/publicdotfiles"
        git fetch
        git pull
        cd ${currdir}
        if [[ "$?" != "0" ]]; then
            echo "Unable to update git repo at: $HOME/publicdotfiles, despite request to do so.  Exiting..."
            exit 2
        fi
    else
        echo UsageStatement
        exit 3
    fi
fi


export source_dir="$HOME/publicdotfiles"

UpdateLink(){
    source_file=${source_dir}/$1
    target_file=$HOME/$1


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
}

UpdateLink ".profile"
UpdateLink ".vimrc"

if [[ ! `grep '. $HOME/.profile' $HOME/.bash_profile` ]]; then
    echo ". $HOME/.profile" >> $HOME/.bash_profile
fi

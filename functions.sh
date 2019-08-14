#!/usr/bin/env bash

####################
# Define Functions #
####################

    function completeSSHHosts {
        COMPREPLY=()
        local currentWord=${COMP_WORDS[COMP_CWORD]}
        local completeHosts=$(
            cat ~/.ssh/config | awk -F ' ' '/Host /{print $2}'
        )

        COMPREPLY=($(compgen -W "$completeHosts" -- "$currentWord"))
        return 0
    }



#####################
# Execute Functions #
#####################

    complete -F completeSSHHosts ssh 

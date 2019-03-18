#! /bin/bash
#git clone https://github.com/psillifant/publicdotfiles ~/
ln -s ~/publicdotfiles/.profile ~/.profile
ln -s ~/publicdotfiles/.vimrc ~/.vimrc

[[ -f "$HOME/.bash_profile" ]] && echo ". $HOME/.profile" >> $HOME/.bash_profile

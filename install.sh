#! /bin/bash
#git clone https://github.com/psillifant/publicdotfiles ~/
ln -s ~/publicdotfiles/.profile ~/.profile
ln -s ~/publicdotfiles/.vimrc ~/.vimrc

[[ -f "~/.bash_profile" ]] && echo ". ~/.profile" >> ~/.bash_profile

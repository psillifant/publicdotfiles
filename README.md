# Public Dotfile - psillifant
This repository contains the dotfiles for git user `psillifant` to pull into new environments when required.

## Installing
To install, clone the repo to your home folder.  It should appear in home as a subfolder `publicdotfiles`:

```
git clone https://github.com/psillifant/publicdotfiles.git
```

## Updating com.apple.Terminal
To understand the current settings of your terminal, run the command `defaults read ~/Library/Preferences/com.apple.Terminal.plist`.  To update on a given mac, run `install.sh` with the option `terminal`.  I.e.:

```
~/publicdotfiles/install.sh terminal
```

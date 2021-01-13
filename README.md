# mydotfiles

## Prerequisites

`sudo apt-get install git vim vim-gtk3`

When connecting from ssh
`ssh -XY myhost`

## Install Vim Plug

`curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

## Set up Xmonad

`sudo vim /usr/share/xsessions/xmonad.desktop`

and add the following

`[Desktop Entry]
Name=XMonad
Comment=Lightweight tiling window manager
#Exec=xmonad-session
Exec=/home/iraklis/.xmonad-start
Icon=xmonad.png
Type=XSession`

### Set up greek keyboard

Check the `xmonad.hs` for using `language_switch.sh` 

`sudo vim /usr/bin/language_switch.sh`

and add the following:

```
#!/bin/bash
# LICENSE: PUBLIC DOMAIN
# switch between my layouts

# If an explicit layout is provided as an argument, use it. Otherwise, select the next layout from
# the set [us, it, fr].
if [[ -n "$1" ]]; then
      setxkbmap $1
    else
      layout=$(setxkbmap -query | awk 'END{print $2}')
      case $layout in
        us)
          setxkbmap gr
          ;;
        *)
          setxkbmap us
          ;;
      esac
    
    fi
```

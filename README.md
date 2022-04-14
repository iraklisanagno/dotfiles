# mydotfiles

## Prerequisites - Packages

**VIM/NVIM**  
```
sudo apt-get install git vim vim-gtk3 nvim
```
When connecting from ssh
`ssh -XY myhost`

*Install Vim Plug*  
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
[more info](https://github.com/junegunn/vim-plug)

Reload .vimrc and `:PlugInstall` to install plugins.

**tmux**  
```
sudo apt-get install tmux
```

**Xmonad, xmobar, and trayer**  
```
sudo apt-get install xmonad libghc-xmonad-dev libghc-xmonad-contrib-dev xmobar trayer
```

**feh and xscreensaver**  
```
sudo apt-get install feh xscreensaver
```

**Picom**  
More info in this [link](https://github.com/yshui/picom/). In my Ubuntu, picom is installed in `/usr/local/bin/`  


**Alacritty**  
```
source fonts_download.sh
sudo add-apt-repository ppa:aslatter/ppa
sudo apt update
sudo apt install alacritty
```

Remove alacritty  
```
sudo apt remove --auto-remove alacritty
sudo add-apt-repository --remove ppa:aslatter/ppa
sudo apt update
```

**fish shell**  
```
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish
chsh -s /usr/local/bin/fish
```
More info [here](https://github.com/fish-shell/fish-shell)  


**starship**  
```
sudo apt update
sudo apt install snapd
sudo snap install starship
```
Need to add `eval "$(starship init bash)"` at the end of `~/.bashrc`. It should be there in my files.  


**Other packages**  
```
sudo apt-get install dmenu rofi firefox brave
```


## Set up Xmonad

`sudo vim /usr/share/xsessions/xmonad.desktop`

and add the following

```
[Desktop Entry]
Name=XMonad
Comment=Lightweight tiling window manager
#Exec=xmonad-session
Exec=/home/iraklis/.xmonad-start
Icon=xmonad.png
Type=XSession
```

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

For Dropbox (if it does not synchronize) use this link:
https://askubuntu.com/questions/1166543/drop-box-is-not-syncing-in-ubuntu-18-04-3-lts

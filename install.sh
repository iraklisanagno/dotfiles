#!/bin/bash
CONFIG="config"

if [ ! -d "$CONFIG" ]; then
  echo "Creating config folder..."
  mkdir ${CONFIG}
fi

echo "Installing vim..."
cp ./vimrc {HOME}/.vimrc
echo "For VIM check README to install Vim Plug and other things"

echo "Installing nvim..."
if [ ! -d "$CONFIG/nvim" ]; then
  echo "Creating config/nvim folder"
  mkdir ${CONFIG}/nvim
fi
cp ./config/nvim/init.vim ${HOME}/.config/nvim/init.vim 

echo "Installing tmux..."
cp ./tmux.conf ${HOME}/.tmux.conf

echo "Update Xresources..."
cp ./Xresources ${HOME}/.Xresources 


echo "Installing Xmonad..."
if [ ! -d "xmonad" ]; then
  echo "Creating xmonad folder"
  mkdir xmonad
fi
cp ./xmonad/xmonad.hs ${HOME}/.xmonad/xmonad.hs 

echo "Installing Xmobar..."
if [ ! -d "xmonad" ]; then
  echo "Creating xmonad folder"
  mkdir xmonad
fi
cp ./xmonad/xmobarrc ${HOME}/.xmonad/xmobarrc 

echo "Installing feh..."
if [ ! -d "$CONFIG/feh" ]; then
  echo "Creating config/feh folder"
  mkdir ${CONFIG}/feh
fi
cp ./config/feh/set_background.sh ${HOME}/.config/feh/set_background.sh 
chmod +x ${HOME}/.config/feh/set_background.sh 

echo "Installing picom config..."
if [ ! -d "$CONFIG/picom" ]; then
  echo "Creating config/picom folder"
  mkdir ${CONFIG}/picom
fi
cp ./config/picom/picom.conf ${HOME}/.config/picom/picom.conf 

echo "Installing bashrc..."
cp ./bashrc ${HOME}/.bashrc 

echo "Installing alacritty..."
if [ ! -d "$CONFIG/alacritty" ]; then
  echo "Creating config/alacritty folder"
  mkdir ${CONFIG}/alacritty
fi
cp ./config/alacritty/alacritty.yml ${HOME}/.config/alacritty/alacritty.yml 

echo "Installing fish shell..."
if [ ! -d "$CONFIG/fish" ]; then
  echo "Creating config/fish folder"
  mkdir ${CONFIG}/fish
fi
cp ./config/fish/config.fish ${HOME}/.config/fish/config.fish 
cp ./config/fish/fish_variables ${HOME}/.config/fish/fish_variables 


echo "Installing starship..."
cp ./config/starship.toml ${HOME}/.config/starship.toml 

echo "Installing start-up script..."
cp ./xmonad-start ${HOME}/.xmonad-start 
chmod +x ${HOME}/.xmonad-start 

# echo "Updating wallpapers..."
# if [ ! -d "wallpapers" ]; then
#   echo "Creating wallpapers folder"
#   mkdir wallpapers
# fi
# cp -r ${HOME}/Pictures/wallpapers ./wallpapers

# TODO
# vscode for snippets
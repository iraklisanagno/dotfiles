#!/bin/bash
CONFIG="config"

if [ ! -d "$CONFIG" ]; then
  echo "Creating config folder..."
  mkdir ${CONFIG}
fi

echo "Updating vim..."
cp ${HOME}/.vimrc ./vimrc

echo "Updating nvim..."
if [ ! -d "$CONFIG/nvim" ]; then
  echo "Creating config/nvim folder"
  mkdir ${CONFIG}/nvim
fi
cp ${HOME}/.config/nvim/init.vim ./config/nvim/init.vim

echo "Updating tmux..."
cp ${HOME}/.tmux.conf  ./tmux.conf

echo "Update Xresources..."
cp .Xresources ./Xresources


echo "Updating Xmonad..."
if [ ! -d "xmonad" ]; then
  echo "Creating xmonad folder"
  mkdir xmonad
fi
cp ${HOME}/.xmonad/xmonad.hs ./xmonad/xmonad.hs

echo "Updating Xmobar..."
if [ ! -d "xmonad" ]; then
  echo "Creating xmonad folder"
  mkdir xmonad
fi
cp ${HOME}/.xmonad/xmobarrc ./xmonad/xmobarrc

echo "Updating feh..."
if [ ! -d "$CONFIG/feh" ]; then
  echo "Creating config/feh folder"
  mkdir ${CONFIG}/feh
fi
cp ${HOME}/.config/feh/set_background.sh ./config/feh/set_background.sh
chmod +x ./config/feh/set_background.sh

echo "Updating picom config..."
if [ ! -d "$CONFIG/picom" ]; then
  echo "Creating config/picom folder"
  mkdir ${CONFIG}/picom
fi
cp ${HOME}/.config/picom/picom.conf ./config/picom/picom.conf

echo "Updating bashrc..."
cp ${HOME}/.bashrc ./bashrc

echo "Updating alacritty..."
if [ ! -d "$CONFIG/alacritty" ]; then
  echo "Creating config/alacritty folder"
  mkdir ${CONFIG}/alacritty
fi
cp ${HOME}/.config/alacritty/alacritty.yml ./config/alacritty/alacritty.yml

echo "Update fish shell..."
if [ ! -d "$CONFIG/fish" ]; then
  echo "Creating config/fish folder"
  mkdir ${CONFIG}/fish
fi
cp ${HOME}/.config/fish/config.fish ./config/fish/config.fish
cp ${HOME}/.config/fish/fish_variables ./config/fish/fish_variables


echo "Update starship..."
cp ${HOME}/.config/starship.toml ./config/starship.toml

echo "Updating start-up script..."
cp ${HOME}/.xmonad-start ./xmonad-start
chmod +x xmonad-start

# echo "Updating wallpapers..."
# if [ ! -d "wallpapers" ]; then
#   echo "Creating wallpapers folder"
#   mkdir wallpapers
# fi
# cp -r ${HOME}/Pictures/wallpapers ./wallpapers

# TODO
# vscode for snippets
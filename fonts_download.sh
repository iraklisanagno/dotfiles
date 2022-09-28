#/bin/bash
# install DroidSansMono Nerd Font --> u can choose another at: https://www.nerdfonts.com/font-downloads
# echo "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DroidSansMono.zip"
# wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DroidSansMono.zip
# unzip DroidSansMono.zip -d ~/.local/share/fonts
# fc-cache -fv
# echo "done!"

# I use FiraCode now --> u can choose another at: https://www.nerdfonts.com/font-downloads
echo "[-] Download fonts [-]"
#echo "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip"
#wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip

echo "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Mononoki.zip"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Mononoki.zip
if [ ! -d "${HOME}/.local/shared/fonts" ]; then
  echo "Creating .local/shared/fonts folder..."
  mkdir -p ${HOME}/.local/shared/fonts
fi


unzip Mononoki.zip -d ~/.local/share/fonts
fc-cache -fv
echo "done!"

#!/bin/bash

echo "Neovim Configuration script - Ubuntu"
echo "Version: 0.1"
echo "Downloading Vim-plug..."
echo "Install vim-plug (https://github.com/junegunn/vim-plug)

if [ ! -x /usr/bin/curl] ; then
    apt get install curl
fi

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "2. install nvim"

sudo add-apt-repository -y ppa:neovim-ppa/stable > /dev/null 2>&1
sudo apt-get install neovim
sudo apt-get install python-dev python-pip python3-dev python3-pip
sudo pip3 install --upgrade pip
sudo pip3 install --upgrade neovim
sudo apt-get install build-essential cmake
sudo apt-get install python-dev python3-dev

echo "3. copying file init.vim..."

cd ~/.config/
dir="nvim"
if [[ ! -e $dir ]]; then
    mkdir $dir
elif [[ ! -d $dir ]]; then
    echo "$dir already exists but is not a directory" 1>&2
fi
cd nvim
wget https://raw.githubusercontent.com/duzypit/nvim-con/master/init.vim

echo "4. Run nvim, run command: :PlugInstall"

nvim +PluginInstall +qall

echo "5. compile YouCompleteMe cfamily support (Valloric/YouCompleteMe)"

cd ~/.vim/plugged/YouCompleteMe && ./install.py --clang-completer

echo ".ycm_extra_conf.py downloading..."

cd ~/.config/nvim/

wget https://raw.githubusercontent.com/duzypit/nvim-con/master/_ycm_extra_conf.py

mv _ycm_extra_conf.py .ycm_extra_conf.py
rm _ycm_extra_conf.py
cd ~/

echo "Done, bye..."


#!/bin/bash

cp .vimrc ~/.vimrc

echo
echo "vimrc installed into $HOME/.vimrc"
echo

mkdir -p ~/.vim/
rsync -vr .vim/ ~/.vim

echo
echo "Vim plugins installed into $HOME/.vim/"
echo

if [[ `uname` == 'Darwin' ]]; then
  # MacOS
  font_dir="$HOME/Library/Fonts"
else
  # Linux
  font_dir="$HOME/.fonts"
  mkdir -p $font_dir
fi

rsync -vr fonts/ "$font_dir"

# Reset font cache on Linux
if [[ -n `which fc-cache` ]]; then
  fc-cache -f $font_dir
fi

echo
echo "Fonts installed into $font_dir"


echo
echo "Installing CLANG completer dependencies"
sudo apt-get install cmake
sudo apt-get install python-dev libxml2-dev libxslt-dev

echo
echo "Configuring CLANG completer"
. ~/.vim/bundle/YouCompleteMe/install.py --clang-completer

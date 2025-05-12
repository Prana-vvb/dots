#!/bin/bash

DOTS=~/Downloads/dots/

if test -d $DOTS; then
    cd $DOTS
    git pull
else
    echo "Local dotfiles directory not found. Run git clone --depth 1 github.com/Prana-vvb/dots.git"
fi

cp -ru ~/.config/* $DOTS/config/
cp -ru ~/.scripts/* $DOTS/scripts/
cp -ru ~/.zsh/aliases ~/.zshrc ~/.zshenv $DOTS/zsh/
git status --porcelain

while true; do
    echo ""
    read -p "Do you want to commit these changes? (y/n) " yn

    case $yn in 
        [yY] ) 
            git add .
            git commit -m "Auto-sync dotfiles"
            git push -u origin main;
            break;;
        [nN] )
            echo "Changes uncommited. Removing newly added files"
            git restore .;
            exit;;
        * ) echo Invalid response;;
    esac
done

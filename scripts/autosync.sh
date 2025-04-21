#!/bin/bash

cp -ru ~/.config/* ~/Downloads/dots/config/
cp -ru ~/.scripts/* ~/Downloads/dots/scripts/
cp -ru ~/.zsh/aliases ~/Downloads/dots/zsh/
cp -ru ~/.zshrc ~/.zshenv ~/Downloads/dots/zsh/
cd ~/Downloads/dots/
git status

while true; do
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
        * ) echo invalid response;;
    esac
done

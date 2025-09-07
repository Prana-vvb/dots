#!/bin/bash

dots="$HOME/Downloads/dots/"
user="Prana-vvb"


if [ -d "$dots" ]; then
    cd "$dots"
    git pull
else
    echo "Local dotfiles directory not found. Cloning from $user/dots"
    git clone --depth 1 https://github.com/$user/dots.git $dots
    cd "$dots"
fi

if [ ! -d .git ]; then
    echo "Not in a Git repository. Exiting."
    exit 1
fi

cp -r "$HOME/.config"/* "$dots/config/"
cp -r "$HOME/.scripts"/* "$dots/scripts/"
cp -r "$HOME/.zsh/aliases" "$HOME/.zshrc" "$HOME/.zshenv" "$dots/zsh/"

if [ -z "$(git status --porcelain)" ]; then
    echo "No changes detected. Exiting."
    git clean -fdxq
    exit 0
fi

git status --porcelain

while true; do
    echo ""
    read -p "Do you want to commit these changes? (y/n) " yn

    case $yn in 
        [yY] ) 
            git add .
            git commit -m "Auto-sync dotfiles: $(date)"
            git push -u origin main;
            git clean -fdxq
            break;;
        [nN] )
            echo "Changes uncommited. Removing newly added files"
            git reset --hard
            git clean -fdxq;
            exit;;
        * ) echo Invalid response;;
    esac
done

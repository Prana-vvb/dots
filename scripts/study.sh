#!/bin/bash

DIR=~/Desktop/DevStuff/Reading/

PDF=$(find "$DIR" -type f -iname "*.pdf" | grep -v "PES2UG23CS928" | grep -v ".venv" | fzf)

if [[ -n "$PDF" ]]; then
    xdg-open "$PDF"
else
    echo "No PDF selected!"
fi

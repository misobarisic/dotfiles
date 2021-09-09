#!/bin/bash
#Create bash, zsh and fish config files

cat bashrc.base aliases > ~/.bashrc
cat zshrc.base aliases > ~/.zshrc
cat config.fish.base aliases | sed 's/$(/(/g' > ~/.config/fish/config.fish

echo "Config files successfully generated."

#!/bin/bash
#Create bash, zsh and fish config files

cat ~/.scripts/shell-config/bashrc.base ~/.scripts/shell-config/aliases > ~/.bashrc
cat ~/.scripts/shell-config/zshrc.base ~/.scripts/shell-config/aliases > ~/.zshrc
cat ~/.scripts/shell-config/config.fish.base ~/.scripts/shell-config/aliases | sed 's/$(/(/g' > ~/.config/fish/config.fish

echo "Config files successfully generated."

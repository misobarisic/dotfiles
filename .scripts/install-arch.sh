#!/bin/bash

install_path="$HOME/miso-install"

# Create install folder if not present
mkdir -p $install_path

# Delete previous miso-install folder contents
rm -rf $install_path/*

# Clone all repos (master)
git clone https://github.com/misobarisic/dotfiles "$install_path/dotfiles"
git clone https://github.com/misobarisic/dmenu "$install_path/dmenu"
git clone https://github.com/misobarisic/dwm "$install_path/dwm"
git clone https://github.com/misobarisic/dwmblocks "$install_path/dwmblocks"
git clone https://github.com/misobarisic/st "$install_path/st"
git clone https://github.com/misobarisic/surf "$install_path/surf"

# Make and install all software
cd "$install_path/dmenu"; sudo make clean install
cd "$install_path/dwm"; sudo make clean install
cd "$install_path/dwmblocks"; sudo make clean install
cd "$install_path/st"; sudo make clean install
cd "$install_path/surf"; sudo make clean install

# Copy dotfiles
cp "$install_path/dotfiles/.bashrc" "$HOME/"
cp "$install_path/dotfiles/.zshrc" "$HOME/"
cp -r "$install_path/dotfiles/.config" "$HOME/"
cp -r "$install_path/dotfiles/.scripts" "$HOME/"

# Pacman / Yay
sudo pacman -S --noconfirm yay-bin
yay -S --noconfirm vim neovim htop ranger nemo nautilus pcmanfm nitrogen bitwarden-bin firefox brave-bin vscodium-bin bat ristretto mirage gimp filezilla alacritty kitty urxvt xterm

echo "Installation complete!"
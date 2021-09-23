#!/bin/bash

install_path=$HOME/miso-install

# Create install folder if not present
mkdir -p $install_path

# Delete previous miso-install folder contents
rm -rf $install_path/*

# Clone all repos (master)
echo -e "[*] Cloning git repos..."
sleep 1
git clone https://github.com/misobarisic/dotfiles $install_path/dotfiles
git clone https://github.com/misobarisic/dmenu $install_path/dmenu
git clone https://github.com/misobarisic/dwm $install_path/dwm
git clone https://github.com/misobarisic/dwmblocks $install_path/dwmblocks
git clone https://github.com/misobarisic/st $install_path/st
git clone https://github.com/misobarisic/surf $install_path/surf

# Make and install all software
echo -e "[*] Installing dmenu..."; sleep 1
cd $install_path/dmenu; sudo make clean install
echo -e "[*] Installing dwm..."; sleep 1
cd $install_path/dwm; sudo make clean install
echo -e "[*] Installing dwmblocks..."; sleep 1
cd $install_path/dwmblocks; sudo make clean install
echo -e "[*] Installing st..."; sleep 1
cd $install_path/st; sudo make clean install
echo -e "[*] Installing surf..."; sleep 1
cd $install_path/surf; sudo make clean install

# Copy dotfiles
echo -e "[*] Copying dotfiles/config/backgrounds..."; sleep 1
cp $install_path/dotfiles/bashrc $HOME/.bashrc
cp $install_path/dotfiles/zshrc $HOME/.zshrc
cp $install_path/dotfiles/fonts.conf $HOME/.config/fontconfig/fonts.conf
cp $install_path/dotfiles/Xresources $HOME/.Xresources
mkdir -p $HOME/.bin
cp -r $install_path/dotfiles/bin/* $HOME/.bin/
mkdir -p $HOME/.config
cp -r $install_path/dotfiles/config/* $HOME/.config/
mkdir -p $HOME/.scripts
cp -r $install_path/dotfiles/scripts/* $HOME/.scripts/
mkdir -p $HOME/.local/share/fonts
cp -r $install_path/dotfiles/fonts/* $HOME/.local/share/fonts/

echo -e "[*] Refreshing font cache..."; fc-cache -v; sleep 1

# Dependencies
echo -e "[*] Installing dependencies..."; sleep 1
if grep "Arch\|Artix\|EndeavourOS\|Manjaro" /etc/*-release; then
       sudo pacman --noconfirm -Syu
       depends="bash zsh oh-my-zsh-git fish dunst vim neovim htop ranger nemo nautilus pcmanfm nitrogen picom lxappearance bitwarden-bin firefox brave-bin vscodium-bin bat ristretto mirage gimp filezilla alacritty kitty rxvt-unicode xterm starship pulseaudio pulseaudio-alsa python-pyalsa alsa-card-profiles alsa-firmware alsa-lib alsa-plugins alsa-topology-conf alsa-ucm-conf alsa-utils zita-alsa-pcmi"

       if [[ -e /usr/bin/paru ]]; then
           echo -e "[*] paru detected. Installing dependencies..."
           paru -S --noconfirm $depends
       elif [[ -e /usr/bin/yay ]]; then
           echo -e "[*] yay detected. Installing dependencies..."
           yay -S --noconfirm $depends
       else
           echo -e "[ERROR] AUR helper not found. Failed to download dependencies. Please install manually."
       fi

       sleep 1
else
	clear
    echo "[ERROR] Not on a Arch based system. Failed to download dependencies. Please install manually."

    sleep 1
fi

echo Installation complete!

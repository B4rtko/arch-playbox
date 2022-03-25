#!/usr/bin/env bash
echo "#################################################"
echo "Installing useful tools for arch"
echo "#################################################"


echo "Install man-db"
echo "-------------------------------------------------"
sudo pacman -S man-db --noconfirm

echo "Install htop"
echo "-------------------------------------------------"
sudo pacman -S htop --noconfirm

echo "Install yay helper"
echo "-------------------------------------------------"
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ~





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

echo "Install openssh"
echo "-------------------------------------------------"
sudo pacman -S openssh --noconfirm

echo "Install wget"
echo "-------------------------------------------------"
sudo pacman -S wget --noconfirm

echo "Install yay helper"
echo "-------------------------------------------------"
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ~
rm -rf yay

echo "Configure virtualbox guest utils"
echo "-------------------------------------------------"
sudo pacman -S virtualbox-guest-utils --noconfirm
sudo systemctl enable vboxservice.service

echo "#################################################"
echo "Reboot to apply virtualbox guest utils"
echo "#################################################"


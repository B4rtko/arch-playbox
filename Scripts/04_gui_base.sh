#!/usr/bin/env bash
echo "#################################################"
echo "Installing GUI environment (i3-WM)"
echo "#################################################"

echo "Install xorg, xorg-xinit and video driver (for virtualbox)"
echo "-------------------------------------------------"
sudo pacman -S xorg xorg-xinit --noconfirm
sudo pacman -S xf86-video-fbdev --noconfirm

echo "Install i3-WM an i3status"
echo "-------------------------------------------------"
yay -S i3-wm --noconfirm
sudo pacman -S i3status --noconfirm

echo "Install essensial tools for gui environment(web browser, compositor, terminal etc.)"
echo "-------------------------------------------------"
sudo pacman -S nitrogen --noconfirm # wallpaper - not necessary
sudo pacman -S picom --noconfirm # compositor - for managing popups' shadows
sudo pacman -S firefox --noconfirm # web browser
sudo pacman -S terminator --noconfirm # terminal - looks good, we could check out other ones though
sudo pacman -S rofi --noconfirm # dmenu - zmienić na rofi
sudo pacman -S polkit lxsession --noconfirm # not sure if polkit is essential; tools for gtk window for sudo authentication
sudo pacman -S mupdf --noconfirm
sudo pacman -S nautilus --noconfirm

echo "Download config for .xinitrc"
echo "-------------------------------------------------"
curl https://raw.githubusercontent.com/B4rtko/arch-playbox/main/Configs/xinitrc -o ~/.xinitrc

echo "Add configuration to .bash_profile"
echo "-------------------------------------------------"
echo '[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1' >> ~/.bash_profile

echo "Download wallpaper"
echo "-------------------------------------------------"
mkdir -p ~/Pictures
wget https://raw.githubusercontent.com/B4rtko/arch-wallpapers/main/Arch/Arch_12.png -O ~/Pictures/Arch_12.png

echo "Download config for i3-WM"
echo "-------------------------------------------------"
mkdir -p ~/.config/i3/
curl https://raw.githubusercontent.com/B4rtko/arch-playbox/main/Configs/i3_config -o ~/.config/i3/config

echo "Download config for picom"
echo "-------------------------------------------------"
mkdir -p ~/.config/picom/
curl https://raw.githubusercontent.com/B4rtko/arch-playbox/main/Configs/picom_config -o ~/.config/picom/picom.conf

echo "Download config for terminator"
echo "-------------------------------------------------"
mkdir -p ~/.config/terminator/
curl https://raw.githubusercontent.com/B4rtko/arch-playbox/main/Configs/terminator_config -o ~/.config/terminator/config

echo "#################################################"
echo "Reboot to run i3 Window Manager"
echo "#################################################"


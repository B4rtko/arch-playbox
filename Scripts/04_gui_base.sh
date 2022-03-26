#!/usr/bin/env bash
sudo pacman -S xorg xorg-xinit --noconfirm
sudo pacman -S xf86-video-fbdev --noconfirm
yay -S i3-wm --noconfirm
sudo pacman -S i3status --noconfirm

sudo pacman -S nitrogen --noconfirm # wallpaper - not necessary
sudo pacman -S picom --noconfirm # compositor - for managing popups' shadows
sudo pacman -S firefox --noconfirm # web browser
sudo pacman -S terminator --noconfirm # terminal - looks good, we could check out other ones though
sudo pacman -S rofi --noconfirm # dmenu - zmienić na rofi
sudo pacman -S polkit lxsession --noconfirm # not sure if polkit is essential; tools for gtk window for sudo authentication
sudo pacman -S mupdf --noconfirm
sudo pacman -S nautilus --noconfirm

curl https://raw.githubusercontent.com/B4rtko/arch-playbox/main/Configs/xinitrc -o ~/.xinitrc

echo '[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1' >> ~/.bash_profile

mkdir -p ~/Pictures
wget https://raw.githubusercontent.com/B4rtko/arch-wallpapers/main/Arch/Arch_12.png -O ~/Pictures/Arch_12.png

mkdir -p ~/.config/i3/
curl https://raw.githubusercontent.com/B4rtko/arch-playbox/main/Configs/i3_config -o ~/.config/i3/config

mkdir -p ~/.config/picom/
curl https://raw.githubusercontent.com/B4rtko/arch-playbox/main/Configs/picom_config -o ~/.config/picom/picom.conf

mkdir -p ~/.config/terminator/
curl https://raw.githubusercontent.com/B4rtko/arch-playbox/main/Configs/terminator_config -o ~/.config/terminator/config



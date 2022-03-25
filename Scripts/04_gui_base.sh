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

#cd ~
#git clone https://github.com/B4rtko/arch-playbox.git
#cp ~/arch-playbox/Configs/xinitrc ~/.xinitrc
curl https://raw.githubusercontent.com/B4rtko/arch-playbox/main/Configs/xinitrc -o ~/.xinitrc

echo '[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1' >> ~/.bash_profile

# configure i3:
#nano ~/.config/i3/config
#    focus_follows_mouse no # add to disable focus on mouse hover
    # comment out bindsym for dmenu and replace with rofi (if dmenu is default, but not sure)
    # change window kill binding from $mod+Shift+q to $mod+q (faster to use)

# for tiling window manager there is no polkit installed as default, so it is good idea to install it (it is used to give privillages when escalated)
#nano ~/.config/i3/config
    # add exec of lxsession on startup
#    exec --no-startup-id lxsession


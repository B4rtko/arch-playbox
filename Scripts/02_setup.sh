#!/usr/bin/env bash
echo "#################################################"
echo "Starting linux setup. Assuming existing network connectivity"
echo "#################################################"

echo "Setting Poland timezone and clock syncing"
echo "-------------------------------------------------"
ln -sf /usr/share/zoneinfo/Poland
hwclock --systohc

echo "Generating Polish locale file"
echo "-------------------------------------------------"
echo 'pl_PL.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen

echo "Setting hostname for Linux machine and localhost adresses"
echo "-------------------------------------------------"
echo "Please enter hostname for arch:"
read ARCH_HOSTNAME

echo ${ARCH_HOSTNAME} >> /etc/hostname

# write hostname
echo "    127.0.0.1    localhost" >> /etc/hosts
echo "    ::1          localhost" >> /etc/hosts
echo "    127.0.0.1    ${ARCH_HOSTNAME}.localdomain   ${ARCH_HOSTNAME}" >> /etc/hosts

echo "Setting password for host"
echo "-------------------------------------------------"
echo "Please enter password for arch host:"
passwd # set password for root
# enter and repeat password

echo "Creating user with sudo privileges"
echo "-------------------------------------------------"
echo "Please enter username for user with sudo privileges:"
read SUDO_USERNAME
useradd -m ${SUDO_USERNAME} # create new user
passwd ${SUDO_USERNAME} # set user password
usermod -aG wheel,audio,video,optical,storage ${SUDO_USERNAME} # add user to group with privileges

echo "Granting sudo privileges for wheel group"
echo "-------------------------------------------------"
pacman -S sudo --noconfirm
echo "%wheel ALL=(ALL:ALL) ALL" >> /etc/sudoers

echo "Configuring GRUB"
echo "-------------------------------------------------"
pacman -S grub --noconfirm
pacman -S efibootmgr dosfstools os-prober mtools --noconfirm
mkdir /boot/EFI
mount /dev/sda1 /boot/EFI
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
grub-mkconfig -o /boot/grub/grub.cfg
pacman -S nano vim git --noconfirm
systemctl enable NetworkManager

echo "Downloading 03_tools.sh and 04_gui_base.sh scripts to /usr/Scripts_autoinstall"
echo "-------------------------------------------------"
mkdir -p /usr/Scripts_autoinstall
curl https://raw.githubusercontent.com/B4rtko/arch-playbox/main/Scripts/03_tools.sh -o /usr/Scripts_autoinstall/03_tools.sh
curl https://raw.githubusercontent.com/B4rtko/arch-playbox/main/Scripts/04_gui_base.sh -o /usr/Scripts_autoinstall/04_gui_base.sh


echo "#################################################"
echo "#################################################"
echo " "
echo "Setup is finished. You should now run:"
echo "exit"
echo "umount -l /mnt"
echo "reboot"
echo " "
echo "#################################################"
echo "#################################################"


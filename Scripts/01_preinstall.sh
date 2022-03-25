#!/usr/bin/env bash
echo "#################################################"
echo "Starting preinstall steps. Assuming existing network connectivity"
echo "#################################################"

echo "Loading keymap as i386/qwerty/pl.map.gz"
echo "-------------------------------------------------"
# jak poniższe nie będzie działać to można grepować po ls /usr/share/kbd/keymaps/**/*pl.map.gz
loadkeys /usr/share/kbd/keymaps/i386/qwerty/pl.map.gz

echo "Setting time"
echo "-------------------------------------------------"
timedatectl set-ntp true

echo "Creating partitions on disk"
echo "-------------------------------------------------"

#lsblk
#echo "Please enter disk: (example /dev/sda)"
#read DISK

swapoff -a
umount -a
dd if=/dev/zero of=dev/sda bs=1M

yes | parted /dev/sda mklabel gpt
parted /dev/sda mkpart /dev/sda1 fat32 0% 550MiB
parted /dev/sda mkpart /dev/sda2 linux-swap 550MiB 2.5GiB
parted /dev/sda mkpart /dev/sda3 ext4 2.5GiB 100%

parted /dev/sda set 1 esp on  # ogarnąć czy jest potrzebne - w dokumentacji jest napisane że wsp to tryb boot dla tablicy gpt, ale ona już ma oznaczenie boot więc może nie jest potrzebne; jeśli nie przeszkadza to też nie zaszkodzi

echo "Formatting partitions"
echo "-------------------------------------------------"
mkfs.fat -F32 /dev/sda1

mkswap /dev/sda2
swapon /dev/sda2

mkfs.ext4 /dev/sda3

echo "Mounting filesystem"
echo "-------------------------------------------------"
mount /dev/sda3 /mnt

#echo "Installing Arch, Linux Kernel and NetworkManager"
#echo "-------------------------------------------------"
#pacstrap /mnt base base-devel  --noconfirm --needed
#pacstrap /mnt linux linux-firmware --noconfirm --needed
#pacstrap /mnt networkmanager --noconfirm --needed

echo "Saving filesystem table"
echo "-------------------------------------------------"
genfstab -U /mnt >> /mnt/etc/fstab

#echo "Logging to root on filesystem"
#echo "-------------------------------------------------"
#arch-chroot /mnt












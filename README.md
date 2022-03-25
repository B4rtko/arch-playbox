# arch-playbox
## Steps for automated installation with scripts:
1. Download preinstall script with curl command:
```
curl https://raw.githubusercontent.com/B4rtko/arch-playbox/main/Scripts/01_preinstall.sh -o 01_preinstall.sh
```
2. Ensure that disk for arch does not contain important data (WILL BE ERASED!)
3. Ensure that disk for arch is empty. Run:
```
lsblk
```
3.1. Example output that is acceptable for preinstall script:
```
NAME MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
loop0  7:0    0 657.4M  1 loop /run/archiso/airootfs
sda    8:0    0  20.5G  0 disk
sr0   11:0    1 812.3M  0 rom  /run/archiso/bootmnt
```

3.2. Example output that is unacceptable and ways of fixing:
```
NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
loop0    7:0    0 657.4M  1 loop /run/archiso/airootfs
sda      8:0    0  20.5G  0 disk
|-sda1   8:1    0   549M  0 part
|-sda2   8:2    0     2G  0 part [SWAP]
`-sda3   8:3    0    18G  0 part /
sr0     11:0    1 812.3M  0 rom  /run/archiso/bootmnt
```

3.2.1. If there is "[SWAP]" on one of partitions of our disk (in example partition sda2 on sda disk) run:
```
swapoff -a
```

3.2.2. If any of partitions of our disk have path written in MOUNTPOINTS run:
```
umount -a
```

3.2.3. If there are any partitions of out disk (in example sda1, sda2, sda3) run dd cmd on disk (in example there is /dev/sda disk, but it may has different path - watch on lsblk):
```
dd if=/dev/zero of=/dev/sda bs=1M
```

4. Run script with:
```
bash 01_preinstall.sh
```

5. After script with preinstall finishes there should be prompt slightly changed. Now to preceed download next script with command:
```
curl https://raw.githubusercontent.com/B4rtko/arch-playbox/main/Scripts/02_setup.sh -o 02_setup.sh
```

6. Run script with:
```
bash 02_setup.sh
```
6.1. You will be asked to type in hostname, host password (and repeat), username with root privileges and password for user (and repeat)



# Installation part One

# load keyboard layout
loadkeys de

# activate timecontrol over network
timedatectl set-ntp true

# format disk with fdisk
(
    echo o # Create a new empty DOS partition table
    echo n # Add a new partition
    echo p # Primary partition
    echo 1 # Partition number
    echo   # First sector (Accept default: 1)
    echo   # Last sector (Accept default: varies)
    echo a # Add a bootable flag to partition
    echo w # Write changes
) | sudo fdisk /dev/sda

# build ext4 filesystem on it
mkfs.ext4 /dev/sda1

# mount the new partition
mount /dev/sda1 /mnt

# Move Germany Mirror to Top
# ctrl+k (cut line) -> ctrl+u (insert line on top)
# ctrl+x -> y -> Enter
nano /etc/pacman.d/mirrorlist

# Mirrorlist edit:
# or move generated germany list
mv mirrorlist.txt /etc/pacman.d/mirrorlist

# install base system
pacstrap /mnt base base-devel intel-ucode vim

# generate file system table (fstab)
genfstab -p /mnt > /mnt/etc/fstab

# change root to /mnt
arch-chroot /mnt

# edit pacman
vim /etc/pacman.conf
  # include multilib for wine later

# sync databases
pacman -Sy

# install and configure GRUB
pacman -S grub os-prober git
grub-install --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

# remove bootable media, restart PC
exit
reboot
# Installation part Two

# set hostname
echo Lancelot > /etc/hostname

# language settings
echo LANG=en_US.UTF-8 > /etc/locale.conf
echo LC_MESSAGES=en_US.UTF-8 >> /etc/locale.conf

# remove # before your language
vim /etc/locale.gen
locale-gen

# keyboard layout
echo KEYMAP=de_latin1 > /etc/vconsole.conf

# timezone settings
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

# hosts
echo "<ip-address>  <hostname.domain.org>   <hostname>
127.0.0.1   localhost.localdomain   localhost
::1     localhost.localdomain   localhost" >> /etc/hosts

# edit pacman
vim /etc/pacman.conf
  # include multilib for wine later

# sync databases
pacman -Sy

# Possible to have encrypted root filesystem
# Create an initial ramdisk environment
mkinitcpio -p linux

# change root password
passwd
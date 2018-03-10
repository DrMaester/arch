# First make sure to have an internet connection:

systemctl enable dhcpcd@enp0s3.service
systemctl start dhcpcd@enp0s3.service

# sync databases
pacman -Sy

# install git
pacman -S git
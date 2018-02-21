#!/bin/bash

echo "deb http://ports.ubuntu.com/ubuntu-ports/ trusty main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb-src http://ports.ubuntu.com/ubuntu-ports/ trusty main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb http://ports.ubuntu.com/ubuntu-ports/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb-src http://ports.ubuntu.com/ubuntu-ports/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb http://ports.ubuntu.com/ubuntu-ports/ trusty-security main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb-src http://ports.ubuntu.com/ubuntu-ports/ trusty-security main restricted universe multiverse" >> /etc/apt/sources.list

apt-get update
apt-get -y upgrade
apt-get -y install \
    apt-utils locales language-pack-en-base language-pack-ru-base sudo isc-dhcp-client udev netbase ifupdown iproute openssh-server iputils-ping wget net-tools wireless-tools wpasupplicant ntpdate ntp less tzdata console-common module-init-tools

#echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
#    locale-gen en_US.UTF-8 && \
#    dpkg-reconfigure locales && \
#    /usr/sbin/update-locale LANG=en_US.UTF-8

echo "bcm40181" >> /etc/modules

echo "ubuntu-mk808" > /etc/hostname

echo "127.0.0.1   localhost ubuntu-mk808" > /etc/hosts

echo "auto eth0" > /etc/network/interfaces
echo "  iface eth0 inet dhcp" >> /etc/network/interfaces

useradd -m -p abc -s /bin/bash user
echo "user:user" | chpasswd
gpasswd -a user sudo

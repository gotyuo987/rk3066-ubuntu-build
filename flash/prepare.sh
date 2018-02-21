#!/bin/bash

#sudo apt-get install python-gtk2

target_dir="./rkflashkit"
if [ ! -d $target_dir ]; then 
  git clone https://github.com/linuxerwang/rkflashkit.git
fi  

cd $target_dir
./waf debian
sudo dpkg -i binaries/rkflashkit_0.1.1_all.deb

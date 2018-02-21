#!/bin/bash

target_dir="/src/rootfs"
if [ ! -d $target_dir ]; then 
  mkdir -p $target_dir
fi  

echo "=============== debootstrap  =================="
qemu-debootstrap --verbose --variant=minbase --arch=armhf --include=nano trusty $target_dir http://ports.ubuntu.com/ubuntu-ports

echo "=============== backup minibase ==============="
tar -pzcf /src/build/minbase.tar.gz -C $target_dir .

echo "=============== setting up fs=================="

cp chroot.sh $target_dir

mount -t proc proc $target_dir/proc && \
mount -t sysfs sysfs $target_dir/sys && \
mount -o bind /dev $target_dir/dev && \
mount -t devpts devpts $target_dir/dev/pts && \

chroot $target_dir ./chroot.sh

umount $target_dir/{proc,sys,dev/pts,dev,}

rm $target_dir/chroot.sh

echo "=============== backup rootfs ================"
tar -pzcf /src/build/linuxroot.tar.gz -C $target_dir .
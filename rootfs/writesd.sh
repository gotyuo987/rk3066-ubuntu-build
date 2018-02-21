#!/bin/bash

echo "=================== CREATING FILESYSTEM ==============="
mkfs.ext4 -L linuxroot $1

mnt_pnt="/tmp/mnt-linuxroot"

echo "=================== MOUNTING SD CARD =================="
mkdir $mnt_pnt
mount $1 $mnt_pnt

echo "=================== WRITING TARBALL ==================="
tar -pzxfv ./build/linuxroot.tar.gz -C $mnt_pnt

echo "=================== WRITING KERNEL FS ================="
rm -rf $mnt_pnt/lib/firmware
rm -rf $mnt_pnt/lib/modules

cp -rv ../kernel/build/mod_fw/* $mnt_pnt

chown root:root -R $mnt_pnt/lib/firmware
chown root:root -R $mnt_pnt/lib/modules

echo "=================== UNMOUNT AND SYNC =================="
umount $mnt_pnt
rm -r $mnt_pnt

sync
#!/bin/bash

echo "=================== CREATING FILESYSTEM ==============="
mkfs.ext4 -L linuxroot $1

mnt_pnt="/tmp/mnt-linuxroot"

echo "=================== MOUNTING SD CARD =================="
mkdir $mnt_pnt
mount $1 $mnt_pnt

echo "=================== WRITING TARBALL ==================="
tar -pzcf ./build/linuxroot.tar.gz -C $mnt_pnt .

echo "=================== UNMOUNT AND SYNC =================="
umount $mnt_pnt
rm -r $mnt_pnt

sync
#!/bin/bash

cd /src/rk3066/rk3x_kernel_3.0.36

cp config.galland .config && \

echo "====================== KERNEL  ======================"
export ARCH=arm && \
export CROSS_COMPILE=/src/rk3066/toolchains/arm-eabi-linaro-4.6.2/bin/arm-eabi- && \
    make -j4 


echo "====================== MODULES ======================"
target_dir="/src/build/mod_fw"
if [ ! -d $target_dir ]; then 
  mkdir -p $target_dir
fi
make modules_install INSTALL_MOD_PATH=$target_dir


echo "====================== IMAGE   ======================"
cd /src/rk3066
./tools/mkbootimg \
    --kernel rk3x_kernel_3.0.36/arch/arm/boot/Image \
    --ramdisk initramfs/fakeramdisk.gz \
    --base 60400000 \
    --pagesize 16384 \
    --ramdiskaddr 62000000 \
    -o /src/build/recovery.img